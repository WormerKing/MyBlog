import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="login"
export default class extends Controller {
  static targets = ["password", "checkbox"];

  togglePasswordType() {
    if (this.checkboxTarget.checked) {
      this.passwordTarget.type = "text";
    } else {
      this.passwordTarget.type = "password";
    }
  }
}
