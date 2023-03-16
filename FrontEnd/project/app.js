var c1t = document.querySelector(".title-1");
var c2t = document.querySelector(".title-2");
var c3t = document.querySelector(".title-3");
var c1d = document.querySelector(".dis-1");
var c2d = document.querySelector(".dis-2");
var c3d = document.querySelector(".dis-3");

c1t.addEventListener("mouseover", () => mouseOver(1));

c2t.addEventListener("mouseover", () => mouseOver(2));

c3t.addEventListener("mouseover", () => mouseOver(3));

function mouseOver(i) {
    if (i == 1) {
        c1t.style.gridColumn = "1";
        c1d.style.display = "flex";
        c1d.style.gridColumn = "2 / span 3";
        c2t.style.gridColumn = "5";
        c2d.style.display = "none";
        c3t.style.gridColumn = "6";
        c3t.style.borderRadius = " 0 1rem 1rem 0";
        c3d.style.display = "none";
    } else if (i == 2) {
        c1t.style.gridColumn = "1";
        c1d.style.display = "none";
        c2t.style.gridColumn = "2";
        c2d.style.gridColumn = "3 / span 3";
        c2d.style.display = "flex";
        c3t.style.gridColumn = "6";
        c3t.style.borderRadius = " 0 1rem 1rem 0";
        c3d.style.display = "none";
    } else {
        c1t.style.gridColumn = "1";
        c1d.style.display = "none";
        c2t.style.gridColumn = "2";
        c2d.style.display = "none";
        c3t.style.gridColumn = "3";
        c3t.style.borderRadius = "0";
        c3d.style.gridColumn = "4 / span 3";
        c3d.style.display = "flex";
    }
}
