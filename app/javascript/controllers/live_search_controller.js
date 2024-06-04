import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="live-search"
export default class extends Controller {
  connect() {
    console.log("bonjour");
  }

  search() {
    console.log("search");
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 50)
  }
}
