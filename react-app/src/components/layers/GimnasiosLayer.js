import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { FeatureGroup, GeoJSON, Popup, Marker } from "react-leaflet";
import L from "leaflet";
import iconBaseball from '../../img/baseball-marker.png'
export default function GimnasiosLayer(props){
    //Instanciamos el state de gimnasios
    const [gimnasios, setGimnasios] = useState(null);

    var baseballIcon = L.icon({
		iconUrl: iconBaseball,
		iconSize: [32, 37],
		iconAnchor: [16, 37],
		popupAnchor: [0, -28]
	});
    
    useEffect(()=>{
        //Traemos los datos del servidor mapserver
        axios
            .get(process.env.REACT_APP_WFS_LAYER_URL + "gimnasios")
            //Y despues los guardamos en el state de gimnasios
            .then((response)=>setGimnasios(response.data))
    },[])

    return(
        <FeatureGroup>
        {
            //Si se encontraron gimnasios, o al menos ya cargaron, continuamos.
            gimnasios?
            //Iteramos en todos los gimnasios
            gimnasios.features.map((gimnasio, index)=>{
                var id_gimnasio = "gimnasio_"+index
                return(
                <FeatureGroup>
                    {/**<GeoJSON id={id_gimnasio} key={id_gimnasio} data={gimnasio}/> */}
                    <Marker 
                        id={id_gimnasio}
                        key={id_gimnasio}
                        icon={baseballIcon}
                        position={[gimnasio.geometry.coordinates[1],gimnasio.geometry.coordinates[0]]}
                        eventHandlers={{
                            click: () => {
                                props.setRoute(gimnasio.geometry.coordinates,gimnasio.properties.nombre_gym)
                            },
                          }}
                    />
                    <Popup>
                        <b>{gimnasio.properties.nombre_gym}</b><br/>
                        <b>Teléfono:</b> {gimnasio.properties.telefono_gym}<br/>
                        <button >Aseme clis</button>
                    </Popup>
                </FeatureGroup>
                )
            })
            :""
        }
      </FeatureGroup>
    )
}