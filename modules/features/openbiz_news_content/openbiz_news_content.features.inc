<?php
/**
 * @file
 * openbiz_news_content.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function openbiz_news_content_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}
