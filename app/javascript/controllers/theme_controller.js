import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static values = {
    lightMode: String,
    darkMode: String
  }

  toggle(e) {
    e.preventDefault();
    const currentTheme = this.getCurrentTheme()
    const newTheme = currentTheme == 'dark' ? 'light' : 'dark'
    this.updateThemeCookie(newTheme)
    this.updateHtmlClass(newTheme)
    this.updateText(newTheme)
  }

  updateText(newTheme) {
    const text = newTheme == "dark" ? this.darkModeValue : this.lightModeValue;
    this.element.innerHTML = text;
  }

  getCurrentTheme() {
    const currentTheme = this.getCookie('theme')
    if (currentTheme) return currentTheme;


    return 'dark'
  }

  updateThemeCookie(theme) {
    document.cookie = `theme=${theme}`
  }

  updateHtmlClass(theme) {
    const htmlElement = document.getElementsByTagName("html")[0]
    htmlElement.classList = theme
  }

  getCookie(name) {
    // Split cookie string and get all individual name=value pairs in an array
    var cookieArr = document.cookie.split(";");

    // Loop through the array elements
    for(var i = 0; i < cookieArr.length; i++) {
        var cookiePair = cookieArr[i].split("=");

        /* Removing whitespace at the beginning of the cookie name
        and compare it with the given string */
        if(name == cookiePair[0].trim()) {
            // Decode the cookie value and return
            return decodeURIComponent(cookiePair[1]);
        }
    }

    // Return null if not found
    return null;
}
}
