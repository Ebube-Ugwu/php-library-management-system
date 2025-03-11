<?php

$router = new \Core\Router();

$router->get("/", "index");
$router->get("admin", "admin.index");
