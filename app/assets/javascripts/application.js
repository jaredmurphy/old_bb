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

const show = (elem) => {
  elem.style.display = 'block';
};

const hide = (elem) => {
  elem.style.display = 'none';
};

const hasClass = (elem, className) => elem.classList.contains(className);
const addClass = (elem, className) => elem.classList.add(className);
const removeClass = (elem, className) => elem.classList.remove(className);

document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('hamburger').addEventListener('click', (event) => {
    event.preventDefault();
    toggle(document.getElementById('nav_mobile'));
    toggle(document.getElementById('container'));
  });
});

window.addEventListener('resize', () => {
  const viewportWidth = window.innerWidth || document.documentElement.clientWidth;

  if (viewportWidth > 768) {
    hide(document.getElementById('nav_mobile'));
    show(document.getElementById('container'));
  }
});

const handleScrollForHeader = () => {
  const header = document.getElementById('header');
  const className = 'header__minimize';
  const scrollPosition = window.scrollY;

  if (hasClass(header, className) && scrollPosition === 0) {
    removeClass(header, className);
  } else if (!hasClass(header, className) && scrollPosition > 0) {
    addClass(header, className);
  }
}

document.addEventListener('scroll', handleScrollForHeader);

