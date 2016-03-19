<?php
/**
 * @file
 * openbiz_media_release_content.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function openbiz_media_release_content_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}
