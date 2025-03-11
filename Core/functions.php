<?php


function basePath($path){
    return BASE_PATH . $path;
}

function dotToSlash($path) {
   return str_replace(".", DIRECTORY_SEPARATOR, $path);
}

function view($path, $attr=[]) {
    if ($attr !== []) extract($attr, EXTR_PREFIX_SAME);
    $path = dotToSlash($path);
    require  basePath("views/{$path}.view.php");
    exit();
}

function dd($var) {
    echo "<pre>";
    var_dump($var);
    echo "</pre>";
    exit();
}

function previousUrl() {
    $url = $_SERVER["HTTP_REFERER"] ?? "/";
    header("Location: {$url}");
    exit();
}

function redirect($url) {
    header("Location: {$url}");    
}

function url($url) {
    return APP_URL . $url;
}
