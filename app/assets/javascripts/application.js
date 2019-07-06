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
//= require turbolinks
//= require trix
//= require_tree .

  // Show an element
const show = (elem) => {
  elem.style.display = 'block';
};

// Hide an element
const hide = (elem) => {
  elem.style.display = 'none';
};

// Toggle element visibility
const toggle = (elem) => {

  // If the element is visible, hide it
  if (window.getComputedStyle(elem).display === 'block') {
    hide(elem);
    return;
  }

  // Otherwise, show it
  show(elem);
}

// hambuger menu click
document.addEventListener('DOMContentLoaded', function(){
  document.getElementById('hamburger').addEventListener('click', (event) => {
    event.preventDefault();
    toggle(document.getElementById('nav_mobile'));
    toggle(document.getElementById('container'));
  });
});

window.addEventListener('resize', function () {
  const viewportWidth = window.innerWidth || document.documentElement.clientWidth;
  if (viewportWidth > 768) {
    hide(document.getElementById('nav_mobile'));
    show(document.getElementById('container'));
  }
});

