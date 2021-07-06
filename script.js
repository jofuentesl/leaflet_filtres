var map = L.map('mapid').on('load', onMapLoad).setView([41.400, 2.206], 12);
//map.locate({setView: true, maxZoom: 17});
	
var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);

//en el clusters almaceno todos los markers
var markers = L.markerClusterGroup();
var data_markers = [];
let arrayRestaurant = [];
let arraySplit = [];

function onMapLoad() {
  
	let url = '/mapa/api/apiRestaurants.php';
 
  	$.getJSON(url, function(result){
    	console.log("Json=>", result);
		//Guardem els marcadors
		result.forEach((item)=> {
			data_markers.push(item);
		});
		
		//Recollim els tipus de restauntant
		result.forEach((item)=> {
			if(!arrayRestaurant.includes(item.kind_food)) {
				arrayRestaurant.push(item.kind_food);
			};
			console.log("test split", arrayRestaurant);
		});
		//Apliquem la funció split per separar els diferents components del registre	
		arrayRestaurant.forEach((item) => {
			let x = item.split(',');
			arraySplit.push(x);
		});
	
		//Concatenem els diferents arrays per fer los opcions del select i eliminem duplicats
		const newarray = Array.prototype.concat(...arraySplit);
		const newrestauranList = [... new Set(newarray)];
		
		var select = document.getElementById("kind_food_selector");
		//Ordenem alfabeticament
		newrestauranList.sort();
			for(var i=0; i < newrestauranList.length; i++){ 
				var option = document.createElement("option"); //Cream l'opcio
				option.innerHTML = newrestauranList[i]; //Afegim el text
				select.appendChild(option); //Afegim l'opcio
			}
			//cridem a la funcio per pintar els restaurants
			let filter = "";
			console.log("test filter", filter);
			render_to_map(data_markers,filter);	
		});
}

	  /*
	FASE 3.1
		1) Relleno el data_markers con una petición a la api
		2) Añado de forma dinámica en el select los posibles tipos de restaurantes
		3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
	*/

$('#kind_food_selector').on('change', function() {
	
  	let filter = this.value.length=0 ? filter="": this.value;
  	console.log("filterssss", filter);
  		render_to_map(data_markers, filter);
});


function render_to_map(data_markers,filter) {

	//Eliminem els marcadors
	map.eachLayer(function(layer) {
		if (!!layer.toGeoJSON) {
    		map.removeLayer(layer);
  		}
	});

	let newData_markers = [];
	
	//filtrem l'array segons criteri dels arguments de la funció	
	let itemArray = data_markers.filter((item => 
		item.kind_food.indexOf(filter) > -1));
		
	/*
	FASE 3.2
		1) Limpio todos los marcadores
		2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
	*/
	
	itemArray.forEach(function(point){
		let lat = point.lat;
		let lon = point.lng;
	
		var feature = {type: 'Feature',
			properties: point,
			geometry: {
				type: 'Point',
				coordinates: [lon,lat]
			}
		};
			return newData_markers.push(feature);
		
		});

	geoJson = { type: 'FeatureCollection', features: newData_markers };
	L.geoJson(geoJson).addTo(map);
}