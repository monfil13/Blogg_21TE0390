<h1 align="center">Ejercicio 10
    <br>En una tabla, mostrar el último post escrito por cada mujer menor de 30
años y el primer post escrito por cada hombre mayor de 16 años.
</h1>

<br>

<table border="10" align="center">
<tr style="background-color: aquamarine">
		<td>ESCRITO POR</td>
		<td>CANTIDAD</td>
		<td>NONMBRE DEL ÚLTIMO POST</td>
	</tr>
	<tr>
		<td>Mujeres menores a 30 años</td>

		<td>
			<?php foreach($postsEscritosPorMujeresMenor30 as $pepm30): ?>
				<?= $pepm30['pepm30'] ?>
			<?php endforeach; ?>
		</td>
    <?php foreach($postsM as $post) : ?>
        <td>
           
        </td>
    <?php endforeach; ?>
	</tr>
	<tr>
	
		<td>Hombres mayores a 16 años</td>

		<td>
			<?php foreach($postsEscritosPorHombresMayor16 as $peph16): ?>
				<?= $peph16['peph16'] ?>
			<?php endforeach; ?>
		</td>
		<?php foreach($postsH as $post) : ?>
        <td>
            <?= $post['title']; ?>
        </td>
    <?php endforeach; ?>

	</tr>
</table>

<hr>