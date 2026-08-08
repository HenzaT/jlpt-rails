import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card"
export default class extends Controller {
  static targets = ['kanjiCard'];

  // markLearnt() {
  //   console.log('clicked')
  //   this.kanjiCardTarget.style.borderColor = "gold";
  // }
}
