<?php

/**
 * @file
 *
 * Enables modules and site configuration for a OpenBiz site installation.
 *
 * @copyright Copyright(c) 2015
 * @license GPL v2 http://www.fsf.org/licensing/licenses/gpl.html
 * @author XiNG Digital
 */

/**
 * Implements hook_install_tasks_alter().
 */
function openbiz_install_tasks_alter(&$tasks, $install_state) {

  // Set default site language to English.
  global $install_state;
  $install_state['parameters']['locale'] = 'en';
  // Hide 'Choose language' installation task.
  $tasks['install_select_locale']['display'] = FALSE;

  $tasks['_openbiz_install_finished'] = $tasks['install_finished'];
  unset($tasks['install_finished']);

  //_govcms_set_theme(OPENBIZ_INSTALL_DEFAULT_THEME);
}

/**
 * Overrides the core install_finished.
 */
function _openbiz_install_finished() {
  drupal_set_title(st('@drupal installation complete', array('@drupal' => drupal_install_profile_distribution_name())), PASS_THROUGH);
  $messages = drupal_set_message();
  $output = '<p>' . st('Congratulations, you installed @drupal!', array('@drupal' => drupal_install_profile_distribution_name())) . '</p>';
  $output .= '<p>' . (isset($messages['error']) ? st('Review the messages above before visiting <a href="@url">your new site</a>.', array('@url' => url(''))) : st('<a href="@url" class="button">Visit your new site</a>', array('@url' => url('')))) . '</p>';

  // Flush all caches to ensure that any full bootstraps during the installer
  // do not leave stale cached data, and that any content types or other items
  // registered by the installation profile are registered correctly.

  variable_set('features_rebuild_on_flush', FALSE);
  drupal_flush_all_caches();

  // Remember the profile which was used.
  variable_set('install_profile', drupal_get_profile());

  // Installation profiles are always loaded last.
  db_update('system')
    ->fields(array('weight' => 1000))
    ->condition('type', 'module')
    ->condition('name', drupal_get_profile())
    ->execute();

  // Cache a fully-built schema.
  drupal_get_schema(NULL, TRUE);

  // Run cron to populate update status tables (if available) so that users
  // will be warned if they've installed an out of date Drupal version.
  // Will also trigger indexing of profile-supplied content or feeds.
  drupal_cron_run();
  variable_set('features_rebuild_on_flush', TRUE);

  return $output;
}

/**
 * A trick to enforce page refresh when theme is changed from an overlay.
 */
function openbiz_admin_paths_alter(&$paths) {
  $paths['admin/appearance/default*'] = FALSE;
}

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function openbiz_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = 'OpenBiz';
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['server_settings']['site_default_country']['#default_value'] = 'AU';
  if (!empty($_SERVER['HTTP_HOST'])) {
    $form['admin_account']['account']['mail']['#default_value'] = 'admin@' . $_SERVER['HTTP_HOST'];
    $form['site_information']['site_mail']['#default_value'] = 'admin@' . $_SERVER['HTTP_HOST'];
  }
}

/**
 * Implements hook_system_info().
 */
function openbiz_system_info_alter(&$info, $file, $type) {
  // This module is not needed for general feature listing on 99.9% of sites.
  if ($file->name == 'date_migrate_example') {
    $info['hidden'] = 1;
  }
}
