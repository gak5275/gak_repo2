window.addEventListener('DOMContentLoaded',init,false);
window.addEventListener('DOMContentLoaded',init0,false);


function init0() {
    var buttons = document.getElementsByTagName("button");
buttons[0].addEventListener('click', changeGreen,false);
buttons[1].addEventListener('click', changeRed,false);
}

function changeGreen() {
    var colorMe1 = document.getElementById("colorGreen");
    {colorMe1.style.backgroundColor = "green";
    }
}

function changeRed() {
    var colorMe1 = document.getElementById("colorRed");
    {colorMe1.style.backgroundColor = "red";
    }
}
var originalBackground;
function toggleHighlight() {
    var pos = this.getAttribute('value');
    var color;
    switch (pos) {
        case 'char':
        color = 'yellow';
        break;
        case 'loc':
        color = 'orange';
        break;
        case 'noun':
        color = 'teal';
        break;
        case 'verb':
        color = 'red';
        break;
        case 'adj':
        color = 'violet';
        break;
        case 'stat':
        color = 'lightgreen';
        break;
    }
    var status = this.checked;
    // the status to which you've just changed the checkbox
    var spans = document.getElementsByClassName(pos);
    for (var i = 0; i < spans.length; i++) {
        if (status == true) {
            spans[i].style.backgroundColor = color;
        } else {
            spans[i].style.backgroundColor = originalBackground;
        }
    }
}
function init() {
    originalBackground = document.body.style.backgroundColor;
    var checkboxes = document.getElementsByTagName('input');
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener('click', toggleHighlight, false);
    }
}
window.addEventListener('DOMContentLoaded', init, false);
window.addEventListener('DOMContentLoaded',init0,false);