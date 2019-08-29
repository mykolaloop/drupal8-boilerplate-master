<?php

/**
 * @file
 * Bootstrap drupal to allow autoload from modules src directory.
 */

use Drupal\Component\Utility\NestedArray;
use Drupal\Core\Config\FileStorage;
use Drupal\Core\DrupalKernel;
use Drupal\Core\Site\Settings;
use Symfony\Component\HttpFoundation\Request;

foreach (spl_autoload_functions() as list($autoloader)) {
  if ($autoloader instanceof \Composer\Autoload\ClassLoader) {
    break;
  }
}

$request = Request::createFromGlobals();
chdir(dirname(__DIR__) . '/../docroot');
$kernel = DrupalKernel::createFromRequest($request, $autoloader, 'prod', FALSE, dirname(__DIR__) . '/../docroot');
new Settings(NestedArray::mergeDeepArray([
  Settings::getAll(),
  [
    'bootstrap_config_storage' => function () {
      return new FileStorage(config_get_config_directory(CONFIG_SYNC_DIRECTORY));
    },
    'container_yamls' => [DRUPAL_ROOT . '/sites/development.services.yml'],
    'cache' => [
      'bins' => [
        'bootstrap' => 'cache.backend.null',
        'config' => 'cache.backend.null',
        'render' => 'cache.backend.null',
        'discovery' => 'cache.backend.null',
        'default' => 'cache.backend.null',
        'dynamic_page_cache' => 'cache.backend.null',
      ],
    ],
  ]
]));
$kernel->invalidateContainer();
$kernel->boot();
$kernel->preHandle($request);
chdir(dirname(__DIR__));
