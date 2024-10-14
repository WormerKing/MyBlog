import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="panel"
export default class extends Controller {
  static targets = ["sidebar"];
  connect() {
    if (window.innerWidth > 1200) {
      this.sidebarTarget.classList.toggle("collapsed");
    }
  }

  changeVisibility() {
    this.sidebarTarget.classList.toggle("collapsed");
  }
}
