import { Controller } from "@hotwired/stimulus"
import  Hammer  from "hammerjs";


export default class extends Controller {
  static targets = ["cards"]


  connect() {
    const cards = this.cardsTarget;
    const hammer = new Hammer(cards);
    hammer.on("swipeleft", this.actionLeftSwipe.bind(this))
    hammer.on("swiperight", this.actionRightSwipe.bind(this))
  }

  actionRightSwipe(event) {
    const card = event.target;
    const cardId = card.dataset.cardId;
    fetch(`/cards/${cardId}/card_wishes`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
      }
    });
    card.classList.add('swipe-right');
    setTimeout(() => card.remove(), 1000);
  }

  actionLeftSwipe(event) {
    const card = event.target;
    card.classList.add('swipe-left');
    setTimeout(() => card.remove(), 1000);
  }

}
