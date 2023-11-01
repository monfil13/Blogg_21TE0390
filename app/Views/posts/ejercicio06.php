<h1 align="center">Ejercicio 6
    <br> Mostrar una tabla con los siguientes datos: cantidad total de posts por
categoría, cantidad total de posts escritos por autor.</h1>

<br>


<table border="10" align="center">
	<tr align="center" style="background-color: aquamarine">
		<td>POSTS POR CATEGORÍA</td>
		<td>POSTS POR AUTOR</td>
	</tr>
	<tr align="center">
		<td>
			<?php foreach($postsPorCategoria as $ppc): ?>
				
				<?= $ppc['ppc'] . ' - ' . $ppc['ccategory'] . '<br />' ?>
			<?php endforeach; ?>
		</td>

		<td>
			<?php foreach($postsPorAutor as $ppa): ?>
				<?= $ppa['ppa'] . ' - ' . $ppa['pautor'] . '<br />' ?>
			<?php endforeach; ?>
		</td>

		
	</tr>
</table>
