function getStyle(fillColor){
    return {
        fillColor: fillColor,
        weight: 2,
        opacity: 1,
        color: 'white',
        fillOpacity: 0.5
    };

}

function onlyUnique(value, index, self) {
    return self.indexOf(value) === index;
}

export {onlyUnique,getStyle}