import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]

  close() {
    this.element.remove()
  }

  closeOnSuccess(e) {
    if (e.detail.success) {
      this.close()
    }
  }

  closeWithEscape(e) {
    if (e.key === "Escape") {
      this.close()
    }
  }

  closeBackground(e) {
    if (e && this.modalTarget.contains(e.target)) {
      return
    }
    this.close()
  }
}
