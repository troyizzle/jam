import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-input"
export default class extends Controller {
  static targets = ["display", "input"];
  update() {
    this.inputTarget.value = this.displayTarget.innerHTML;
  }
}
