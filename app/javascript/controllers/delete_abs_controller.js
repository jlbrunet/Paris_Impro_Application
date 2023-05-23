import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-abs"
export default class extends Controller {
  static targets = ["modale", "modale2"]

  connect() {
  }

  modal() {
    this.modaleTarget.classList.remove("d-none")
  }

  cancel() {
    this.modaleTarget.classList.add("d-none")
  }

  modal2() {
    this.modale2Target.classList.remove("d-none")
  }

  cancel() {
    this.modale2Target.classList.add("d-none")
  }
}
