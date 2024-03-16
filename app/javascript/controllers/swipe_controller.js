import { Controller } from "@hotwired/stimulus"
import  Hammer  from "hammerjs";

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["card", "cardStack"]


  connect() {
    this.generateCardStacksHTML()
    const card = this.cardTarget;
    const hammer = new Hammer(card);
    hammer.on("panleft", this.actionLeftSwipe)
    hammer.on("panright", this.actionRightSwipe)
  }

  actionLeftSwipe(event) {
    // console.log(event)
    // event.currentTarget.dataset # ici tu auras certainement le card-id
    console.log("I have swiped to the left")
    this.removeCardFromTheStack()
  }

  actionRightSwipe(event) {
    console.log('I have swiped to the right')
    this.removeCardFromTheStack()
    this.addToWishList()
  }


  _removeCardFromTheStack() {
    console.log("je veux retirer la card.")
    // Si c'est la derniere card,
    // Logique pour retirer la card de la pile. => [card1, card2 etc..]
    // Exemple .... .filter...ou ...point autre chose.. avec peuuuuttt etre
    // un paramètre pour savoir quelle carte retirer - Je ne sais pas . Franchement à voir.
    // Je supute.
    // nonente. Ils sont chelous les belges. Mais je les aimes bien. A oui les suisses aussi.
  }

  _addToWishList() {
    console.log("J'ajoute ma card a ma wishlist")
  }

  generateCardStacksHTML() {
    // retoune le html de la stack avec celui de la carD.
  }

  generateMessageNoCardLeft() {
    // retourn ele html s'il n'y a plus de card.
  }


  _cardHtml() {
    // Retourn le HTML de la card.
  }
}
