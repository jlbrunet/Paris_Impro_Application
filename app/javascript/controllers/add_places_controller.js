import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modale", "number"]

  change() {
    this.modaleTarget.classList.toggle("d-none")
  }

  minus() {
    const number = parseInt(this.numberTarget.value)
    if (number > 0) {
      this.numberTarget.value = number - 1
    }
  }

  plus() {
    const number = parseInt(this.numberTarget.value)
    this.numberTarget.value = number + 1
  }
}
