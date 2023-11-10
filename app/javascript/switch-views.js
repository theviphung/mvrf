function SwitchRestaurantView() {
    var restaurants = document.getElementsByClassName("restaurant-view");
    var i;
    for (i = 0; i < restaurants.length; i++) {
        var openRestaurant = restaurants[i];
        openRestaurant.classList.toggle("show");
    }

    if (document.getElementById("map").classList.contains("show")) {
        document.getElementById("map").classList.remove("show");
    }
}