<h1 align="center">Ejercicio 4
    <br>Mostrar una tabla con el username, nombre completo del usuario, cumpleaños y
una columna con el género (hombre/mujer) de todos los posts creados en el
año 2022.</h1>

<br>

    <table border="10" width="100%">
    <thead>
    <tr style="background-color: aquamarine">
            <th>USERNAME</th>
            <th>NOMBRE COMPLETO</th>
            <th>CUMPLEAÑOS</th>
            <th>GÉNERO</th>
            <th>POSTS 2022</th>

        </tr>
    </thead>

    <tbody align="center">
    <?php foreach($posts as $post) : ?>
        <tr>
            <td><?= $post['username']; ?></td>
            <td><?= $post['Nombre Completo']; ?></td>
            <td><?= $post['birthday']; ?></td>
            <td><?= $post['gender']; ?></td>
            <td><?= $post['created_at']; ?></td>
            
        </tr>
    <?php endforeach; ?>
    </tbody>

    <tfoot>
    <tr style="background-color: aquamarine">
        <th>USERNAME</th>
            <th>NOMBRE COMPLETO</th>
            <th>CUMPLEAÑOS</th>
            <th>GÉNERO</th>
            <th>POSTS 2022</th>
        </tr>
    </tfoot>
</table>