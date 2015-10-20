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

$(document).ready(function() {
  $(".disease").click(function(){
    openDrugs($(this));
  });
});


function openDrugs(aLiElement){
  $.ajax({
   url: aLiElement.attr("ajaxCall"),
    success: function (diseaseAndDrugs) {
      var drugsUl =  $(".listTable.drugs > ul");
      drugsUl.html(generateStringHtmlList(diseaseAndDrugs["drugs"]));
      changeTableTitle($(".listTable.drugs"), diseaseAndDrugs["disease"].name);
      styleList(drugsUl);
      styleListElement(aLiElement)
    },
    error: function (){
        window.alert("something wrong!");
    }
  });
}

function generateStringHtmlList(elements) {
  var stringList = "<ul>\n";
  elements.forEach(function(element) {
    stringList += "<li>"+element.name+"</li>\n";
  });
  stringList += "</ul>";
  return stringList;
}

function styleList(elementList){  
  elementList.find("li").each(function(index){
    if(index%2 != 0){
      $(this).addClass("odd");
    }
  });
}

function styleListElement(anElement){
  anElement.parent().find("li").each(function(){
    $(this).removeClass("selected");
  });
  anElement.addClass("selected");
}

function changeTableTitle(table, title){
  table.find(".title").html("Fármacos para <span class='short italic'>"+title+"</span>");
}
