<?php
/**
 * @file
 * openbiz_components.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function openbiz_components_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}
