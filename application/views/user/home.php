<? 
		$session = $this->session->userdata('User');
		$query = $this->db->get_where('user', array('facebook_id' => $session['id']));
		foreach ($query->result() as $row) {
			echo $row->username . "<br/>";
			echo $row->name_first . " " . $row->name_last . "<br/>";
			echo $row->email_id . "<br/>";
		}
?>

<?php echo form_open('user/logout') ?>
<table>		
	<tr>
		<td colspan='2'>
			<input style='width:100%;' type='submit' name='logoutbutton' value='Logout' />
		</td>
	</tr>
</table>

</form>