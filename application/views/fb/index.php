<table style='border:1px solid black'>

	<? foreach ($facebook as $key=>$fb): ?>
		<tr>
			<td>
				<?=$key?>
			</td>
			<td>
				<?=$fb?>
			</td>
		</tr>
	<?php endforeach; ?>
	
</table>

<a href='fb/insertuser'>Inserisci questi dati nel database.</a> <br/>