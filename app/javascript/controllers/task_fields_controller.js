import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['fields', 'container', 'removeButton']

  connect() {
    this.#updateRemoveButton()
  }

  add(event) {
    let content = this.fieldsTarget.outerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.containerTarget.insertAdjacentHTML('beforeend', content)
    this.#updateRemoveButton()
  }

  remove(event) {
    if(this.fieldsTargets.length > 1) {
      event.target.closest(["[data-task-fields-target='fields']"]).remove()
    }
    this.#updateRemoveButton()
  }

  #updateRemoveButton() {
    this.removeButtonTargets.forEach((button) => {
      button.style.display = this.fieldsTargets.length > 1 ? "" : "none"
    })
  }

}
