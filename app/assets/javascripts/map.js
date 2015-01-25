var map;

function showWindow(marker, string){
  var infowindow = new google.maps.InfoWindow({
    content: string
  });

  infowindow.open(map, marker);
}


function initialize() {

  var path = location.search
  //if statement so only run on kit index only ** CONSIDERING REPLACING WHEN JS VALIDATION PRESENT IN KITS ADD FORM
  if (path == "?view=new") {
  
    var mapOptions = {
      zoom: 2,
      center: new google.maps.LatLng(0, 0),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };



    if (document.getElementById("map-canvas-global") != null) {
      map = new google.maps.Map(document.getElementById("map-canvas-global"), mapOptions);
      
      var input = document.getElementById("autocomplete");
      var types = document.getElementById('type-selector');
      // uncomment the following two lines if you want the search bar(for places) inside the map instead of outside the map
      // map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
      // map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

      var autocomplete = new google.maps.places.Autocomplete(input);
      autocomplete.bindTo('bounds', map);

      google.maps.event.addListener(autocomplete, 'place_changed', function() {
        var place = autocomplete.getPlace();
        if (!place.geometry) {
          return;
        }

        if (place.geometry.viewport) {
          map.fitBounds(place.geometry.viewport);
        } else {
          map.setCenter(place.geometry.location);
          map.setZoom(17);  // Why 17? Because it looks good.
        }
      });
    }
  }
}

$(function(){
  initialize()
});
