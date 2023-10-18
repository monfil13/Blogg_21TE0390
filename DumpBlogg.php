<? namespace App\Controllers;

use CodeIgniter\Controller;

class ExportController extends Controller
{
    public function ExportarBasedatos()
    {
        // Carga la biblioteca de la base de datos
        $db = \Config\Database::connect();

        // Nombre del archivo de volcado
        $backupFileName = 'backup_' . date('Y-m-d_H-i-s') . '.sql';

        // Ruta completa del archivo de volcado
        $backupFilePath = WRITEPATH . 'backups/' . $backupFileName;

        // Comando para realizar el volcado de la base de datos
        $command = "C:/xampp/mysql/bin/mysqldump.exe -h {$db->getHostname()} -u {$db->getUsername()} -p{$db->getPassword()} {$db->getDatabase()} > {$backupFilePath}";

        // Ejecutar el comando
        exec($command, $output, $returnCode);

        // Verificar si el volcado fue exitoso
        if ($returnCode === 0) {
            // Configurar la respuesta HTTP para descargar el archivo
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . $backupFileName . '"');
            readfile($backupFilePath);

            // Eliminar el archivo de volcado después de la descarga
            unlink($backupFilePath);
        } else {
            echo 'Error al exportar la base de datos.';
        }
    }
}
?>