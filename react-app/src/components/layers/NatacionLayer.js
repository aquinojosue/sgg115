import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { FeatureGroup, GeoJSON, Popup, Marker } from "react-leaflet";
import L from "leaflet";
import iconBaseball from '../../img/club_natacion.svg'
export default function NatacionLayer(props){
    //Instanciamos el state de gimnasios
    const [clubes, setClubes] = useState(null);

    var baseballIcon = L.icon({
		iconUrl: iconBaseball,
		iconSize: [32, 37],
		iconAnchor: [16, 37],
		popupAnchor: [0, -28]
	});
    useEffect(()=>{
        //Traemos los datos del servidor mapserver
        axios
            .get(process.env.REACT_APP_WFS_GEO_URL + "sgg_grupo08:clubes_natacion_sv")
            //Y despues los guardamos en el state de gimnasios
            .then((response)=>setClubes(response.data))
    },[])

    return(
        <FeatureGroup>
        {
            //Si se encontraron gimnasios, o al menos ya cargaron, continuamos.
            clubes?
            //Iteramos en todos los gimnasios
            clubes.features.map((club, index)=>{
                var id_club = "gimnasio_"+index
                return(
                <FeatureGroup>
                    {/**<GeoJSON id={id_gimnasio} key={id_gimnasio} data={gimnasio}/> */}
                    <Marker 
                        id={club}
                        key={club}
                        icon={baseballIcon}
                        position={[club.geometry.coordinates[1],club.geometry.coordinates[0]]}
                        eventHandlers={{
                            click: () => {
                                props.setRoute(club.geometry.coordinates,club.properties.nombre_natacion)
                            },
                          }}
                    />
                    <Popup>
                        <b>{club.properties.nombre_natacion}</b><br/>
                        <b>Departamento: </b>{club.properties.depto} <br/>
                        <b>Teléfono:</b> {club.properties.telefono_natacion}<br/>
                    </Popup>
                </FeatureGroup>
                )
            })
            :""
        }
      </FeatureGroup>
    )
}