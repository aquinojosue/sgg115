import axios from "axios";
import { FeatureGroup, GeoJSON, Popup } from "react-leaflet";
import React, { useEffect, useState } from "react";
import {onlyUnique, estiloHomicidios} from '../styles';

export default function(){
    //Creamos el state de departamentos, para que lo podamos usar en toda la app.
    const [departamentos, setDepartamentos] = useState(null);

    //En este caso, useEffect se correrá solamente cuando se cargue por primera vez el componente
    // es decir, el siguiente paso se hará solo una vez.
    useEffect(()=>{
        //Utilizamos axios para hacer un request a MapServer
        axios
            .get(process.env.REACT_APP_WFS_LAYER_URL + "departamentos")
            .then((response)=>setDepartamentos(response.data)) //Una vez encontrado los datos, en formato GeoJSON
            //Lo mandamos a nuestro state.
        
    },[])

    //Lo que devolverá este componente será un FeatureGroup, que incluye (por el momento) un Popup y el poligono.
    return(
        <FeatureGroup>
        {
          departamentos ? //Si los departamenos no están vacios, es decir, no es nulo, sigamos.
          departamentos
            .features.map(feature => feature.properties.cat) //Primeramente, nos dirigiremos a "features" que es la variable o
                                                            // array donde se encuentran los poligonos y sus datos
                                                            //Después, realizamos un mapeo es decir, iteramos en todos sus valores
                                                            //Y devolvemos "cat", en este caso es el ID del poligono, como lo puso
                                                            // GRASS GIS.

            .filter(onlyUnique)                             //Filtramos utilizando onlyUnique, que se encarga de dejar 
                                                            //solo elementos únicos

            .map((featureID, index) => {                    //Nuevamente realizamos una iteracion por todos los valores que nos dieron
                                                            //de resultado en el filtro, tendrian que ser 1 por depto. osea 14 elementos.

                var featuresDepto = departamentos.features  //Mandamos a traer todos los elementos (poligonos o features) que sean 
                    .filter(feature => feature.properties.cat === featureID)    //correspondientes al departamento que se esta iterando.
                
                //Traemos la informacion del departamento, en este caso podemos usar el primer elemento.
                var departamento = featuresDepto[0]         
                
                return ( //Devolvemos el resultado de nuestro componente, es decir, el poligono y el Popup
                <FeatureGroup>
                    <GeoJSON key={index} id={index} data={featuresDepto} style={estiloHomicidios} />
                    <Popup>
                        <strong>Departamento:</strong> {departamento.properties.NOMBRE}<br /> 
                        <strong>Homicidios:</strong> {departamento.properties.HOMICIDIOS}
                    </Popup>
                </FeatureGroup>
                )
            })
            : "" //Si no se encuentran los departamentos (o al menos aun no porque estan cargando) simplemente no se muestra nada.
        }
      </FeatureGroup>
    )
}