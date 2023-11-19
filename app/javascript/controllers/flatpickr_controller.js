import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import { French } from "flatpickr/dist/l10n/fr.js"

export default class extends Controller {
  static targets = ['input']

  connect() {
    const dates = JSON.parse(this.inputTarget.dataset.flatpickrAvailableDates)
    flatpickr(this.inputTarget, {
      "locale": French,
      enable: dates,
      dateFormat: "Y-m-d H:i",
      inline: true,
    })
  }
}
