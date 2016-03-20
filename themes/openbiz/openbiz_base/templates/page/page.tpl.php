<?php
/**
 * @file
 * page.tpl.php - Returns the HTML for a single Drupal page.
 */
?>

<?php print render($page['top']); ?>

<?php print render($page['navigation']); ?>

<header id="header" class="header <?php print $container_class; ?>" role="banner">
  <?php print render($page['header']); ?>
</header><!-- /#page-header -->

<?php if (!empty($page['help'])): ?>
  <?php print render($page['help']); ?>
<?php endif; ?>

<?php if (!empty($page['highlighted'])): ?>
  <div class="highlighted jumbotron"><?php print render($page['highlighted']); ?></div>
<?php endif; ?>

<div id="main" class="main-container <?php print $container_class; ?>">
  <div id="content" class="row">
    <?php if (!empty($page['sidebar_first'])): ?>
      <aside class="col-sm-3" role="complementary">
        <?php print render($page['sidebar_first']); ?>
      </aside>  <!-- /#sidebar-first -->
    <?php endif; ?>
    <section id="main-content-section" class="<?php print $content_column_class; ?>" role="main">
      <?php if (!empty($breadcrumb)): print $breadcrumb; endif; ?>
      <a id="main-content"></a>
      <?php print render($title_prefix); ?>
      <?php if (!empty($title)): ?>
        <h1 class="page-header"><?php print $title; ?></h1>
      <?php endif; ?>
      <?php print render($title_suffix); ?>
      <?php print $messages; ?>
      <?php if (!empty($tabs)): ?>
        <?php print render($tabs); ?>
      <?php endif; ?>
      <?php if (!empty($action_links)): ?>
        <ul class="action-links"><?php print render($action_links); ?></ul>
      <?php endif; ?>
      <div id="page-content">
        <?php print render($page['content']); ?>
      </div>
      <?php if (!empty($page['featured'])): ?>
        <?php print render($page['featured']); ?>
      <?php endif; ?>
    </section>
    <?php if (!empty($page['sidebar_second'])): ?>
      <aside class="col-sm-3" role="complementary">
        <?php print render($page['sidebar_second']); ?>
      </aside>  <!-- /#sidebar-second -->
    <?php endif; ?>
  </div>
</div>

<?php if (!empty($page['footer'])): ?>
  <footer id="footer" class="footer <?php print $container_class; ?>">
    <?php print render($page['footer']); ?>
  </footer>
<?php endif; ?>

<div id="site-bottom" class="container">
  <div class="container">
    <div class="col-xs-12 col-sm-6">
      <p>
        <?php print t('Copyright') ?> &copy; <?php print $site_name; ?> <?php print date("Y"); ?>
      </p>
    </div>
    <div class="col-xs-12 col-sm-6">
      <?php print render($page['bottom']); ?>
    </div>
  </div>
</div>
