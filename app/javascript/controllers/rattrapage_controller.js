import { Controller } from "@hotwired/stimulus"
import moment from 'moment';
import 'moment/locale/fr';

// Connects to data-controller="rattrapage"
export default class extends Controller {
  static targets = ["modal", "form", "input", "sentence", "button"]

  connect() {
    this.buttonTarget.disabled = true;
  }

  validate(event) {
    if (event.target.value !== '') {
      this.buttonTarget.disabled = false;
    }
  }

  confirm(event) {
    event.preventDefault()
    const inputTarget = document.querySelector('[data-rattrapage-target="input"]')
    const formatted_date = moment(inputTarget.value).locale('fr').format('dddd D MMMM')
    this.sentenceTarget.innerText = `Confirmes-tu ton rattrapage au cours du ${formatted_date} ?`
    this.modalTarget.classList.remove("d-none")
  }

  submit() {
    this.modalTarget.classList.add("d-none")
    this.formTarget.submit()
  }

  cancel() {
    this.modalTarget.classList.add("d-none")
  }
}
