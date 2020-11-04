document.addEventListener('turbolinks:load', function() {
  const timerSeconds = document.getElementsByClassName('js-timer')
  console.log(timerSeconds.dataset)

  if (timerSeconds.length) {
    let time = timerSeconds[0].dataset.timeleft

    setInterval(function () {
      if (time > 0) {
        time -= 1
      } else {
        alert('Время вышло')
        document.querySelector('form').submit()
      }
      console.log(parseInt(time / 60) + ':' + time % 60)
      timerSeconds[0].innerHTML = parseInt(time / 60) + ':' + time % 60
    }, 1000)
  }
})
