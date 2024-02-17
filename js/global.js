window.$$ = selector => document.querySelector(selector);
window.$$$ = selector => document.querySelectorAll(selector);
window.event = (element, eventName, handler) => element.addEventListener(eventName, handler);
