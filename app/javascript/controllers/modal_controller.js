import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    close() {
        this.element.remove()
        this.modalTurboFrame.src = null
    }

    show(event) {
        const { detail: { success } } = event
        console.log(event)
        if (success) {
            close()
        }
    }

    escClose(event) {
        if (event.key === 'Escape') this.close()
    }

    get modalTurboFrame() {
        return document.querySelector("turbo-frame[id='modal']")
    }
}