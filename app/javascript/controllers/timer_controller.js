import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { start: Number }
  static targets = ["output"]

  connect() {
    this.count = this.startValue || 1;
    this.outputTarget.textContent = this.count;

    this.timer = setInterval(() => {
      this.count++;
      this.outputTarget.textContent = this.count;
    }, 1000);
  }

  disconnect() {
    clearInterval(this.timer);
  }
}
