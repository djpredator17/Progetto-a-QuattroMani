<?php
class Fb extends CI_Controller {

	public function __construct()
	{

		parent::__construct();
		$this->load->model('fb_model');

		$config = array(
    		'appId'  => '437069579659215',
    		'secret' => '3a2a21410ab20e786e876b67a5ee9fc4'
		);
		$this->load->library('facebook', $config);
	
		$user_id  = $this->facebook->getUser();

	}


	public function index()
	{	
	
		$data['title'] = 'Facebook Test';



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


		if ($user) {
  			try {
    			// We have a valid FB session, so we can use 'me'
    			
 			    $u = $facebook->api('/me','GET');
				$data['facebook'] = $u; // Adds the details of the user in the $data array, accessible as $facebook['key']
	
 		 	} catch (FacebookApiException $e) {
    			error_log($e);
  			}
		}
	

		// login or logout url will be needed depending on current user state.
		if ($user) {
  			$logoutUrl = $facebook->getLogoutUrl();
		} else {
			// redirect to Facebook login to get a fresh user access_token
  			$loginUrl = $facebook->getLoginUrl();
		 	header('Location: ' . $loginUrl);
		}
			
		
		
		$this->load->view('templates/header', $data);
		$this->load->view('fb/index', $data);
		$this->load->view('templates/footer');
	}

	public function insertUser() {
	
	
			$insertNewUser = $this->fb_model->insert_fb_user();
			if ($insertNewUser) {
				$this->load->view('templates/header');				
				$this->load->view('fb/success');
				$this->load->view('templates/footer');
				
			} else {
				$this->load->view('templates/header');
				$this->load->view('fb/failed');
				$this->load->view('templates/footer');
			}
	}


}

