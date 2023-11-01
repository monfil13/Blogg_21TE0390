<h1 align="center">Ejercicio 5
    <br>Mostrar una tabla con los siguientes datos: cantidad total de usuarios
registrados, cantidad total de posts, cantidad total de comentarios, cantidad
total de categorias.</h1>

<br>


<table border="10" align="center">
<tr style="background-color: aquamarine">
		<td>USUARIOS</td>
		<td>PUBLICACIONES</td>
		<td>COMENTARIOS</td>
		<td>CATEGORÍAS</td>
	</tr>
	<tr>
		<td>
			<?php foreach($totalUsers as $tu): ?>
				<?= $tu['totalUsuarios'] ?>
			<?php endforeach; ?>
		</td>

		<td>
			<?php foreach($totalPosts as $tp): ?>
				<?= $tp['totalPublicaciones'] ?>
			<?php endforeach; ?>
		</td>

		<td>
			<?php foreach($totalComments as $tc): ?>
				<?= $tc['totalComentarios'] ?>
			<?php endforeach; ?>
		</td>

		<td>
			<?php foreach($totalCategories as $tcat): ?>
				<?= $tcat['totalCategorias'] ?>
			<?php endforeach; ?>
		</td>
	</tr>
</table>