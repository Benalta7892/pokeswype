import { Controller } from "@hotwired/stimulus"
import  Hammer  from "hammerjs";


export default class extends Controller {
  static targets = ["card", "cardStack"]


  connect() {
    this.generateCardStacksHTML()
    const card = this.cardTarget;
    const hammer = new Hammer(card);
    hammer.on("panleft", this.actionLeftSwipe.bind(this))
    hammer.on("panright", this.actionRightSwipe.bind(this))
  }

  actionLeftSwipe(event) {
    // event.currentTarget.dataset # ici tu auras certainement le card-id le mettre dans uen variable
    const card = this.cardTarget;
    const cardId = card.dataset.cardId;
    console.log(cardId)
    console.log("I have swiped to the left")
    this.removeCardFromTheStack(cardId)
  }

  actionRightSwipe(event) {
    console.log('I have swiped to the right')
    const cardId = event.currentTarget.dataset.cardId;
    this.removeCardFromTheStack(cardId)
    this.addToWishList(cardId)
  }


  removeCardFromTheStack(cardId) {
    console.log(`Attempting to remove card with ID ${cardId}`);
    if (cardId) {
      const cardToRemove = this.cardStackTargets.find(card => card.dataset.cardId === cardId);
      if (cardToRemove) {
        cardToRemove.remove();
        console.log(`Card with ID ${cardId} removed`);
      } else {
        console.log(`No card with ID ${cardId} found`);
      }
    } else {
      console.log("No card ID provided");
    }
  }

  addToWishList() {
    const card = this.cardTarget;
    const cardId = card.dataset.cardId;
    console.log(`Adding card with ID ${cardId} to the wishlist`);
  }

  generateCardStacksHTML() {
    // retoune le html de la stack avec celui de la carD.
  }

  generateMessageNoCardLeft() {
    // retourne le html s'il n'y a plus de card.
  }


  cardHtml() {
    // return html of the card

  }
}
