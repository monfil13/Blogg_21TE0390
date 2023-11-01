<h1 align="center">Ejercicio 1
    <br>Mostrar tabla con el id del post, el nombre de la categoría, el nombre del
usuario de los posts publicados en el año 2023.</h1>

<br>

    <table border="10" width="100%">
    <thead>
        <tr style="background-color: aquamarine">
            <th>POST ID</th>
            <th>CATEGORÍA</th>
            <th>PUBLICACIÓN</th>
            <th>USERNAME</th>
            <th>PUBLICACIÓN</th>
        </tr>
    </thead>

    <tbody align="center">
    <?php foreach($posts as $post) : ?>
        <tr>
            <td><?= $post['id']; ?></td>
            <td><?= $post['category']; ?></td>
            <td><?= $post['title']; ?></td>
            <td><?= $post['username']; ?></td>
            <td><?= $post['created_at']; ?></td>
            
        </tr>
    <?php endforeach; ?>
    </tbody>

    <tfoot>
        <tr>
        <th>POST ID</th>
            <th>CATEGORÍA</th>
            <th>PUBLICACIÓN</th>
            <th>USERNAME</th>
            <th>PUBLICACIÓN</th>
        </tr>
    </tfoot>
</table>