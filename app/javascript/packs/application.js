// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import "../css/application.css"


//= require jquery3
//= require popper
//= require bootstrap
//= require actiontext
//= require trix/dist/trix

document.ready(function() {
    var max = 900; // max word
    $("#read_more").each(function() {
        let str = $(this).text();
        if ($.trim(str).length > max) {
            let subStr = str.substring(0, max);
            let hiddenStr = str.substring(max, $.trim(str).length);
            $(this).empty().html(subStr);
            $(this).append(' <a href="javascript:void(0);" class="lire-plus button is-info is-outlined mb-2 ml-2 rounded hover:no-underline">Lire la suite...</a> <br> ');
            $(this).append('<span class="addText">' + hiddenStr + '</span>');
        };
    });
    $(".lire-plus").click(function() {
        $(this).siblings(".addText").contents().unwrap();
        $(this).remove();
    });
});

// js for Rich_text
document.addEventListener('turbolinks:load', () => {
    document.addEventListener('click', () => {
        let element = event.target.closest('.text-content')
        if (!element) return;

        element.classList.add('d-none')
        element.nextElementSibling.classList.remove('d-none')
    })

    document.addEventListener('click', () => {
        if (!event.target.matches('.cancel')) return;

        event.preventDefault();

        let element = event.target.closest('.form-content')

        element.classList.add('d-none')
        element.previousElementSibling.classList.remove('d-none')
    })
})