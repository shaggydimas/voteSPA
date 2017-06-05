// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$( document ).on('turbolinks:load', function() {
  console.log('worksing');
  $('form.vote-form').on('click','label', function(e){
    var el = $(this);
    var data =  { options: $('input[type="radio"]:checked').val() };
    $.post( el.closest('form').attr('action'), data );
  });
  var c_form = $('.custom-form');
  var i = 1;
  $('.add-options').on('click',function(e){
    if(i > 6) return;
    console.log('hi');
    i++;
    c_form.append('<input type="text" placeholder="option '+ i + '"><br>');
  });
  var form = $('#new_vote');
  var form_data = [];
  $('#create_vote').on('click', function(e) {
      var inputs = c_form.children('input[type="text"]');
      inputs.each(function(i,v){
        form_data.push($(this).val());
      });
      $('#vote_options').val(JSON.stringify(form_data));
      form.trigger('submit');
  });
  $('.custom-form').on('keyup',' input[type="text"]',function(e) {
      if(e.key === "Enter"){
        $('button.add-options').trigger('click');
        $('input[type="text"]').last().focus();
      }
  })
});