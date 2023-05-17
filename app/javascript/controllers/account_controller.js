import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="account"
export default class extends Controller {
  static targets = ["d_modal", "c_modal", "sentence"]

  connect() {
  }

  change(event) {
     this.c_modalTarget.classList.remove("d-none")
  }

  delete(event) {
    this.d_modalTarget.classList.remove("d-none")
  }

  d_submit() {
    this.d_modalTarget.classList.add("d-none")
    // action liée à suppression du compte à ajouter en utilisant le dataset student.id
  }

  d_cancel() {
    this.d_modalTarget.classList.add("d-none")
  }
}
