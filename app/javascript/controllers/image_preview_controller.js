import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-preview"
export default class extends Controller {
  static targets = ["preview"]

  preview(event) {
    const file = event.target.files[0]
    const reader = new FileReader()

    reader.onload = (event) => {
      this.previewTarget.src = event.target.result
    }

    reader.readAsDataURL(file)
  }
}
