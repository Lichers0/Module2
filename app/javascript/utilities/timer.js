document.addEventListener('turbolinks:load', function() {
  let timerSeconds = document.querySelector('.timer')

  if (timerSeconds) {
    let time = timerSeconds.dataset.timeleft

    setInterval(function () {
      if (time > 0) {
        time -= 1
      } else {
        alert('Время вышло')
        document.querySelector('form').submit()
      }
      timerSeconds.innerHTML = parseInt(time / 60) + ':' + time % 60
    }, 1000)
  }
})
