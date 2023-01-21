import { Application } from "@hotwired/stimulus"

const application = Application.start()
import { Dropdown } from "tailwindcss-stimulus-components"
application.register('dropdown', Dropdown)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
