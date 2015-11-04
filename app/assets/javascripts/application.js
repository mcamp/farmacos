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
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var canceled = null;
$(document).ready(function() {
  $(".disease").click(function(){
    openDrugs($(this));
  });

  $(".add_criteria").click(function(){
    addingDrugCriteria($("#addCriteriaURL").html());
  });

  $('body').on('click', '.cancel_criteria', function (){
      cancelDrugCriteria($(this));
  });

  $('body').on('click', '.create_criteria', function (){
      createDrugCriteria($(this));
  });
});


function openDrugs(aLiElement){
  $.ajax({
   url: aLiElement.attr("ajaxCall"),
    success: function () {
    },
    error: function (){
      window.alert("something wrong!");
    }
  });
}

function addingDrugCriteria(url){
  $.ajax({
   url: url,
    success: function () {
    },
    error: function (){
      window.alert("something wrong!");
    }
  });
}

function cancelDrugCriteria(clickedElement){
  clickedElement.parent().parent().remove();
}

function createDrugCriteria(clickedElement){
  var criteria = clickedElement.parent().parent().find("[name=criteria]").val();
  var ctype = clickedElement.parent().parent().find("[name^=ctype]").val();
  var description = clickedElement.parent().parent().find("[name=description]").val();
  $.ajax({
    type: "POST",
    url: clickedElement.attr("url"),
    data: {criteria: criteria, ctype: ctype, description: description },
    success: function () {
      cancelDrugCriteria(clickedElement);
    },
    error: function (){
      window.alert("something wrong!");
    }
  });
}

