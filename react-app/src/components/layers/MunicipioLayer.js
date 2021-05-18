import axios from "axios";
import { FeatureGroup, GeoJSON, Popup, useMap } from "react-leaflet";
import React, { useEffect, useState } from "react";
import {onlyUnique, getStyle} from '../styles';
import classyBrew from '../ClassyBrew'

export default function(props){
    //Creamos el state de departamentos, para que lo podamos usar en toda la app.
    const [municipios, setMunicipios] = useState(null);
    const [brew, setBrew] = useState(null)
    

    //En este caso, useEffect se correrá solamente cuando se cargue por primera vez el componente
    // es decir, el siguiente paso se hará solo una vez.
    useEffect(()=>{
        //Utilizamos axios para hacer un request a MapServer
        axios
            .get(process.env.REACT_APP_WFS_GEO_URL +"sgg_grupo08:municipios")
            .then((response)=>{
                const valoresATomar = [
                    "HOMICIDIO","FALLECIDOS_ACC_TTO","HURTO","SECUESTRO","VIOLACION"
                ]
                const municipiosOriginal = {...response.data}
                if(!props.crimen){
                    const nuevosFeatures = response.data.features.map(feature=>{
                        var sumatoria = 0
                        valoresATomar.map((valorIndex)=>{
                            if(feature.properties[valorIndex])
                                sumatoria += parseInt(feature.properties[valorIndex])
                        })
                        feature.properties.SUMATORIA_CRIMENES = sumatoria
                        return feature
                    })
                    municipiosOriginal.features = nuevosFeatures
                }
                setMunicipios(municipiosOriginal)
                
                //Realizamos las sumas
                var indiceATomar = props.crimen ? props.crimen: "SUMATORIA_CRIMENES"
                var brewMunis = new classyBrew();
                brewMunis.setSeries(municipiosOriginal.features
                    .map(feature => feature.properties[indiceATomar]))
                brewMunis.setNumClasses(props.numClasses? props.numClasses:3)
                brewMunis.setColorCode(props.colorRange? props.colorRange:'RdYlGn')
                brewMunis.classify('equal_interval');
                setBrew(brewMunis)
            }) //Una vez encontrado los datos, en formato GeoJSON
            //Lo mandamos a nuestro state.
        
    },[])


    //Lo que devolverá este componente será un FeatureGroup, que incluye (por el momento) un Popup y el poligono.
    return(
        <FeatureGroup>
        {
          municipios && brew ? //Si los municipios no están vacios, es decir, no es nulo, sigamos.
          municipios
            .features.map(feature => feature.properties.cat) //Primeramente, nos dirigiremos a "features" que es la variable o
                                                            // array donde se encuentran los poligonos y sus datos
                                                            //Después, realizamos un mapeo es decir, iteramos en todos sus valores
                                                            //Y devolvemos "cat", en este caso es el ID del poligono, como lo puso
                                                            // GRASS GIS.

            .filter(onlyUnique)                             //Filtramos utilizando onlyUnique, que se encarga de dejar 
                                                            //solo elementos únicos

            .map((featureID, index) => {                    //Nuevamente realizamos una iteracion por todos los valores que nos dieron
                                                            //de resultado en el filtro, tendrian que ser 1 por depto. osea 14 elementos.

                var featuresMuni = municipios.features  //Mandamos a traer todos los elementos (poligonos o features) que sean 
                    .filter(feature => feature.properties.cat === featureID)    //correspondientes al departamento que se esta iterando.
                
                //Traemos la informacion del departamento, en este caso podemos usar el primer elemento.
                var municipio = featuresMuni[0]
                var indiceATomar = props.crimen ? props.crimen: "SUMATORIA_CRIMENES"
                
                return ( //Devolvemos el resultado de nuestro componente, es decir, el poligono y el Popup
                <FeatureGroup>
                    <GeoJSON key={index} id={index} data={featuresMuni} style={getStyle(brew.getColorInRange(municipio.properties[indiceATomar]))}
                        eventHandlers={{
                            click: () => {
                                console.log("Municipio clic: ",municipio.properties.NOM_MUN)
                            },
                          }}
                    />
                    <Popup>
                        <strong>Municipio:</strong> {municipio.properties.NOM_MUN}<br /> 
                        <strong>{props.title? props.title:"Crimenes"}:</strong> {municipio.properties[indiceATomar]}
                    </Popup>
                </FeatureGroup>
                )
            })
            : "" //Si no se encuentran los departamentos (o al menos aun no porque estan cargando) simplemente no se muestra nada.
        }
      </FeatureGroup>
    )
}