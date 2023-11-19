import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import { French } from "flatpickr/dist/l10n/fr.js"

export default class extends Controller {
  static targets = ['input']
  calendar = undefined

  connect() {
    const dates = JSON.parse(this.inputTarget.dataset.flatpickrAvailableDates)
    const formatted_dates = dates.map( date => date.slice(0,16) );
    if (!this.calendar) {
      this.calendar = flatpickr(this.inputTarget, {
        "locale": French,
        enable: formatted_dates,
        dateFormat: "Y-m-d H:i",
        inline: true,
      })
    }
  }
}
