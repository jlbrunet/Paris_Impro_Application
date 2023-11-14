import { Controller } from "@hotwired/stimulus"
import moment from 'moment';
import 'moment/locale/fr';

// Connects to data-controller="confirmation"
export default class extends Controller {
  static targets = ["modal", "form", "input", "sentence", "button"]
  static values  = {
    date: String
  }

  connect() {
    this.buttonTarget.disabled = true
  }

  validate() {
    this.buttonTarget.disabled = false
  }

  confirm_absence(event) {
    event.preventDefault()
    const formatted_date = moment(this.inputTarget.value).locale('fr').format('dddd D MMMM')
    this.sentenceTarget.innerText = `Confirmes-tu ton absence au cours du ${formatted_date} ?`
    this.modalTarget.classList.remove("d-none")
  }

  confirm_rattrapage(event) {
    event.preventDefault()
    this.sentenceTarget.innerText = `Confirmes-tu ton rattrapage au cours du ${this.dateValue} ?`
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
