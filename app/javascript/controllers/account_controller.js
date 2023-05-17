import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="account"
export default class extends Controller {
  static targets = ["modal"]

  connect() {
  }

  delete() {
    this.modalTarget.classList.remove("d-none")
  }

  submit() {
    this.modalTarget.classList.add("d-none")
    // action liée à suppression du compte à ajouter
  }

  cancel() {
    this.modalTarget.classList.add("d-none")
  }
}
