
function getColor(d) {
return d > 1000 ? '#800026' :
    d > 500 ? '#BD0026' :
    d > 200 ? '#E31A1C' :
    d > 100 ? '#FC4E2A' :
    d > 50 ? '#FD8D3C' :
    d > 20 ? '#FEB24C' :
    d > 10 ? '#FED976' :
    '#FFEDA0';
}

function estiloHomicidios(feature) {
    return {
        fillColor: getColor(feature.properties.HOMICIDIOS),
        weight: 2,
        opacity: 1,
        color: 'white',
        dashArray: '3',
        fillOpacity: 0.5
    };
}

function onlyUnique(value, index, self) {
    return self.indexOf(value) === index;
}

export {estiloHomicidios, getColor, onlyUnique}