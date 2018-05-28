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

document.addEventListener("DOMContentLoaded", function(){
  class ToggleElement {
    constructor(element, onClassName, offClassName){
      this.element = element
      this.onClassName = onClassName
      this.offClassName = offClassName
      this.toggle = this.toggle.bind(this)
    }

    open() {
      this.element.classList.remove(this.offClassName)
      this.element.classList.add(this.onClassName)
    }

    close() {
      this.element.classList.remove(this.onClassName)
      this.element.classList.add(this.offClassName)
    }

    isOff() {
      return this.element.classList.contains(this.offClassName)
    }

    toggle() {
      if (this.isOff()) {
        this.open()
      } else {
        this.close()
      }
    }
  }

  class EventTrigger {
    constructor(element, event, callback) {
      this.callback = callback
      return element.addEventListener(event, callback)
    }
  }

  class MenuTrigger extends EventTrigger {
    toggleMenu(){
      this.callback();
    }
  }

  // add event listeners

  class Element {
    constructor(element){
      this.element = element
      return this
    }
    
    static find(id) {
      return new Element(document.getElementById(id))
    }

    targetClosest(selector) {
      return this.element.closest(selector)
    }
    
    hasClass(className) {
      debugger;
      return this.element.classList.contains('open-toggle-nav')
    }
  }

  const togglableMenu = new ToggleElement(
    document.getElementById('toggle-nav'),
    'open-toggle-nav',
    'closed-toggle-nav'
  )

  document.addEventListener("click", function(event) {
    if (event.target.closest("#toggle-nav-menu")) return;
    if (document.getElementById('toggle-nav').classList.contains('open-toggle-nav')) {
      togglableMenu.toggle()
    } else if (document.getElementById('toggle-nav').classList.contains('closed-toggle-nav')) {
      if (event.target.closest("#menu-button")) {
      togglableMenu.toggle()
      }
    }

  });

  //new EventTrigger(
  //  document.getElementById('menu-button'), 
  //  'click', 
  //  togglableMenu.toggle
  //)
})
