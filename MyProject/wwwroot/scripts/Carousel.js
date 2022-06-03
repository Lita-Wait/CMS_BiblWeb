var angle = 0;
function galleryspin(sign) {
    spinner = document.querySelector("#spinner");
    if (!sign)
    { angle = angle + 45; }
    else
    { angle = angle - 45; }
    spinner.setAttribute("style", "-webkit-transform: rotateY(" + angle + "deg); -moz-transform: rotateY(" + angle + "deg); transform: rotateY(" + angle + "deg);");
}

//let sliderContainer = document.querySelector("#carousel");
//let innerSlider = document.querySelector("#spinner");

//let pressed = false;
//let startX;
//let x;

//sliderContainer.addEventListener("mousedown", (e) => {
//    pressed = true;

//    startX = e.offsetX;

//    sliderContainer.style.cursor = "grabbing";
//});

//sliderContainer.addEventListener("mouseup", () => {
//    sliderContainer.style.cursor = "grab";
//    pressed = false;

    

//});

//sliderContainer.addEventListener("mousemove", (e) => {
//    if (!pressed) return;
//    e.preventDefault();

//    x = e.offsetX;
//    if (startX - x > 0)
//        galleryspin(true);
//    else
//        galleryspin(false);
    
//});
