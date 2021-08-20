// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import place_create from "../src/place_create";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import Chartkick from "chartkick";
import Highcharts from "highcharts";
window.Highcharts = Highcharts;

document.addEventListener("submit", function (e) {
  if (e.target.matches(".places_form_with")) {
    e.preventDefault();
    places_create(e);
  }
});

//= require jquery
//= require jquery-ui
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

import "controllers"
