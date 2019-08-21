// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require materialize
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function () {
  $(".dropdown-trigger").dropdown();
  $('#fade-out-target').fadeOut(4000);
  $('select').formSelect();
  elem = document.querySelector('#mobile');
  instance = new M.Sidenav(elem, {});

  $('select').on('contentChanged', function() {
    $(this).formSelect();
  });
})

$(document).on('ready turbolinks:before-render', function() {
  elem = document.querySelector('#mobile');
  instance = M.Sidenav.getInstance(elem);
  if (instance){
    instance.destroy();
  }
})

function count_payment() {
  var hours = parseFloat(document.getElementById('number_w').value);
  var employee = parseFloat(document.getElementById('value_w').value);
  var result = document.getElementById('result_w');
  result.innerHTML = hours * employee;
}

function count_chemicals() {
  var area = parseFloat(document.getElementById('area_c').value);
  var chemical = parseFloat(document.getElementById('chemical_c').value);
  var result = document.getElementById('result_c');
  result.innerHTML = area / chemical;
}

function count_magazins() {
  var area = parseFloat(document.getElementById('area_m').value);
  var items = parseFloat(document.getElementById('items_m').value);
  var result = document.getElementById('result_m');
  result.innerHTML = area * items;
}
