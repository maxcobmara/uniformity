// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require bootstrap-transition
//= require bootstrap-datepicker
//= require bootstrap-select
//= require bootstrap-datetimepicker
//= require global
//= require_tree .




$(document).ready(function(){
  
    $('[data-behaviour=datepicker_before]').datepicker({
      format: "yyyy/mm/dd",
      endDate: "today",
      todayBtn: true
    });
  
    $('[data-behaviour=datepicker_after]').datepicker({
      format: "yyyy/mm/dd",
      startDate: "today",
      autoclose: true,
      todayBtn: true
    });
  
    $('[data-behaviour=datepicker_year]').datepicker({
        format: "yyyy",
        endDate: "today",
        startView: 1,
        minViewMode: 2,
        daysOfWeekDisabled: "6"
    });
  
    $('#datetimepicker1').datetimepicker({});
  
    $('.input-daterange').datepicker({
       format: "yyyy-mm-dd",
       autoclose: true
     });
  
    $('select').selectpicker();
  
$('#myTab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
    
  $('.toga').click(function() {
    $('.searchit').toggle(); 
  });
  

  
})
