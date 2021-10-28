import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "eye", "openkey", "closekey" ]

    connect() {
        console.log("hide");
        this.hide()
    }

    show() {
        this.openkeyTarget.classList.remove("hide");
        this.closekeyTarget.classList.add("hide");
    }

    hide() {
        this.openkeyTarget.classList.add("hide");
        this.closekeyTarget.classList.remove("hide");
    }

}