<?php
class Fb_model extends CI_Model {


	public function __construct()
	{
		$this->load->database();
	}

	public function get_news($slug = FALSE)
	{
		if ($slug === FALSE)
		{
			$query = $this->db->get('fb_users');
			return $query->result_array();
		}

	$query = $this->db->get_where('news', array('slug' => $slug));
	return $query->row_array();
	}

	public function insert_fb_user()
	{ 

		// Facebook App details	
  		$config = array(
    	'appId' => '437069579659215',
    	'secret' => '3a2a21410ab20e786e876b67a5ee9fc4',
    	'allowSignedRequest' => false // optional but should be set to false for non-canvas apps
  		);

		// Creates an instance of the class and  retrieves the 
		// data of the logged user
		
		$facebook = new Facebook($config);
		$user = $facebook->getUser();

			$u = $facebook->api('/me','GET');
			$data['facebook'] = $u; // Adds the details of the user in the $data array, accessible as $facebook['key']
	
		$checkID = $this->db->query("
			SELECT *
			FROM `fb_users`
			WHERE fb_id = '". $data['facebook']['id'] ."'
			");
			
		if ($checkID->num_rows == 0) {
		
				$data = array(
					'id' => NULL,
					'fb_id' => $data['facebook']['id'],
					'name' => $data['facebook']['name'],
					'first_name' => $data['facebook']['first_name'],
					'last_name' => $data['facebook']['last_name'],
					'link' => $data['facebook']['link'],
					'username' => $data['facebook']['username'],
					'gender' => $data['facebook']['gender'],
					'email' => $data['facebook']['email'],
					'timezone' => $data['facebook']['timezone'],
					'locale' => $data['facebook']['locale'],
					'verified' => $data['facebook']['verified'],
					'updated_time' => time()
				);
	
				return $this->db->insert('fb_users', $data);
		} else {
			return FALSE;
		}
	}
}