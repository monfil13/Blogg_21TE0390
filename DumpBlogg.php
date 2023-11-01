<? namespace App\Controllers;

use CodeIgniter\Controller;

class ExportController extends Controller
{
    public function ExportarBasedatos()
    {
        $db = \Config\Database::connect();

        $backupFileName = 'backup_' . date('Y-m-d_H-i-s') . '.sql';

        $backupFilePath = WRITEPATH . 'backups/' . $backupFileName;

        $command = "C:/xampp/mysql/bin/mysqldump.exe -h {$db->getHostname()} -u {$db->getUsername()} -p{$db->getPassword()} {$db->getDatabase()} > {$backupFilePath}";

        exec($command, $output, $returnCode);
        if ($returnCode === 0) {
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . $backupFileName . '"');
            readfile($backupFilePath);


            unlink($backupFilePath);
        } else {
            echo 'Error al exportar la base de datos.';
        }
    }
}
?>
