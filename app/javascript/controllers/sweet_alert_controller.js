import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2";

// Connects to data-controller="sweet-alert"
export default class extends Controller {
  static targets = ["AddNewCard"]

  connect() {
    console.log("Sweet Alert Controller connected")
  }

  fire() {
    Swal.fire({
      title: "CONGRATS ! YOU HAVE A NEW CARD !",
      background: "linear-gradient(0deg, rgba(255, 255, 255, 0.592874649859944) 3%, #EFB7E9 48%",
      color: "white",
      confirmButtonText: "View card",
      denyButtonText: `Don't save`
    }).then((result) => {
      if (result.isConfirmed) {
          window.location.href = "/users/:id/user_cards";
      } else if (result.isDenied) {
        Swal.fire("Changes are not saved", "", "info");
      }
    });
  }
}
