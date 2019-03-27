import { Controller } from "stimulus"
import Masonry from 'masonry-layout'

export default class extends Controller {
  static targets = [ "grid" ]

  initialize() {
    this.msnry = new Masonry(this.gridTarget, {
      itemSelector: '.card',
      gutter: 20,
      fitWidth: true
    })
    setTimeout(() => this.msnry.layout(), 500)
  }
}
