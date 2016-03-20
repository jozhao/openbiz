<?php

/**
 * @file process.inc
 */

/**
 * Implements hook_process_html().
 */
function openbiz_base_process_html(&$variables, $hook) {
  // Flatten out html_attributes.
  $variables['html_attributes'] = drupal_attributes($variables['html_attributes_array']);
}

/**
 * Override or insert variables into the maintenance page template.
 *
 * @param $variables
 *   An array of variables to pass to the theme template.
 * @param $hook
 *   The name of the template being rendered ("maintenance_page" in this case.)
 */
function openbiz_base_process_maintenance_page(&$variables, $hook) {
  openbiz_base_process_html($variables, $hook);
  // Ensure default regions get a variable. Theme authors often forget to remove
  // a deleted region's variable in maintenance-page.tpl.
  foreach (array(
             'top',
             'navigation',
             'header',
             'highlighted',
             'help',
             'content',
             'featured',
             'sidebar_first',
             'sidebar_second',
             'footer',
             'bottom',
           ) as $region) {
    if (!isset($variables[$region])) {
      $variables[$region] = '';
    }
  }
}

/**
 * Implements hook_process_block().
 */
function openbiz_base_process_block(&$variables, $hook) {
  // Drupal 7 should use a $title variable instead of $block->subject.
  $variables['title'] = isset($variables['block']->subject) ? $variables['block']->subject : '';
}
