import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="panel"
export default class extends Controller {
    static targets = ["sidebar"];
    connect() {
    
    }

    changeVisibility() {
        this.sidebarTarget.classList.toggle("collapsed");
    }
}
