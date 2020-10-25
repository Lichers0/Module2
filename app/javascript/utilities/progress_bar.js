document.addEventListener("turbolinks:load", function() {
  let progressBar = document.querySelector('.progress-bar');
  if (progressBar) {
    let number = progressBar.dataset.number;
    const count = progressBar.dataset.count;

    if (number && count) {
      let width = (number - 1) / count * 100;
      progressBar.setAttribute("style", "width:" + width.toString() + "%")
    }
  }
})