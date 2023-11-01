<h1 align="center">Ejercicio 2
    <br>Mostrar una tabla con el nombre del post y el nombre completo del autor de
la última categoría registrada en la base de datos.</h1>

<br>

    <table border="10" width="100%">
    <thead>
    <tr style="background-color: aquamarine">
            <th>NOMBRE DEL ÚLTIMO POST</th>
            <th>NOMBRE COMPLETO DEL AUTOR</th>
            <th>ÚLTIMA CATEGORÍA</th>
        </tr>
    </thead>

    <tbody align="center">
    <?php foreach($posts as $post) : ?>
        <tr>
            <td><?= $post['title']; ?></td>
            <td><?= $post['Nombre Completo']; ?></td>
            <td><?= $post['category']; ?></td>
        </tr>
    <?php endforeach; ?>
    </tbody>

    <tfoot>
    <tr style="background-color: aquamarine">
        <th>NOMBRE DEL ÚLTIMO POST</th>
        <th>NOMBRE COMPLETO DEL AUTOR</th>
        <th>ÚLTIMA CATEGORÍA</th>
        </tr>
    </tfoot>
</table>


