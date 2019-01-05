
const imageSlide = () =>{
  var carousel = document.querySelectorAll('.pswp')
  if ( carousel != null) {
    var pswpElement = carousel[0];
    var options = {
      index: 0,
      closeEl: true,
      captionEl: true,
      fullscreenEl: false,
      zoomEl: false,
      shareEl: false,
      counterEl: true,
      arrowEl: true,
      preloaderEl: true
    };
    // Initializes and opens PhotoSwipe
    if (document.querySelectorAll(".photo-card") != null) {
      document.querySelectorAll(".photo-card").forEach((e) => {
        e.addEventListener("click", function () {
          var items = JSON.parse(pswpElement.dataset.photos)
          options.index = parseInt(e.dataset.index)
          var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
          gallery.init();
        })
      })
    }

  }
}


export { imageSlide }
