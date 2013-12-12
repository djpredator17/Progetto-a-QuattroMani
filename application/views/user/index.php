<?=$this->session->userdata('username'); ?>

<?php echo form_open('sys_user/logout') ?>
<table>		
	<tr>
		<td colspan='2'>
			<input style='width:100%;' type='submit' name='logoutbutton' value='Logout' />
		</td>
	</tr>
</table>

</form>
