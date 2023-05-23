import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-abs"
export default class extends Controller {
  static targets = ["modale"]

  connect() {
  }

  modal() {
    this.modaleTarget.classList.remove("d-none")
  }

  cancel() {
    this.modaleTarget.classList.add("d-none")
  }
}
