<?php

$basePath = 'C:/Users/Daniel Monfil/Downloads';
defined('BASEPATH', $basePath) OR exit('No direct script access allowed');

class Exportar extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('UserModel');
    }

    public function index() {
        $datos = $this->UserModel->obtenerDatos();

        $csvFileName = 'exportacionuser.csv';

        $this->load->dbutil();
        $this->load->helper('file');
        $this->load->helper('download');

        $csvData = $this->dbutil->csv_from_result($datos);

        write_file($csvFileName, $csvData);

        force_download($csvFileName, NULL);
    }
}


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "blogg";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$sql = "SELECT username, password, status, profile FROM users";
$result = $conn->query($sql);

$csvFileName = 'exportacionuser.csv';

$output = fopen($csvFileName, 'w');

fputcsv($output, array('username', 'password', 'status', 'profile'));

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        fputcsv($output, $row);
    }
}

fclose($output);
$conn->close();
echo "Datos exportados correctamente a $csvFileName";
?>