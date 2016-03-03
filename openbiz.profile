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
