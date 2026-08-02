import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show"
export default class extends Controller {
  static targets = ['meaningsButton', 'meaningsCard', 'kunReadingsButton', 'kunReadingsCard'];

  showMoreMeanings() {
    this.meaningsButtonTarget.style.display = 'none';
    this.meaningsCardTarget.style.display = 'block';
  }

  showMoreReadings() {
    this.kunReadingsButtonTarget.style.display = 'none';
    this.kunReadingsCardTarget.style.display = 'block';
  }
}
