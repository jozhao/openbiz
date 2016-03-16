<?php
/**
 * @file
 * openbiz_search.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function openbiz_search_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "facetapi" && $api == "facetapi_defaults") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_default_search_api_index().
 */
function openbiz_search_default_search_api_index() {
  $items = array();
  $items['openbiz_index'] = entity_import('search_api_index', '{
    "name" : "OpenBiz index",
    "machine_name" : "openbiz_index",
    "description" : null,
    "server" : "openbiz_sever",
    "item_type" : "node",
    "options" : {
      "datasource" : { "bundles" : [] },
      "index_directly" : 1,
      "cron_limit" : "50",
      "fields" : {
        "author" : { "type" : "integer", "entity_type" : "user" },
        "created" : { "type" : "date" },
        "field_blog_category" : { "type" : "list\\u003Cinteger\\u003E", "entity_type" : "taxonomy_term" },
        "field_blog_tags" : { "type" : "list\\u003Cinteger\\u003E", "entity_type" : "taxonomy_term" },
        "field_product_brand" : { "type" : "integer", "entity_type" : "taxonomy_term" },
        "field_product_category" : { "type" : "list\\u003Cinteger\\u003E", "entity_type" : "taxonomy_term" },
        "field_product_store" : { "type" : "list\\u003Cinteger\\u003E", "entity_type" : "commerce_product" },
        "field_product_tags" : { "type" : "list\\u003Cinteger\\u003E", "entity_type" : "taxonomy_term" },
        "nid" : { "type" : "integer" },
        "search_api_language" : { "type" : "string" },
        "status" : { "type" : "integer" },
        "title" : { "type" : "text" },
        "type" : { "type" : "string" }
      },
      "data_alter_callbacks" : {
        "commerce_search_api_product_display_filter" : { "status" : 0, "weight" : "-50", "settings" : [] },
        "search_api_alter_bundle_filter" : {
          "status" : 0,
          "weight" : "-49",
          "settings" : { "default" : "1", "bundles" : [] }
        },
        "commerce_search_api_alter_product_status" : { "status" : 1, "weight" : "-48", "settings" : [] },
        "search_api_alter_node_access" : { "status" : 0, "weight" : "-47", "settings" : [] },
        "search_api_alter_node_status" : { "status" : 1, "weight" : "-46", "settings" : [] },
        "search_api_ranges_alter" : { "status" : 1, "weight" : "-45", "settings" : { "fields" : [] } },
        "search_api_alter_add_aggregation" : { "status" : 1, "weight" : "-44", "settings" : [] },
        "search_api_alter_add_viewed_entity" : { "status" : 0, "weight" : "-43", "settings" : { "mode" : "full" } },
        "search_api_alter_add_url" : { "status" : 0, "weight" : "-42", "settings" : [] },
        "search_api_alter_add_hierarchy" : { "status" : 1, "weight" : "-41", "settings" : { "fields" : [] } }
      },
      "processors" : {
        "search_api_case_ignore" : {
          "status" : 1,
          "weight" : "0",
          "settings" : { "fields" : { "title" : true } }
        },
        "search_api_html_filter" : {
          "status" : 1,
          "weight" : "10",
          "settings" : {
            "fields" : { "title" : true },
            "title" : 0,
            "alt" : 1,
            "tags" : "h1 = 5\\r\\nh2 = 3\\r\\nh3 = 2\\r\\nstrong = 2\\r\\nb = 2\\r\\nem = 1.5\\r\\nu = 1.5"
          }
        },
        "search_api_tokenizer" : {
          "status" : 1,
          "weight" : "20",
          "settings" : {
            "fields" : { "title" : true },
            "spaces" : "[^[:alnum:]]",
            "ignorable" : "[\\u0027]"
          }
        },
        "search_api_stopwords" : {
          "status" : 1,
          "weight" : "30",
          "settings" : {
            "fields" : { "title" : true },
            "file" : "",
            "stopwords" : "but\\r\\ndid\\r\\nthe this that those\\r\\netc"
          }
        },
        "search_api_highlighting" : {
          "status" : 0,
          "weight" : "35",
          "settings" : {
            "prefix" : "\\u003Cstrong\\u003E",
            "suffix" : "\\u003C\\/strong\\u003E",
            "excerpt" : 1,
            "excerpt_length" : "256",
            "exclude_fields" : [],
            "highlight" : "always"
          }
        }
      }
    },
    "enabled" : "1",
    "read_only" : "0"
  }');
  return $items;
}

/**
 * Implements hook_default_search_api_server().
 */
function openbiz_search_default_search_api_server() {
  $items = array();
  $items['openbiz_sever'] = entity_import('search_api_server', '{
    "name" : "OpenBiz Sever",
    "machine_name" : "openbiz_sever",
    "description" : "",
    "class" : "search_api_db_service",
    "options" : {
      "database" : "default:default",
      "min_chars" : "1",
      "partial_matches" : 0,
      "indexes" : {
        "openbiz_index" : {
          "type" : {
            "table" : "search_api_db_openbiz_index",
            "column" : "type",
            "type" : "string",
            "boost" : "1.0"
          },
          "title" : {
            "table" : "search_api_db_openbiz_index_text",
            "type" : "text",
            "boost" : "1.0"
          },
          "field_product_store" : {
            "table" : "search_api_db_openbiz_index_field_product_store",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          },
          "field_product_category" : {
            "table" : "search_api_db_openbiz_index_field_product_category",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          },
          "field_product_brand" : {
            "table" : "search_api_db_openbiz_index",
            "column" : "field_product_brand",
            "type" : "integer",
            "boost" : "1.0"
          },
          "search_api_language" : {
            "table" : "search_api_db_openbiz_index",
            "column" : "search_api_language",
            "type" : "string",
            "boost" : "1.0"
          },
          "nid" : {
            "table" : "search_api_db_openbiz_index",
            "column" : "nid",
            "type" : "integer",
            "boost" : "1.0"
          },
          "status" : {
            "table" : "search_api_db_openbiz_index",
            "column" : "status",
            "type" : "integer",
            "boost" : "1.0"
          },
          "created" : {
            "table" : "search_api_db_openbiz_index",
            "column" : "created",
            "type" : "date",
            "boost" : "1.0"
          },
          "author" : {
            "table" : "search_api_db_openbiz_index",
            "column" : "author",
            "type" : "integer",
            "boost" : "1.0"
          },
          "field_product_tags" : {
            "table" : "search_api_db_openbiz_index_field_product_tags",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          },
          "field_blog_tags" : {
            "table" : "search_api_db_openbiz_index_field_blog_tags",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          },
          "field_blog_category" : {
            "table" : "search_api_db_openbiz_index_field_blog_category",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          }
        },
        "product_display" : {
          "nid" : {
            "table" : "search_api_db_product_display",
            "column" : "nid",
            "type" : "integer",
            "boost" : "1.0"
          },
          "type" : {
            "table" : "search_api_db_product_display",
            "column" : "type",
            "type" : "string",
            "boost" : "1.0"
          },
          "title" : {
            "table" : "search_api_db_product_display",
            "column" : "title",
            "type" : "string",
            "boost" : "1.0"
          },
          "status" : {
            "table" : "search_api_db_product_display",
            "column" : "status",
            "type" : "integer",
            "boost" : "1.0"
          },
          "created" : {
            "table" : "search_api_db_product_display",
            "column" : "created",
            "type" : "date",
            "boost" : "1.0"
          },
          "changed" : {
            "table" : "search_api_db_product_display",
            "column" : "changed",
            "type" : "date",
            "boost" : "1.0"
          },
          "field_product_store" : {
            "table" : "search_api_db_product_display_field_product_store",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          },
          "field_product_category" : {
            "table" : "search_api_db_product_display_field_product_category",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          },
          "field_product_brand" : {
            "table" : "search_api_db_product_display",
            "column" : "field_product_brand",
            "type" : "integer",
            "boost" : "1.0"
          },
          "field_product_tags" : {
            "table" : "search_api_db_product_display_field_product_tags",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          },
          "field_blog_tags" : {
            "table" : "search_api_db_product_display_field_blog_tags",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          },
          "field_blog_category" : {
            "table" : "search_api_db_product_display_field_blog_category",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          },
          "search_api_language" : {
            "table" : "search_api_db_product_display",
            "column" : "search_api_language",
            "type" : "string",
            "boost" : "1.0"
          },
          "field_product_store_commerce_price_amount_decimal_asc" : {
            "table" : "search_api_db_product_display",
            "column" : "field_product_store_commerce_price_amount_decimal_asc",
            "type" : "decimal",
            "boost" : "1.0"
          },
          "field_product_store_commerce_price_amount_decimal_desc" : {
            "table" : "search_api_db_product_display",
            "column" : "field_product_store_commerce_price_amount_decimal_desc",
            "type" : "decimal",
            "boost" : "1.0"
          },
          "search_api_aggregation_1" : {
            "table" : "search_api_db_product_display_text",
            "type" : "text",
            "boost" : "1.0"
          },
          "search_api_aggregation_2" : {
            "table" : "search_api_db_product_display_text",
            "type" : "text",
            "boost" : "1.0"
          },
          "search_api_aggregation_3" : {
            "table" : "search_api_db_product_display_text",
            "type" : "text",
            "boost" : "1.0"
          },
          "search_api_aggregation_4" : {
            "table" : "search_api_db_product_display_text",
            "type" : "text",
            "boost" : "1.0"
          },
          "search_api_aggregation_5" : {
            "table" : "search_api_db_product_display_text",
            "type" : "text",
            "boost" : "1.0"
          },
          "search_api_aggregation_6" : {
            "table" : "search_api_db_product_display_text",
            "type" : "text",
            "boost" : "1.0"
          },
          "field_product_store:field_product_size" : {
            "table" : "search_api_db_product_display_field_product_store_field_produc",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          },
          "field_product_store:field_product_color" : {
            "table" : "search_api_db_product_display_field_product_store_field_prod_1",
            "column" : "value",
            "type" : "list\\u003Cinteger\\u003E",
            "boost" : "1.0"
          },
          "field_product_category:name" : {
            "table" : "search_api_db_product_display_field_product_category_name",
            "column" : "value",
            "type" : "list\\u003Cstring\\u003E",
            "boost" : "1.0"
          },
          "field_product_brand:name" : {
            "table" : "search_api_db_product_display",
            "column" : "field_product_brand_name",
            "type" : "string",
            "boost" : "1.0"
          },
          "field_product_tags:name" : {
            "table" : "search_api_db_product_display_field_product_tags_name",
            "column" : "value",
            "type" : "list\\u003Cstring\\u003E",
            "boost" : "1.0"
          },
          "field_blog_tags:name" : {
            "table" : "search_api_db_product_display_field_blog_tags_name",
            "column" : "value",
            "type" : "list\\u003Cstring\\u003E",
            "boost" : "1.0"
          },
          "field_blog_category:name" : {
            "table" : "search_api_db_product_display_field_blog_category_name",
            "column" : "value",
            "type" : "list\\u003Cstring\\u003E",
            "boost" : "1.0"
          },
          "field_product_store:commerce_price:amount_decimal" : {
            "table" : "search_api_db_product_display_field_product_store_commerce_pri",
            "column" : "value",
            "type" : "list\\u003Cdecimal\\u003E",
            "boost" : "1.0"
          },
          "field_product_store:field_product_size:name" : {
            "table" : "search_api_db_product_display_field_product_store_field_prod_2",
            "column" : "value",
            "type" : "list\\u003Cstring\\u003E",
            "boost" : "1.0"
          },
          "field_product_store:field_product_color:name" : {
            "table" : "search_api_db_product_display_field_product_store_field_prod_3",
            "column" : "value",
            "type" : "list\\u003Cstring\\u003E",
            "boost" : "1.0"
          }
        }
      }
    },
    "enabled" : "1"
  }');
  return $items;
}
