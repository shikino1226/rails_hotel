// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap'
import '../src/application.scss'

$(function() {
  // ↓タブをクリックした時の処理↓
  $('.tab').click(function(){
      // ↓現在アクティブなタブを切り替え↓
      $('.tab-active').removeClass('tab-active');
      // ↓タブをアクティブにする↓
      $(this).addClass('tab-active');
      // ↓現在アクティブなタブの中身を非表示
      $('.box-show').removeClass('box-show');
      // ↓クリックしたタブから順番を取得↓
      const index = $(this).index();
      // ↓クリックしたタブと同じ順番のコンテンツを表示↓
      $('.tabbox').eq(index).addClass('box-show');
  });
});
