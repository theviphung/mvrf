function SwitchRestaurantView(id) {
    
    if (document.getElementById("map").classList.contains("show")) {
        document.getElementById("map").classList.remove("show");
    }

    if (document.getElementById(id).classList.contains("show")) {
        document.getElementById(id).classList.remove("show");
        document.getElementById("map").classList.add("show");
    } else {
        // remove the other shown elements
        var restaurants = document.getElementsByClassName("restaurant-view");
        for (var i = 0; i < restaurants.length; i++) {
            var openRestaurant = restaurants[i];
            if (openRestaurant.classList.contains("show")) {
                openRestaurant.classList.remove("show");
            }
        }
        document.getElementById(id).classList.add("show");
    }

}