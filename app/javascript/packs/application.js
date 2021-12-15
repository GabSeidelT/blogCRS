// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const iconNavbarSidenav = document.getElementById('iconNavbarSidenav');
    const iconSidenav = document.getElementById('iconSidenav');
    const sidenav = document.getElementById('sidenav-main');
    let body = document.getElementsByTagName('body')[0];
    let className = 'g-sidenav-pinned';

    if (iconNavbarSidenav) {
      iconNavbarSidenav.addEventListener("click", toggleSidenav);
    }

    if (iconSidenav) {
      iconSidenav.addEventListener("click", toggleSidenav);
    }

    function toggleSidenav() {
      if (body.classList.contains(className)) {
        body.classList.remove(className);
        setTimeout(function() {
          sidenav.classList.remove('bg-white');
        }, 100);
        sidenav.classList.remove('bg-transparent');

      } else {
        body.classList.add(className);
        sidenav.classList.add('bg-white');
        sidenav.classList.remove('bg-transparent');
      }
      }
