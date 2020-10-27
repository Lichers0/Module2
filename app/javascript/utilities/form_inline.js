document.addEventListener('turbolinks:load', function() {
  let controls = document.querySelectorAll('.form-inline-link')

  if (controls && controls.length) {
    for (let i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formLineLinkHandler)
    }
  }

  let errors = document.querySelector('.resource-errors')
  if (errors) {
    let resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

// 23 minutes
function formLineLinkHandler(event) {
  event.preventDefault()
  let testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  let link = document.querySelector(`.form-inline-link[data-test-id="${ testId }"]`)

  let testTitle = document.querySelector(`.test-title[data-test-id="${ testId }"]`)
  let formInline = document.querySelector(`.form-inline[data-test-id="${ testId }"]`)


  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide')
    formInline.classList.remove('hide')
    link.textContent = "Отмена"
  } else {
    formInline.classList.add('hide')
    testTitle.classList.remove('hide')
    link.textContent = "Редактировать"
  }
}