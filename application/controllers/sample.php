<?php
class My_profile extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('My_profile_model');
	}


	public function index()
	{	
		$data['title'] = 'News archive';

		$this->load->view('templates/header', $data);
		$this->load->view('news/index', $data);
		$this->load->view('templates/footer');
	}



}
