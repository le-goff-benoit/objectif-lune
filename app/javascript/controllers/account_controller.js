import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "open", "details", "arrow" ]

    hide() {
        console.log("hello account"),
        this.detailsTarget.classList.remove("show");
    }

    escClose(event) {
        if (event.key === 'Escape') this.hide()
    }

    toggle() {
        this.detailsTarget.classList.toggle("show");
    }
}