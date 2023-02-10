import { Controller } from "@hotwired/stimulus"
import { useDebounce } from "stimulus-use"

// Connects to data-controller="autosubmit"
export default class extends Controller {
  static debounces = [
    'submit',
  ]

  connect() {
    useDebounce(this, { wait: 1000 })
  }

  submit() {
    this.element.requestSubmit()
  }
}
