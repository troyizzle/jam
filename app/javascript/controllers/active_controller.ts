import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="active"
export default class extends Controller {
  static values = {
    class: String,
  }

  declare readonly classValue: string

  static targets = ["element"]
  declare readonly elementTargets: HTMLElement[]

  toggle() {
    this.elementTargets.forEach((element) => {
      element.classList.toggle(this.classValue)
    })
  }
}
