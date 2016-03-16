<?php
/**
 * @file
 * openbiz_product.features.taxonomy.inc
 */

/**
 * Implements hook_taxonomy_default_vocabularies().
 */
function openbiz_product_taxonomy_default_vocabularies() {
  return array(
    'product_brand' => array(
      'name' => 'Product brand',
      'machine_name' => 'product_brand',
      'description' => '',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
    ),
    'product_category' => array(
      'name' => 'Product category',
      'machine_name' => 'product_category',
      'description' => '',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
    ),
    'product_color' => array(
      'name' => 'Product color',
      'machine_name' => 'product_color',
      'description' => '',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
    ),
    'product_size' => array(
      'name' => 'Product size',
      'machine_name' => 'product_size',
      'description' => '',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
    ),
    'product_tags' => array(
      'name' => 'Product tags',
      'machine_name' => 'product_tags',
      'description' => '',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
    ),
  );
}
