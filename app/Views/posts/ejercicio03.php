<h1 align="center">Ejercicio 3
    <br>Mostrar una tabla con el nombre completo del usuario, su cumpleaños y teléfono
además del título del post con status 0.</h1>

<br>

    <table border="10" width="100%">
    <thead>
    <tr style="background-color: aquamarine">
            <th>NOMBRE COMPLETO DE USUARIO</th>
            <th>CUMPLEAÑOS</th>
            <th>TELÉFONO</th>
            <th>TÍTULO DE POST</th>
            <th>STATUS INACTIVO</th>
        </tr>
    </thead>

    <tbody align="center">
    <?php foreach($posts as $post) : ?>
        <tr>
            <td><?= $post['Nombre Completo']; ?></td>
            <td><?= $post['birthday']; ?></td>
            <td><?= $post['phone']; ?></td>
            <td><?= $post['title']; ?></td>
            <td><?= $post['status']; ?></td>
            
        </tr>
    <?php endforeach; ?>
    </tbody>

    <tfoot>
    <tr style="background-color: aquamarine">
        <th>NOMBRE COMPLETO DE USUARIO</th>
            <th>CUMPLEAÑOS</th>
            <th>TELÉFONO</th>
            <th>TÍTULO DE POST</th>
            <th>STATUS INACTIVO</th>
        </tr>
    </tfoot>
</table>