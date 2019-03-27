import { Controller } from "stimulus"
import flatpickr from 'flatpickr'

export default class extends Controller {
  static targets = [ 'location', 'contact', 'time', 'image', 'geo', 'datefield' ]

  changed(event) {
    switch (event.target.value) {
      case 'ask':
        this.locationTarget.style.display = 'none'
        this.contactTarget.style.display = 'block'
        this.timeTarget.style.display = 'none'
        this.imageTarget.style.display = 'none'
        break
      case 'event':
        this.locationTarget.style.display = 'block'
        this.contactTarget.style.display = 'block'
        this.timeTarget.style.display = 'block'
        this.imageTarget.style.display = 'none'
        break
      case 'intro':
        this.locationTarget.style.display = 'none'
        this.contactTarget.style.display = 'none'
        this.timeTarget.style.display = 'none'
        this.imageTarget.style.display = 'block'
        break
      default:
        this.locationTarget.style.display = 'none'
        this.contactTarget.style.display = 'none'
        this.timeTarget.style.display = 'none'
        this.imageTarget.style.display = 'none'
    }
  }

  initialize() {
    flatpickr(this.datefieldTarget, {enableTime: true})
    
    // Just for show for now
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(pos => {
        this.geoTarget.innerHTML = `Your current location: ${pos.coords.latitude}, ${pos.coords.longitude}`
      })
    }
    this.changed({target: {value: 'notice'}})
  }
}
