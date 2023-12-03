<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');
$routes->get('users', 'UserController::index');
$routes->get('users/usuarios', 'UserController::usuarios');
$routes->get('users/usuarios2', 'UserController::usuarios2');
$routes->get('users/usuarios3', 'UserController::usuarios3');

$routes->get('posts/consulta01', 'PostController::ejercicio01');
$routes->get('posts/consulta02', 'PostController::ejercicio02');
$routes->get('posts/consulta03', 'PostController::ejercicio03');
$routes->get('posts/consulta04', 'PostController::ejercicio04');
$routes->get('posts/consulta05', 'PostController::ejercicio05');
$routes->get('posts/consulta06', 'PostController::ejercicio06');
$routes->get('posts/consulta07', 'PostController::ejercicio07');
$routes->get('posts/consulta08', 'PostController::ejercicio08');
$routes->get('posts/consulta09', 'PostController::ejercicio09');
$routes->get('posts/consulta10', 'PostController::ejercicio10');