document.addEventListener(
  'turbolinks:load',
  function() {
    let control = document.querySelector('.sort-by-title');
    if (control) { control.addEventListener('click', sortByTitle) }
    console.log(133)
  })

function sortByTitle() {
  let table = document.querySelector('table')
  let rows = table.querySelectorAll('tr')
  let sortedRows = []
  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  // let arrowUp = this.querySelector('.octicon-arrow-up')

  if (this.querySelector('.span-arrow-up').classList.contains('hide')) {
    this.querySelector('.span-arrow-up').classList.remove('hide')
    this.querySelector('.span-arrow-down').classList.add('hide')
    sortedRows.sort(compareRowsAsc)
  } else {
    this.querySelector('.span-arrow-up').classList.add('hide')
    this.querySelector('.span-arrow-down').classList.remove('hide')
    sortedRows.sort(compareRowsDesc)
  }

  let sortedTable = document.createElement('table')
  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])


  for (let i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}