import axios from "axios";
import { FeatureGroup, GeoJSON, Popup } from "react-leaflet";
import React, { useEffect, useState } from "react";
import {onlyUnique, getStyle} from '../styles';
import classyBrew from '../ClassyBrew'

export default function(props){
    //Creamos el state de departamentos, para que lo podamos usar en toda la app.
    const [departamentos, setDepartamentos] = useState(null);
    const [brew, setBrew] = useState(null)

    //En este caso, useEffect se correrá solamente cuando se cargue por primera vez el componente
    // es decir, el siguiente paso se hará solo una vez.
    useEffect(()=>{
        //Utilizamos axios para hacer un request a MapServer
        axios
            .get(process.env.REACT_APP_WFS_GEO_URL + "sgg_grupo08:departamentos")
            .then((response)=>{
                const valoresATomar = [
                    "EXTORSION","HURTO_VEH_MERCADERIA","LESIONES","ROBO_VEH"
                ]
                const deptosOrignial = {...response.data}
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
                    
                    deptosOrignial.features = nuevosFeatures
                }
                setDepartamentos(deptosOrignial)
                var indiceATomar = props.crimen ? props.crimen : 'SUMATORIA_CRIMENES'
                var brewDeptos = new classyBrew();
                brewDeptos.setSeries(
                    deptosOrignial.features.map(feature => feature.properties[indiceATomar])
                )
                brewDeptos.setNumClasses(props.numClasses? props.numClasses:3)
                brewDeptos.setColorCode(props.colorRange? props.colorRange:'RdYlGn')
                brewDeptos.classify('equal_interval');
                setBrew(brewDeptos)
            }) //Una vez encontrado los datos, en formato GeoJSON
            //Lo mandamos a nuestro state.
        
    },[])
    //Lo que devolverá este componente será un FeatureGroup, que incluye (por el momento) un Popup y el poligono.
    return(
        <FeatureGroup>
        {
          departamentos && brew ? //Si los departamenos no están vacios, es decir, no es nulo, sigamos.
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
                var indiceATomar = props.crimen ? props.crimen : 'SUMATORIA_CRIMENES'
                var estilo = getStyle(brew.getColorInRange(departamento.properties[indiceATomar]))
                return ( //Devolvemos el resultado de nuestro componente, es decir, el poligono y el Popup
                <FeatureGroup>
                    <GeoJSON key={index} id={index} data={featuresDepto} style={estilo} 
                        eventHandlers={{
                            click: () => {
                                console.log("Departamento clic: ",departamento.properties.NOMBRE)
                            },
                          }}
                    />
                    <Popup>
                        <strong>Departamento:</strong> {departamento.properties.NOMBRE}<br /> 
                        <strong>{props.title? props.title:"Crimenes"}:</strong> {departamento.properties[indiceATomar]}
                    </Popup>
                </FeatureGroup>
                )
            })
            : "" //Si no se encuentran los departamentos (o al menos aun no porque estan cargando) simplemente no se muestra nada.
        }
      </FeatureGroup>
    )
}