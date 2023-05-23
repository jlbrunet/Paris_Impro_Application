import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-places"
export default class extends Controller {
  static targets = ["modale", "number"]

  connect() {
  }

  add() {
    this.modaleTarget.classList.remove("d-none")

  }

  cancel() {
    this.modaleTarget.classList.add("d-none")
  }

  minus() {
    let number = parseInt(this.numberTarget.value)
    if (number > 0) {
      this.numberTarget.value = number - 1
    }
  }

  plus() {
    let number = parseInt(this.numberTarget.value)
    this.numberTarget.value = number + 1
  }
}
