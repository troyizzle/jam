import { Controller } from "@hotwired/stimulus"
import Dropzone from "dropzone"

// Connects to data-controller="dropzone"
export default class extends Controller<HTMLFormElement> {
  static targets = ["preview", "input"]
  static values = {
    showPreview: Boolean,
    addRemoveLinks: Boolean
  }

  declare dropZone: Dropzone
  declare readonly previewTarget: HTMLImageElement
  declare readonly inputTarget: HTMLInputElement
  declare readonly showPreviewValue: boolean
  declare readonly addRemoveLinksValue: boolean
  declare readonly hasAddRemoveLinksValue: boolean

  connect() {
    this.dropZone = new Dropzone(this.element, {
      autoQueue: false,
      maxFiles: 1,
      acceptedFiles: "image/*",
      addRemoveLinks: this.addRemoveLinks,
      autoProcessQueue: false,
      url: "/"
    })
    this.bindEvents()
  }

  bindEvents() {
    this.dropZone.on("thumbnail", file => {
      this.handleThumbnail(file)
    })
  }

  handleThumbnail(file: Dropzone.DropzoneFile) {
    if (file.dataURL) {
      this.previewTarget.src = file.dataURL
    }
  }

  get addRemoveLinks() {
    return this.hasAddRemoveLinksValue ? this.addRemoveLinksValue : true
  }
}
