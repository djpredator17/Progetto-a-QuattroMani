<?php 

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

//include the facebook.php from libraries directory
require_once APPPATH.'libraries/facebook/facebook.php';

class Fbci extends CI_Controller {

   public function __construct(){
	    parent::__construct();
	    $this->load->library('session');  //Load the Session 
		$this->config->load('facebook'); //Load the facebook.php file which is located in config directory
    }
	public function index()
	{
		$data['title'] = 'Test';
		$this->load->view('templates/header', $data);
		$this->load->view('fbci/main', $data);
		$this->load->view('templates/footer');
	}
	
	function logout(){
		$this->session->sess_destroy();  //session destroy
		header('Location: '.base_url());  //redirect to the home page
		
	}
	function fblogin(){
		$base_url=$this->config->item('base_url'); //Read the baseurl from the config.php file
		//get the Facebook appId and app secret from facebook.php which located in config directory for the creating the object for Facebook class
    	$facebook = new Facebook(array(
		'appId'		=>  $this->config->item('appID'), 
		'secret'	=> $this->config->item('appSecret'),
		));
		
		$user = $facebook->getUser(); // Get the facebook user id 
		
		if($user){
			
			try{
				$user_profile = $facebook->api('/me');  //Get the facebook user profile data
				
				$params = array('next' => base_url() .'index.php/fbci/logout', 'access_token'=>$facebook->getAccessToken());
				
				$ses_user=array('User'=>$user_profile,
				   'logout' =>$facebook->getLogoutUrl($params)   //generating the logout url for facebook 
				);
		        $this->session->set_userdata($ses_user);
				header('Location: '.base_url());
			}catch(FacebookApiException $e){
				error_log($e);
				$user = NULL;
			}		
		}	
		$data['title'] = 'Test';
		$this->load->view('templates/header', $data);
		$this->load->view('fbci/main', $data);
		$this->load->view('templates/footer');

	}
	
}

/* End of file fbci.php */
/* Location: ./application/controllers/fbci.php */