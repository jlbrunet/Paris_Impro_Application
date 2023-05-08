import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import { French } from "flatpickr/dist/l10n/fr.js"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['arraydata']

  connect() {
    let array_string = this.arraydataTarget.dataset.flatpickrAvailableDatesString
    let array = JSON.parse(array_string)
    let new_array = []
    array.forEach(element => new_array.push(element.slice(0,16)));

    flatpickr(this.arraydataTarget, {
      "locale": French,
      enable: new_array,
      dateFormat: "Y-m-d H:i",
      inline: true,
    })
  }
}
