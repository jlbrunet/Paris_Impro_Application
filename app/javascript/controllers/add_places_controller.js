import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-places"
export default class extends Controller {
  static targets = ["modale"]

  connect() {
  }

  add() {
    this.modaleTarget.classList.remove("d-none")
  }

  cancel() {
    this.modaleTarget.classList.add("d-none")
  }
}
