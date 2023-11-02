// toggle hiding and showing dropdown content when button is clicked
function OpenFilters() {
    document.getElementById("filters").classList.toggle("show");
}

function OpenSortBy() {
    document.getElementById("sorting").classList.toggle("show");
}

window.onclick = function(event) {
    if (!event.target.matches(".filters-button")) {
        var dropdowns = document.getElementByClassName("filters-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains("show")) {
                openDropdown.classList.remove("show");
            }
        }
    }
}

window.onclick = function(event) {
    if (!event.target.matches(".sorting-button")) {
        var dropdowns = document.getElementByClassName("sorting-methods");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains("show")) {
                openDropdown.classList.remove("show");
            }
        }
    }
}