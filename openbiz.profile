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
 * Implements hook_install_tasks().
 */
function openbiz_install_tasks(&$install_state) {
  // Add installation step asking for additional languages to install.
  $tasks['openbiz_configure_translations_form'] = array(
    'display_name' => st('Configure languages'),
    'type' => 'form',
  );

  // Add batch process installing selected additional languages.
  $tasks['openbiz_import_translations'] = array(
    'display_name' => st('Import translations'),
    'type' => 'batch',
  );

  return $tasks;
}

/**
 * Installation task callback: returns the form allowing the user to select
 * additional languages to install.
 */
function openbiz_configure_translations_form() {
  // Provides predefined country list.
  include_once DRUPAL_ROOT . '/includes/iso.inc';

  $form['translations'] = array(
    '#type' => 'select',
    '#title' => st('Additional languages'),
    '#description' => st('Select additional languages to enable and download contributed interface translations.'),
    '#options' => _country_get_predefined_list(),
    '#multiple' => TRUE,
    '#size' => 10,
  );

  $form['submit'] = array(
    '#type' => 'submit',
    '#value' => st('Install selected languages'),
  );

  return $form;
}

/**
 * Submit callback: saves selected languages to be processed on the next step.
 */
function openbiz_configure_translations_form_submit(&$form, &$form_state) {
  variable_set('openbiz_selected_translations', $form_state['values']['translations']);
}

/**
 * Installation task callback: creates batch process to enable additional
 * languages and download relevant interface translations.
 */
function openbiz_import_translations() {
  include_once DRUPAL_ROOT . '/includes/locale.inc';
  module_load_include('check.inc', 'l10n_update');
  module_load_include('batch.inc', 'l10n_update');

  if ($translations = variable_get('openbiz_selected_translations', array())) {
    // No need to keep this variable anymore.
    variable_del('openbiz_selected_translations');

    // Prepare batch process to enable languages and download translations.
    $operations = array();
    foreach ($translations as $translation) {
      locale_add_language(strtolower($translation));

      // Build batch with l10n_update module.
      $history = l10n_update_get_history();
      $available = l10n_update_available_releases();
      $updates = l10n_update_build_updates($history, $available);

      $operations = array_merge($operations, _l10n_update_prepare_updates($updates, NULL, array()));
    }

    $batch = l10n_update_batch_multiple($operations, LOCALE_IMPORT_KEEP);
    return $batch;
  }
}

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
