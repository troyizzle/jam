import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toast"
export default class extends Controller {
  static targets = ["content"];

  connect() {
    setTimeout(() => {
      this.removeContent();
    }, [this.timeoutDuration()])
  }

  removeContent() {
    this.element.remove();
  }

  timeoutDuration() {
    if (this.hasContentTarget) {
      // TODO: this includes whitespace
      //return this.contentTarget.textContent.length * 50;
      return 10000;
    }

    return 10000;
  }
}
