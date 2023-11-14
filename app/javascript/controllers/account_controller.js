import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["d_modal", "c_modal", "sentence"]

  change() {
    this.c_modalTarget.classList.toggle("d-none")
  }

  delete() {
    this.d_modalTarget.classList.toggle("d-none")
  }

  submit() {
    this.d_modalTarget.classList.add("d-none")
  }
}
