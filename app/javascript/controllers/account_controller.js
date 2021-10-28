import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "open", "details", "arrow" ]

    hide() {
        this.detailsTarget.classList.remove("show");
        console.log("hide")
    }

    escClose(event) {
        if (event.key === 'Escape') this.hide()
    }

    toggle() {
        this.detailsTarget.classList.toggle("show");
        console.log("toggle")
    }
}