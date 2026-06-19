/**
 * 
 */
'use strict';

document.addEventListener("DOMContentLoaded", () => {

    const btn = document.getElementById('menuBtn');
    const menu = document.getElementById('sideMenu');

    if (btn && menu) {
        btn.addEventListener('click', () => {
            const isOpen = menu.classList.toggle('open');
            btn.classList.toggle('open', isOpen);
        });
    }

});
