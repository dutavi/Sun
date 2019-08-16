// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require_self

require("@rails/ujs").start()
require("@rails/activestorage").start()


window.openNav = function () {
  document.getElementById("myNav").style.width = "100%";
}

window.closeNav = function () {
  document.getElementById("myNav").style.width = "0%";
}