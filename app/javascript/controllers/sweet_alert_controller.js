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
      background: "black",
      color: "#716add",
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
