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
    // // const index = this.cardsTarget.querySelectorAll('.card-profil-search').length - 1 ;
    // const card = this.cardsTarget.querySelectorAll('.card-profil-search')[index];
    const card = event.target;
    const cardId = card.dataset.cardId;
    console.log(card);

    fetch(`/card_wishes`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
      },
      body: JSON.stringify({ card_id: cardId })
    });
    event.target.classList.add('swipe-right');
    setTimeout(() => card.remove(), 200);
    const cards = this.cardsTarget;
    if (cards.querySelectorAll('.card-profil-search').length === 0) {
      Swal.fire({
        title: 'No more cards !',
        text: 'You have seen all the cards !',
        icon: 'info',
        confirmButtonText: 'Ok'
      }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "/";
        };
      });
  } else {
        Swal.fire({
          title: 'Great !',
          text: 'Card added to your wishlist !',
          icon: 'success',
          confirmButtonText: 'Cool'
        });
    };
  }
  actionLeftSwipe(event) {
    const index = this.cardsTarget.querySelectorAll('.card-profil-search').length - 1 ;
    const card = this.cardsTarget.querySelectorAll('.card-profil-search')[index];
    card.classList.add('swipe-left');
    console.log(card);
    setTimeout(() => card.remove(), 1000);
    const cards = this.cardsTarget;
    if (cards.querySelectorAll('.card-profil-search').length === 0) {
      Swal.fire({
        title: 'No more cards !',
        text: 'You have seen all the cards !',
        icon: 'info',
        confirmButtonText: 'Ok',
      });
    };
  }

}
