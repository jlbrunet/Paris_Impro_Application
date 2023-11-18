import { Controller } from "@hotwired/stimulus"
import moment from 'moment';
import 'moment/locale/fr';

export default class extends Controller {
  static targets = ["modal", "form", "input", "sentence", "button"]
  static values  = {
    date: String
  }

  validate() {
    this.buttonTarget.disabled = false
  }

  confirmAbsence(event) {
    event.preventDefault()
    const formattedDate = moment(this.inputTarget.value).locale('fr').format('dddd D MMMM')
    this.sentenceTarget.innerText = `Confirmes-tu ton absence au cours du ${formattedDate} ?`
    this.modalTarget.classList.remove("d-none")
  }

  confirmRattrapage(event) {
    event.preventDefault()
    this.sentenceTarget.innerText = `Confirmes-tu ton rattrapage au cours du ${this.dateValue} ?`
    this.modalTarget.classList.remove("d-none")
  }

  submit() {
    this.formTarget.submit()
  }

  cancel() {
    this.modalTarget.classList.add("d-none")
  }
}
