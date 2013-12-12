

<h2>Login</h2>

<?php echo validation_errors(); ?>

<?php echo form_open('user/login') ?>

<table>
	<tr>
		<td colspan='2'>
		<?php 

$ses_user=$this->session->userdata('User');
if(empty($ses_user))   { 
	echo img(array('src'=>base_url().'images/facebook_it.png','id'=>'facebook','style'=>'width:240px;cursor:pointer;'));
} else {
	echo img(array('src'=>'http://graph.facebook.com/'. $ses_user['id'] . '/picture?type=large','style'=>'width:180px;cursor:pointer;'));
}
?>
		</td>
	</tr>
	<tr>
		<td>
			<label for='title'>Username</label>
		</td>
		<td>
			<input type='text' name='username'/><br />
		</td>
	</tr>
	<tr>
		<td>
			<label for='text'>Password</label>
		</td>
		<td>
			<input type='password' name='password' /><br />
		</td>
	</tr>		
	<tr>
		<td colspan='2'>
			<input style='width:100%;' type='submit' name='loginbutton' value='Login' />
		</td>
	</tr>
</table>

<pre>

<? print_r($ses_user); ?>

</form>
