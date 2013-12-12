<?php
class User extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('User_model');
		$this->load->helper(array('form', 'url'));
		$this->load->library('form_validation');
		$this->load->library('facebook');

	    parent::__construct();
		$this->config->load('facebook'); //Load the facebook.php file which is located in config directory

	}


	public function index()
	{
	
		
		$data['title'] = 'Il Mio Profilo';
		$session = $this->session->userdata("User");
		if ($session['id']) {
			$this->load->view('templates/header', $data);
			$this->load->view('user/home', $data);
			$this->load->view('templates/footer');

		} else  {
			$this->load->view('templates/header', $data);
			$this->load->view('user/loginform', $data);
			$this->load->view('templates/footer');		
		}

	}

	public function loginform()
	{
	

		$data['title'] = 'Login';
		
		$this->load->view('templates/header', $data);
		$this->load->view('user/loginform', $data);
		$this->load->view('templates/footer');
	}

	public function login() 
	{

		$base_url=$this->config->item('base_url'); //Read the baseurl from the config.php file
		//get the Facebook appId and app secret from facebook.php which located in config directory for the creating the object for Facebook class
    	$facebook = new Facebook(array(
		'appId'		=>  $this->config->item('appId'), 
		'secret'	=> $this->config->item('secret'),
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
		$this->load->view('user/home', $data);
		$this->load->view('templates/footer');
		return;

		$query = $this->db->get_where('user', array('username' => $_POST['username']));


		if ($query->num_rows == 1)
		{
			
			$login_session = array(
                   'username'  => $_POST['username'],
                   'email'     => 'johndoe@some-site.com',
                   'logged_in' => TRUE
               );
			$this->session->set_userdata($login_session);	

			$data['title'] = 'Il Mio Profilo';	
			$this->load->view('templates/header',array('data' => $data));
			$this->load->view('user/home', array('data' => $data));
			$this->load->view('templates/footer');
      		}
		else if (isset($_POST['username']))
		{

			$data['title'] = 'Il Mio Profilo';
			$this->load->view('templates/header', array('data' => $data));
			$this->load->view('user/failed', array('data' => $data));
			$this->load->view('templates/footer');		
			}
		else {
			redirect("user/index", "location");
		}

	}
	
	public function register() {
	
   		$this->User_model->register(); 		
	}
	
	public function logout() 
	{
		$this->session->sess_destroy();
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
