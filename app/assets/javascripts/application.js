//= require jquery
//= require jquery_ujs
//= require_tree .
//= require flatpickr

$(".task_button").on("ajax:success",function(){
  flatpickr('.deadline-datepicker');
});
