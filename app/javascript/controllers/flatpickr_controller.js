import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import { French } from "flatpickr/dist/l10n/fr.js"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['input']

  connect() {
    const dates = JSON.parse(this.inputTarget.dataset.flatpickrAvailableDates)
    const formatted_dates = dates.map( date => date.slice(0,16) );

    flatpickr(this.inputTarget, {
      "locale": French,
      enable: formatted_dates,
      dateFormat: "Y-m-d H:i",
      inline: true,
    })
  }
}
