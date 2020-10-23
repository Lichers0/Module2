document.addEventListener('turbolinks:load', function () {
  let password = document.querySelector('input[id$="password"]')
  let passwordConfirmation = document.querySelector('input[id$="password_confirmation"]')
  let goodPass = document.querySelector('.good-pass');
  let badPass = document.querySelector('.bad-pass');

  if (password) {
    password.addEventListener('input',
      {
        handleEvent: password_testing,
        pass: password,
        passConf: passwordConfirmation,
        goodIcon: goodPass,
        badIcon: badPass
      })
  }

  if (passwordConfirmation) {
    passwordConfirmation.addEventListener('input',
      {
        handleEvent: password_testing,
        pass: password,
        passConf: passwordConfirmation,
        goodIcon: goodPass,
        badIcon: badPass
      })
  }
})

function password_testing(event) {
  if (this.passConf.value === "") {
    this.goodIcon.classList.add('hide')
    this.badIcon.classList.add('hide')
  } else if (this.pass.value === this.passConf.value) {
    this.goodIcon.classList.remove('hide')
    this.badIcon.classList.add('hide')
  } else {
    this.badIcon.classList.remove('hide')
    this.goodIcon.classList.add('hide')
  }
}
