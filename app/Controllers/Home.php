<?php

namespace App\Controllers;
    defined('BASEPATH') OR exit('No direct script access allowed');
class Home extends BaseController
{
    public function index(): string
    {
        return view('welcome_message');
    }

   public function obtenerDatos() {

        $query = $this->db->query("SELECT username, password, status, profile FROM users");
        return $query->result();
    }
}
