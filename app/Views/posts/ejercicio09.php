<h1 align="center">Ejercicio 9
    <br>En una tabla, mostrar el título del post, contenido del post y el nombre de la
categoria de todos los usuarios cuyo perfil sea administrador.
</h1>

<br>

<table border="10" align="center">
	<tr align="center" style="background-color: aquamarine">
		<td>TÍTULO DEL POST</td>
		<td>CONTENIDO</td>
		<td>CATEGORÍA</td>
		<td>ADMIN</td>
	</tr>
    <tbody align="center">
    <?php foreach($posts as $post) : ?>
        <tr>
            
            <td><?= $post['title']; ?></td>
            <td><?= $post['content']; ?></td>
			<td><?= $post['category']; ?></td>
            <td><?= $post['profile']; ?></td>     
        </tr>
    <?php endforeach; ?>

    </tbody>

	</tr>
</table>

<hr>