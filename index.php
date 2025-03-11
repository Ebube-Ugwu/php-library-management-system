<?php

const BASE_PATH = __DIR__ . DIRECTORY_SEPARATOR;
const APP_URL = "/php-lms";

require "Core/functions.php";

require "vendor/autoload.php";
// require base_path("views/index.view.php");
require "Core/routes.php";

$uri = parse_url($_SERVER["REQUEST_URI"])["path"];
$uri = str_replace("/php-lms",  "", $uri);
$method = $_POST["_method"] ?? $_SERVER["REQUEST_METHOD"];

$router->route($uri, $method);
