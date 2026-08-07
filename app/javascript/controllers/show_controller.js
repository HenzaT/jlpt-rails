import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show"
export default class extends Controller {
  static targets = [
    'meaningsButton',
    'meaningsCard',
    'kunReadingsButton',
    'kunReadingsCard',
    'onReadingsButton',
    'onReadingsCard'
  ];

  showMoreMeanings() {
    this.meaningsButtonTarget.style.display = 'none';
    this.meaningsCardTarget.style.display = 'block';
  }

  showMoreKunReadings() {
    this.showMoreReadings(this.kunReadingsButtonTarget, this.kunReadingsCardTarget)
  }

  showMoreOnReadings() {
    this.showMoreReadings(this.onReadingsButtonTarget, this.onReadingsCardTarget)
  }

  showMoreReadings(button, card) {
    button.style.display = 'none';
    card.style.display = 'block';
  }
}
