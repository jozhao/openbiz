core = 7.x
api = 2

defaults[projects][subdir] = "contrib"

; Contrib modules

projects[admin_menu][version] = "3.0-rc5"
projects[adminimal_admin_menu][version] = "1.7"
projects[admin_views][version] = 1.5
projects[advanced_help][version] = 1.3
projects[addressfield][version] = "1.2"
projects[bigmenu][version] = "1.3"
projects[breakpoints][version] = "1.4"
projects[backup_migrate][version] = "3.1"
projects[block_class][version] = "2.3"
projects[ctools][version] = "1.9"
projects[chosen][version] = "2.0-beta4"
projects[ckeditor][version] = "1.17"
projects[context][version] = "3.6"
projects[content_lock][version] = "2.0"
projects[crumbs][version] = "2.3"
projects[countries][version] = 2.3
projects[chosen][version] = 2.x-dev
projects[chosen][download][type] = git
projects[chosen][download][revision] = e7a0d22
projects[chosen][download][branch] = 7.x-2.x
projects[facetapi][version] = "1.5"
projects[date][version] = "2.9"
projects[ds][version] = "2.13"
projects[diff][version] = "3.2"
projects[disqus][version] = "1.12"
projects[entity][version] = "1.6"
projects[entitycache][version] = "1.5"
projects[entityreference][version] = "1.1"
projects[entityreference][patch][] = "http://drupal.org/files/1580348-universal-formatters-17.patch"
projects[environment_indicator][version] = "2.8"
projects[entityform][version] = "2.0-rc1"
projects[eva][version] = "1.2"
projects[event_log][version] = "1.5"
projects[fontyourface][version] = 2.8
projects[features][version] = "2.7"
projects[features][patch][2143765] = "http://drupal.org/files/issues/features-fix-modules-enabled-2143765-1.patch"
projects[features][patch][2479803] = "https://www.drupal.org/files/issues/ignore_hidden_modules-2479803-1.patch"
projects[feeds][version] = "2.0-beta2"
projects[feeds_tamper][version] = "1.1"
projects[filefield_paths][version] = "1.0"
projects[field_group][version] = "1.5"
projects[field_extractor][version] = 1.3
projects[file_entity][version] = "2.0-beta2"
projects[fivestar][version] = "2.1"
projects[flag][version] = "3.7"
projects[flippy][version] = "1.4"
projects[fontello][version] = "1.0"
projects[globalredirect][version] = "1.5"
projects[google_analytics][version] = "2.1"
projects[hierarchical_select][version] = "3.0-beta3"
projects[icon][version] = "1.0-beta6"
projects[inline_conditions][version] = "1.0-alpha7"
projects[inline_entity_form][version] = "1.6"
projects[insert][version] = "1.3"
projects[image_delta_formatter][version] = "1.0-rc1"
projects[jquery_update][version] = "2.7"
projects[job_scheduler][version] = "2.0-alpha3"
projects[link][version] = 1.4
projects[libraries][version] = "2.2"
projects[linkchecker][version] = "1.2"
projects[linkit][version] = "3.5"
projects[login_destination][version] = "1.4"
projects[mailchimp][version] = "3.6"
projects[mailsystem][version] = 2.34
projects[mailsystem][patch][1534706] = "https://www.drupal.org/files/mailsystem.1534706.6.patch"
projects[mimemail][version] = 1.0-beta4
projects[migrate][version] = 2.8
projects[migrate_extras][version] = 2.5
projects[migrate_extras][patch][] = "http://drupal.org/files/migrate_extras-fix-destid2-array-1951904-4.patch"
projects[media][version] = "2.0-beta1"
projects[media_youtube][version] = "3.0"
projects[media_vimeo][version] = "2.1"
projects[menu_block][version] = "2.7"
projects[menu_attributes][version] = 1.0
projects[message][version] = 1.11
projects[message][patch][2629474] = https://www.drupal.org/files/issues/message-mysql57_compatibility-2629474-4.patch
projects[message_notify][version] = 2.5
projects[metatag][version] = "1.13"
projects[memcache][version] = "1.5"
projects[minisite][version] = "1.0-unstable3"
projects[module_permissions][version] = "1.1"
projects[module_filter][version] = 2.0
projects[multiform][version] = 1.1
projects[panels][version] = "3.5"
projects[pathauto][version] = 1.3
projects[plupload][version] = 1.7
projects[redirect][version] = "1.0-rc3"
projects[rules][version] = "2.9"
projects[r4032login][version] = "1.8"
projects[sharethis][version] = "2.12"
projects[strongarm][version] = "2.0"
projects[simplehtmldom][version] = "2.1"
projects[simplenews][version] = "1.1"
projects[stringoverrides][version] = "1.8"
projects[token][version] = "1.6"
projects[taxonomy_menu][version] = 1.5
projects[taxonomy_autolink][version] = "1.x-dev"
projects[taxonomy_display][version] = "1.1"
projects[taxonomy_manager][version] = "1.0"
projects[taxonomy_csv][version] = "5.10"
projects[themekey][version] = "3.4"
projects[title][version] = "1.0-alpha7"
projects[title][patch][] = "http://drupal.org/files/title-translation_overwrite-1269076-35.patch"
projects[uuid][version] = "1.0-beta1"
projects[views][version] = "3.13"
projects[views_megarow][version] = "1.5"
projects[views_bulk_operations][version] = "3.3"
projects[views_infinite_scroll][version] = "2.0-rc1"
projects[views_field_view][version] = "1.2"
projects[views_data_export][version] = "3.0-beta9"
projects[votingapi][version] = "2.12"
projects[workbench][version] = "1.2"
projects[workbench_access][version] = "1.4"
projects[workbench_moderation][version] = "1.4"
projects[webform][version] = "4.12"
projects[xmlsitemap][version] = "2.2"

; Search related modules.

projects[facetapi][version] = 1.5
projects[facetapi][patch][] = "https://drupal.org/files/1616518-term_remove_link-24.patch"
projects[facetapi][patch][2378693] = "https://www.drupal.org/files/issues/notice_undefined-2378693-3.patch"
projects[search_api][version] = 1.16
projects[search_api_db][version] = 1.5
projects[search_api_page][version] = "1.2"
projects[search_api_solr][version] = "1.9"
projects[search_api_ranges][version] = 1.5
projects[search_api_ranges][patch][] = "https://drupal.org/files/issues/search_api_ranges-rewrite-data-alteration-callback-2001846-4.patch"
projects[search_api_sorts][version] = 1.6
projects[search404][version] = "1.4"

; Internationalization

projects[variable][version] = 2.5
projects[i18n][version] = "1.13"
projects[lingotek][version] = 6.02
projects[l10n_update][version] = 2.0

; Security

projects[honeypot][version] = "1.21"
projects[login_security][version] = "1.9"
projects[logintoboggan][version] = "1.5"
projects[password_policy][version] = "1.12"
projects[paranoia][version] = "1.5"
projects[recaptcha][version] = "2.0"
projects[seckit][version] = "1.9"
projects[securepages][version] = "1.0-beta2"
projects[spamspan][version] = "1.x-dev"
projects[spamspan][download][type] = "git"
projects[spamspan][download][url] = "http://git.drupal.org/project/spamspan.git"
projects[spamspan][download][revision] = "cebf9dd3a360b466b498755fe800580e6b215646"
projects[shield][version] = "1.2"
projects[username_enumeration_prevention][version] = "1.2"

; Drupal Commerce and Commerce contribs.

projects[commerce][version] = 1.11
projects[commerce_addressbook][version] = 2.0-rc9
projects[commerce_add_to_cart_confirmation][version] = 1.0-rc2
projects[commerce_autosku][version] = 1.x-dev
projects[commerce_autosku][download][type] = git
projects[commerce_autosku][download][revision] = 32e86f4
projects[commerce_autosku][download][branch] = 7.x-1.x
projects[commerce_backoffice][version] = 1.5
projects[commerce_bank_transfer][version] = 1.0-alpha3
projects[commerce_checkout_redirect][version] = 2.0-rc1
projects[commerce_checkout_progress][version] = 1.4
projects[commerce_discount][version] = 1.0-alpha7
projects[commerce_extra_price_formatters][version] = 1.x-dev
projects[commerce_extra_price_formatters][download][type] = git
projects[commerce_extra_price_formatters][download][revision] = 1371336
projects[commerce_extra_price_formatters][download][branch] = 7.x-1.x
projects[commerce_exactor][version] = 1.3
projects[commerce_features][version] = 1.1
projects[commerce_flat_rate][version] = 1.0-beta2
projects[commerce_fancy_attributes][version] = 1.0
projects[commerce_migrate][version] = 1.2
projects[commerce_message][version] = 1.0-rc4
projects[commerce_paypal][version] = 2.3
projects[commerce_paypal][patch][2458721] = "https://www.drupal.org/files/issues/commerce_paypal-addressfield-default-values-2458721-1.patch"
projects[commerce_shipping][version] = 2.2
projects[commerce_search_api][version] = 1.4
projects[commerce_surcharge][version] = 1.x-dev
projects[eway_integration][version] = 1.6

; Themes

projects[adminimal_theme][version] = "1.24"

; Libraries

libraries[chosen][download][type] = "get"
libraries[chosen][download][url] = "https://github.com/harvesthq/chosen/releases/download/v1.5.1/chosen_v1.5.1.zip"
libraries[chosen][directory_name] = "chosen"
libraries[chosen][type] = "library"

libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.5.7/ckeditor_4.5.7_full.zip"
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][type] = "library"

libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://internode.dl.sourceforge.net/project/simplehtmldom/simplehtmldom/1.5/simplehtmldom_1_5.zip"
libraries[ckeditor][directory_name] = "simplehtmldom"
libraries[ckeditor][type] = "library"