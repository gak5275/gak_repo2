window.addEventListener('DOMContentLoaded',init,false);

function init() {
    var buttons = document.getElementsByTagName("button")
buttons[0].addEventListener('click', changeGreen,false)
buttons[0].addEventListener('click', changeRed,false)
}

function changeGreen() {
    var colorMe1 = document.getElementById("colorGreen")
    {colorMe1.style.backgroundColor = "green";
    }
}

function changeRed() {
    var colorMe1 = document.getElementById("colorRed")
    {colorMe1.style.backgroundColor = "red";
    }
}