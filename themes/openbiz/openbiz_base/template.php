<?php

/**
 * @file
 * template.php
 */

/**
 * Clear any previously set element_info() static cache.
 *
 * If element_info() was invoked before the theme was fully initialized, this
 * can cause the theme's alter hook to not be invoked.
 *
 * @see https://www.drupal.org/node/2351731
 */
drupal_static_reset('element_info');

// Auto-rebuild the theme registry during theme development.
if (theme_get_setting('openbiz_base_rebuild_registry') && !defined('MAINTENANCE_MODE')) {
  // Rebuild .info data.
  system_rebuild_theme_data();
  // Rebuild theme registry.
  drupal_theme_rebuild();
}

/**
 * Implements HOOK_theme().
 */
function openbiz_base_theme(&$existing, $type, $theme, $path) {
  include_once './' . drupal_get_path('theme', 'openbiz_base') . '/includes/registry.inc';
  return _openbiz_base_theme($existing, $type, $theme, $path);
}

/**
 * Include hook_preprocess_*() hooks.
 */
include_once './' . drupal_get_path('theme', 'openbiz_base') . '/includes/preprocess.inc';

/**
 * Include hook_process_*() hooks.
 */
include_once './' . drupal_get_path('theme', 'openbiz_base') . '/includes/process.inc';

/**
 * Include hook_*_alter() hooks.
 */
include_once './' . drupal_get_path('theme', 'openbiz_base') . '/includes/alter.inc';
