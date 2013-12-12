<?php
class User_model extends CI_Model {


	public function __construct()
	{
		$this->load->database();
	}

	public function register() {
	
		$session_data = $this->session->userdata('User');
		$query = $this->db->get_where('user', array('facebook_id' => $session_data['id']));
		if ($query->num_rows == 0) {

			 $data = array(
			 	'user_id' => NULL ,
				'facebook_id' => $session_data['id'] ,
				'token' => NULL ,
				'username' => $session_data['username'] ,
				'password' => '',
				'name_first' => $session_data['first_name'] ,
				'name_middle' => '' ,
				'name_last' => $session_data['last_name'] ,
				'email_id' => $session_data['email'] ,
				'picture' => '' ,
				'active' => 1 ,
				'online' => 1 ,
				'created_at' => NULL
				);

			$this->db->insert('user', $data);
			redirect("user/index", "location");

		} else {
			redirect("user/index", "location");
		}
		
	}

}