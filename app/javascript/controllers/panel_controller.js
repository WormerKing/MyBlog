import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="panel"
export default class extends Controller {
    static targets = ["sidebar"];
    connect() {
        if (window.screen.width < 768) {
            this.sidebarTarget.classList.toggle("collapsed");
        }
    }

    changeVisibility() {
        this.sidebarTarget.classList.toggle("collapsed");
    }
}
