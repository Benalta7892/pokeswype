[1mdiff --git a/app/controllers/dashboards_controller.rb b/app/controllers/dashboards_controller.rb[m
[1mindex 064ac4d..94b8364 100644[m
[1m--- a/app/controllers/dashboards_controller.rb[m
[1m+++ b/app/controllers/dashboards_controller.rb[m
[36m@@ -3,6 +3,8 @@[m [mclass DashboardsController < ApplicationController[m
 [m
   def last_captured[m
     @user = current_user[m
[32m+[m[32m    @cards_collection = @user.cards[m
[32m+[m[32m    @total_cards = @user.cards.count[m
     @recent_cards = @user.cards.order(created_at: :desc)[m
   end[m
 [m
[1mdiff --git a/app/javascript/controllers/sweet_alert_controller.js b/app/javascript/controllers/sweet_alert_controller.js[m
[1mindex d609d8e..daa7640 100644[m
[1m--- a/app/javascript/controllers/sweet_alert_controller.js[m
[1m+++ b/app/javascript/controllers/sweet_alert_controller.js[m
[36m@@ -18,7 +18,7 @@[m [mexport default class extends Controller {[m
       denyButtonText: `Don't save`[m
     }).then((result) => {[m
       if (result.isConfirmed) {[m
[31m-          window.location.href = "/users/:id/user_cards";[m
[32m+[m[32m          window.location.href = "/dashboards/last_captured";[m
       } else if (result.isDenied) {[m
         Swal.fire("Changes are not saved", "", "info");[m
       }[m
[1mdiff --git a/app/javascript/controllers/swipe_controller.js b/app/javascript/controllers/swipe_controller.js[m
[1mindex f85be64..66b16a6 100644[m
[1m--- a/app/javascript/controllers/swipe_controller.js[m
[1m+++ b/app/javascript/controllers/swipe_controller.js[m
[36m@@ -13,9 +13,9 @@[m [mexport default class extends Controller {[m
     hammer.on("swipeleft", this.actionLeftSwipe.bind(this))[m
     hammer.on("swiperight", this.actionRightSwipe.bind(this))[m
   }[m
[31m-[m
   actionRightSwipe(event) {[m
[31m-    const card = event.target;[m
[32m+[m[32m    const index = this.cardsTarget.querySelectorAll('.card-profil-search').length - 1 ;[m
[32m+[m[32m    const card = this.cardsTarget.querySelectorAll('.card-profil-search')[index];[m
     const cardId = card.dataset.cardId;[m
 [m
     fetch(`/card_wishes`, {[m
[36m@@ -27,23 +27,44 @@[m [mexport default class extends Controller {[m
       body: JSON.stringify({ card_id: cardId })[m
     });[m
     event.target.classList.add('swipe-right');[m
[31m-    setTimeout(() => card.remove(), 1000);[m
[31m-    Swal.fire({[m
[31m-      title: 'Great !',[m
[31m-      text: 'Card added to your wishlist !',[m
[31m-      icon: 'success',[m
[31m-      confirmButtonText: 'Cool',[m
[31m-      didOpen: () => {[m
[31m-        document.querySelector('.swal2-height-auto').classList.remove('swal2-height-auto');[m
[31m-        }[m
[31m-    })[m
[31m-[m
[32m+[m[32m    setTimeout(() => card.remove(), 200);[m
[32m+[m[32m  //   const cards = this.cardsTarget;[m
[32m+[m[32m  //   if (cards.querySelectorAll('.card-profil-search').length === 1) {[m
[32m+[m[32m  //     Swal.fire({[m
[32m+[m[32m  //       title: 'No more cards !',[m
[32m+[m[32m  //       text: 'You have seen all the cards !',[m
[32m+[m[32m  //       icon: 'info',[m
[32m+[m[32m  //       confirmButtonText: 'Ok'[m
[32m+[m[32m  //     }).then((result) => {[m
[32m+[m[32m  //       if (result.isConfirmed) {[m
[32m+[m[32m  //           window.location.href = "/";[m
[32m+[m[32m  //       };[m
[32m+[m[32m  //     });[m
[32m+[m[32m  // } else {[m
[32m+[m[32m  //       Swal.fire({[m
[32m+[m[32m  //         title: 'Great !',[m
[32m+[m[32m  //         text: 'Card added to your wishlist !',[m
[32m+[m[32m  //         icon: 'success',[m
[32m+[m[32m  //         confirmButtonText: 'Cool'[m
[32m+[m[32m  //       });[m
[32m+[m[32m  //   };[m
[32m+[m[32m  // }[m
   }[m
[31m-[m
   actionLeftSwipe(event) {[m
[31m-    const card = event.target;[m
[32m+[m[32m    const index = this.cardsTarget.querySelectorAll('.card-profil-search').length - 1 ;[m
[32m+[m[32m    const card = this.cardsTarget.querySelectorAll('.card-profil-search')[index];[m
     card.classList.add('swipe-left');[m
[32m+[m[32m    console.log(card);[m
     setTimeout(() => card.remove(), 1000);[m
[32m+[m[32m    const cards = this.cardsTarget;[m
[32m+[m[32m    if (cards.querySelectorAll('.card-profil-search').length === 1) {[m
[32m+[m[32m      Swal.fire({[m
[32m+[m[32m        title: 'No more cards !',[m
[32m+[m[32m        text: 'You have seen all the cards !',[m
[32m+[m[32m        icon: 'info',[m
[32m+[m[32m        confirmButtonText: 'Ok',[m
[32m+[m[32m      });[m
[32m+[m[32m    };[m
   }[m
 [m
 }[m
[1mdiff --git a/app/views/dashboards/last_captured.html.erb b/app/views/dashboards/last_captured.html.erb[m
[1mindex 1517d14..e7b9a23 100644[m
[1m--- a/app/views/dashboards/last_captured.html.erb[m
[1m+++ b/app/views/dashboards/last_captured.html.erb[m
[36m@@ -12,7 +12,7 @@[m
   </div>[m
 [m
   <div class="title-last-captured">[m
[31m-    <h1>Last captured cards</h1>[m
[32m+[m[32m    <h1>Last captured </h1>[m
   </div>[m
 [m
 [m
