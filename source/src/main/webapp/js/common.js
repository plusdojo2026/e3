/**
 * 
 */
 'use strict'

const btn = document.getElementById('menuBtn');
const menu = document.getElementById('sideMenu');

function toggleMenu() {
    const isOpen = menu.classList.toggle('open');
    btn.classList.toggle('open', isOpen);
}
btn.addEventListener('click', toggleMenu);