// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



function textChanged() {

    var feedback = document.getElementById("feedback");
    var imageInput = document.getElementById("imageInput");
    var string = imageInput.value;
    var end = string.substr(string.length-3,3);
  			
    if(end.length == 3 && end == "jpg") {
  
  	    feedback.innerHTML = "Valid Image";
  	    feedback.classList.remove('red');
  	    feedback.classList.add('black');
    
        
    } else {
  
  	    feedback.innerHTML = "Error, invalid image, must be *.jpg";
  	    feedback.classList.remove('black');
  	    feedback.classList.add('red');			
  }

}