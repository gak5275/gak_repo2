window.addEventListener('DOMContentLoaded',init,false);

function init() {
    alert ('If you are reading this, that means the onclick message worked!');
    var button = document.getElementsByTagName("button")
button.addEventListener('click', changeColor,false)
//var body = document.getElementsByTagName("body")
//body.addEventListener('click', changeColor,false)
}

function changeColor() {
var colorMe1 = document.getElementById("colorToggle") 
{colorMe1.style.backgroundColor = "green";}
}