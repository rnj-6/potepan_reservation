import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
 static targets = ["menu"]

  toggle() {
    this.menuTarget.classList.toggle("is-open")
  }

  close(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.remove("is-open")
    }
  }
}