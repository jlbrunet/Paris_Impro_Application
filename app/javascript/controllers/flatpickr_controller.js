import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['arraydata']

  connect() {
    let array_string = this.arraydataTarget.dataset.flatpickrAvailableDatesString
    let array = JSON.parse(array_string)
    let new_array = []
    array.forEach(element => new_array.push(element.slice(0,19)));

    flatpickr(this.arraydataTarget, {
      enable: new_array,
      dateFormat: "Y-m-d H:i:S",
    })
  }
}
