//= require jquery
//= require jquery_ujs
//= require_tree .
//= require flatpickr

$(".add_task_button").on("ajax:success",function(){
  flatpickr('.deadline-datepicker');
});
