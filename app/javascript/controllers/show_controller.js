import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show"
export default class extends Controller {
  static targets = ['meaningsButton', 'meaningsCard'];

  showMoreMeanings() {
    this.meaningsButtonTarget.style.display = 'none';
    this.meaningsCardTarget.style.display = 'block';
  }
}
