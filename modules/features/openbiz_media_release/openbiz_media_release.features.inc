<?php
/**
 * @file
 * openbiz_media_release.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function openbiz_media_release_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_node_info().
 */
function openbiz_media_release_node_info() {
  $items = array(
    'media_release' => array(
      'name' => t('Media Release'),
      'base' => 'node_content',
      'description' => t('<em>Media releases</em> can be used to list the latest official releases distributed to the media.'),
      'has_title' => '1',
      'title_label' => t('Title'),
      'help' => '',
    ),
  );
  drupal_alter('node_info', $items);
  return $items;
}
