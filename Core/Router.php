<?php

namespace Core;


use Core\Response;


class Router
{
   protected $routes=[]; 

   protected function add($route)
   {
       $this->routes[] = $route;
       return $this;
   }
    
   public function get($uri, $controller, $middleware=null) 
   {
       $route = [
	    "uri" => $uri,
	    "controller" => $controller,
	    "method" => "GET",
	    "middleware" => $middleware 
       ];
       return $this->add($route);
   }

   public function post($uri, $controller, $middleware=null) 
   {
       $route = [
	    "uri" => $uri,
	    "controller" => $controller,
	    "method" => "POST",
	    "middleware" => $middleware 
       ];
       return $this->add($route);
   }

   public function patch($uri, $controller, $middleware=null) 
   {
       $route = [
	    "uri" => $uri,
	    "controller" => $controller,
	    "method" => "PATCH",
	    "middleware" => $middleware 
       ];
       return $this->add($route);
   }

   public function delete($uri, $controller, $middleware=null) 
   {
       $route = [
	    "uri" => $uri,
	    "controller" => $controller,
	    "method" => "DELETE",
	    "middleware" => $middleware 
       ];
       return $this->add($route);
   }

   public function put($uri, $controller, $middleware=null) 
   {
       $route = [
	    "uri" => $uri,
	    "controller" => $controller,
	    "method" => "PUT",
	    "middleware" => $middleware 
       ];
       return $this->add($route);
   }

   public function route($uri, $method)
   {
       foreach ($this->routes as $route) {
	   if ($route["uri"] === $uri){
	        require basePath("controllers/{$route['controller']}.php");
		exit();
	   }
	    return $this->abort(Response::NOT_FOUND);
       }
   }

   public function abort($code=404)
   {
        http_response_code($code);
	view($code); 
	exit();
   }
}
