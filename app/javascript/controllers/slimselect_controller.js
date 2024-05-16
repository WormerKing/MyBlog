import { Controller } from "@hotwired/stimulus"
import SlimSelect from "slim-select"

// Connects to data-controller="slimselect"
export default class extends Controller {
    static targets = [ "selectGroup" ];
    
    connect() {
        var select = new SlimSelect({
            select: `#${this.selectGroupTarget.id}`,
            settings: {
                allowDeselect: true
            }
        });

        if (this.data.has("array")) {
            select.setSelected(this.data.get("array").split("|"));
        }
    }
}