import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="password"
export default class extends Controller {
  static targets = ["input"]
  static values = {
    toggle: Boolean,
  }

  toggle() {
    this.toggleValue = !this.toggleValue
  }

  toggleValueChanged() {
    this.inputTarget.type = this.toggleValue ? "text" : "password"
  }
}
