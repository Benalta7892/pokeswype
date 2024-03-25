import { Controller } from "@hotwired/stimulus"
import Hammer from "hammerjs";
import Swal from "sweetalert2";


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

    fetch(`/card_wishes`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
      },
      body: JSON.stringify({ card_id: cardId })
    });
    event.target.classList.add('swipe-right');
    Swal.fire({
      title: 'Great !',
      text: 'Card added to your wishlist !',
      icon: 'success',
      confirmButtonText: 'Cool'
    })

  }

  actionLeftSwipe(event) {
    const card = event.target;
    card.classList.add('swipe-left');
    setTimeout(() => card.remove(), 1000);
    Swal.fire({
      title: 'Great !',
      text: 'Card added to your wishlist !',
      icon: 'success',
      confirmButtonText: 'Cool'
    })
  }

}
