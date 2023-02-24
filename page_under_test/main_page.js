window.onload = function () {
    /* Promo-block showing */
    let promoImmediate = document.querySelector(".promo-block.immediate");
    let promoNotImmediate = document.querySelector(".promo-block.not-immediate");

    setTimeout(function () {
        promoImmediate.classList.remove("hidden");
        promoNotImmediate.classList.remove("hidden");
    }, 1000);
};
