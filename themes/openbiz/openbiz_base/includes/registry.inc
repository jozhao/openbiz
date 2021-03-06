<?php

/**
 * @file
 * registry.inc
 */

/**
 * Implements HOOK_theme().
 */
function _openbiz_base_theme(&$existing, $type, $theme, $path) {
  // If we are auto-rebuilding the theme registry, warn about the feature.
  // From Zen theme.
  if (
    // Don't display on update.php or install.php.
    !defined('MAINTENANCE_MODE')
    // Only display for site config admins.
    && function_exists('user_access') && user_access('administer site configuration')
    && theme_get_setting('openbiz_base_rebuild_registry')
    // Always display in the admin section, otherwise limit to three per hour.
    && (arg(0) == 'admin' || flood_is_allowed($GLOBALS['theme'] . '_rebuild_registry_warning', 3))
  ) {
    flood_register_event($GLOBALS['theme'] . '_rebuild_registry_warning');
    drupal_set_message(t('For easier theme development, the theme registry is being rebuilt on every page request. It is <em>extremely</em> important to <a href="!link">turn off this feature</a> on production websites.', array('!link' => url('admin/appearance/settings/' . $GLOBALS['theme']))), 'warning', FALSE);
  }

  // hook_theme() expects an array, so return an empty one.
  return array();
}
