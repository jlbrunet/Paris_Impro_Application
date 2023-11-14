import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-abs"
export default class extends Controller {
  static targets = ["a_modale", "r_modale"]

  a_change() {
    this.a_modaleTarget.classList.toggle("d-none")
  }

  r_change() {
    this.r_modaleTarget.classList.toggle("d-none")
  }
}
