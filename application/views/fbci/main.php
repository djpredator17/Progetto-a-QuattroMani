<?php 

$ses_user=$this->session->userdata('User');

if(empty($ses_user))   { 
echo img(array('src'=>base_url().'images/facebook.png','id'=>'facebook','style'=>'cursor:pointer;'));

 }  else{
	
 echo '<img src="//graph.facebook.com/'. $ses_user['id'] .'/picture?type=square"/><div>'.$ses_user['name'].'</div>';	
	echo '<a href="'.$this->session->userdata('logout').'">Logout</a>';

}
?>

<div id="fb-root"></div>

   <script type="text/javascript">
  window.fbAsyncInit = function() {
	  //Initiallize the facebook using the facebook javascript sdk
     FB.init({ 
       appId:'<?php echo $this->config->item('appID'); ?>', // App ID 
	   cookie:true, // enable cookies to allow the server to access the session
       status:true, // check login status
	   xfbml:true, // parse XFBML
	   oauth : true //enable Oauth 
     });
   };
   //Read the baseurl from the config.php file
   (function(d){
           var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
           if (d.getElementById(id)) {return;}
           js = d.createElement('script'); js.id = id; js.async = true;
           js.src = "//connect.facebook.net/en_US/all.js";
           ref.parentNode.insertBefore(js, ref);
         }(document));
	//Onclick for fb login
 $('#facebook').click(function(e) {
    FB.login(function(response) {
	  if(response.authResponse) {
		  parent.location ='<?php echo base_url(); ?>index.php/fbci/fblogin'; //redirect uri after closing the facebook popup
	  }
 },{scope: 'email,read_stream,publish_stream,user_birthday,user_location,user_work_history,user_hometown,user_photos'}); //permissions for facebook
});
   </script>
