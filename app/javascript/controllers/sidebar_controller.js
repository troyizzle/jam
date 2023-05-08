import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["sidebar", "openButton"]
  static values = { toggle: Boolean }
  static classes = ["open", "close"];

  toggle() {
    this.toggleValue = !this.toggleValue
  }

  toggleValueChanged() {
    if (this.toggleValue) {
      this._open()
    } else {
      this._close()
    }
  }

  _open() {
    this.sidebarTarget.classList.remove(this.closeClass)
    this.sidebarTarget.classList.add(this.openClass)
  }

  _close() {
    this.sidebarTarget.classList.remove(this.openClass)
    this.sidebarTarget.classList.add(this.closeClass)
  }

  close(event) {
    if (this.sidebarTarget.contains(event.target)) return;
    if (
      this.openButtonTarget.contains(event.target) === false
      &&
      this.toggleValue
    ) {
      this.toggleValue = false
    }
  }
}
