<h1 align="center">Ejercicio 8
    <br>Mostrar una tabla con un resumen de las cantidades de posts escritos por
categoría y otro resumen de posts escritos por autor. Resaltar con un color
distinto el valor más alto y el más bajo en ambos resumenes.
</h1>

<br>

<table border="10" align="center">
<tr style="background-color: aquamarine">
		<td>CANTIDAD DE POSTS POR CATEGORÍA</td>
		<td>CANTIDAD DE POSTS POR AUTOR</td>
	</tr>

	<tr align="center">
        
		<td>
		<?php
		$postsPorCategorias = [2060, 2046, 2034,2032,2030,2027,2014,
			2001,1995,1994,1991,1983,1978,1939,1922,3,3,3,3,3];


		$valorEspecifico = max($postsPorCategorias);
		$valorEspecifico2 = min($postsPorCategorias);


		foreach ($postsPorCategorias as $valor) {
  		  if ($valor === $valorEspecifico) {
        echo '<p style="color: blue;">' . $valorEspecifico . '</p>';
    	} elseif ($valor === $valorEspecifico2) {
        echo '<p style="color: red;">' . $valorEspecifico2 . '</p>';
    	} else {
        echo '<p>' . $valor . '</p>';
    	}
	}
?>	
</td>


<td>
		<?php
		$postsPorAutores = [3738,3758,3773,3762,3678,3822,3691,3802,3,3,3
		,3,3,3,3,3,3,3,3,4];


		$valorSpecifico = max($postsPorAutores);
		$valorSpecifico2 = min($postsPorAutores);


		foreach ($postsPorAutores as $valorinde) {
  		  if ($valorinde === $valorSpecifico) {
        echo '<p style="color: blue;">' . $valorSpecifico . '</p>';
    	} elseif ($valorinde === $valorSpecifico2) {
        echo '<p style="color: red;">' . $valorSpecifico2 . '</p>';
    	} else {
        echo '<p>' . $valorinde . '</p>';
    	}
	}
?>	
</td>
		
</td>
        	
	</tr>
</table>

<br>