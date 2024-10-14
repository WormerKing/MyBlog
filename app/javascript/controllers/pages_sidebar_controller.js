import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="pages-sidebar"
export default class extends Controller {
  static targets = ["toggleButton", "sidebar"];

  connect() {
    if (window.innerWidth > 1400) {
      this.sidebarTarget.classList.remove("active");
    }
  }

  toggleSidebar() {
    this.sidebarTarget.classList.toggle("active");
  }
}
