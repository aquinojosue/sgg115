import { Marker,GeoJSON } from "react-leaflet";
import { useEffect, useState, useRef } from "react";
import { MapContainer, TileLayer, LayersControl, LayerGroup } from "react-leaflet";
import DepartamentosHomicidiosLayer from "./components/layers/DepartamentosHomicidiosLayer";
import GimnasiosLayer from "./components/layers/GimnasiosLayer";
import NatacionLayer from './components/layers/NatacionLayer'
import MunicipiosCrimenesLayer from "./components/layers/MunicipiosCrimenesLayer";
import Header from './components/Header'
import "./styles.css";
import axios from "axios";
import { Container, Row } from "react-bootstrap";
const { BaseLayer, Overlay } = LayersControl;

export default function App() {
  const routeRef = useRef();
  const [location, setLocation] = useState({
    default: true,
    coords: {latitude: 28.365724898272077, longitude: -81.55254364013672}
  })
  const [route, setRoute] = useState(null);
  const options = {
    headers: {'Authorization':'5b3ce3597851110001cf62489a0818074b5c41ae8fb137041419bfa2'}
  }
  useEffect(()=>{
    navigator.geolocation.getCurrentPosition((position)=>{
      setLocation({
        default:false,
        coords: {
          latitude: position.coords.latitude, 
          longitude: position.coords.longitude
        }
      })
      console.log("location",location)
    },(error)=>{
      console.log("error al tratar de obtener la localizacion",error)
    },{enableHighAccuracy: true})
  },[])

  function setRouteORS(destino, name){
    axios
    .post(
      'https://api.openrouteservice.org/v2/directions/driving-car/geojson',{
        "coordinates":[destino,[location.coords.longitude,location.coords.latitude]]
      }, options)
      .then(response=>{
        if (route && route.geojson && routeRef) routeRef.current.clearLayers()
        var ruta = response.data
        setRoute({"name":name,"geojson":ruta})
      })
  }
  useEffect(()=>{
    if(route && route.geojson){
      //routeRef.current.clearLayers()
    }
  },[route])
  return (
    <>
      <Header />
      <Container>
        <Row>  s</Row>
        <Row>
          <MapContainer
            center={[13.705953500345197, -89.21219012823919]}
            zoom={9}
          >
            <LayersControl>
              {/* Definicion de las capas base, osea nuestras capas raster */}
              <BaseLayer  name="OpenStreetMap">
                <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
              </BaseLayer>
              <BaseLayer checked name="ESRI Light Gray Base">
                <TileLayer url="http://services.arcgisonline.com/arcgis/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"/>
              </BaseLayer>
              <BaseLayer name="Vista satelital (ESRI)">
                <TileLayer url="http://services.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}" />
              </BaseLayer>
              <LayerGroup>
                {/* Definicion de nuestras capas de poligonos, las que sacamos de GeoServer */}
                <Overlay name="Departamentos El Salvador">
                  <DepartamentosHomicidiosLayer />
                </Overlay>
                <Overlay name="Gimnasios">
                  <GimnasiosLayer setRoute={setRouteORS}/>
                </Overlay>
                <Overlay name="Natacion">
                  <NatacionLayer setRoute={setRouteORS}/>
                </Overlay>
                {
                  /**<Overlay name="Municipios con crimenes">
                  <MunicipiosCrimenesLayer />
                </Overlay> */
                }
                {
                  !location.default ?  
                  <Overlay checked name="Posicion actual">
                    <Marker position={[location.coords.latitude, location.coords.longitude]} />
                  </Overlay>:""
                }
                {
                  route && route.geojson?
                  <Overlay key={"ruta"+route.name} checked name={"Ruta hacia " + route.name}>
                    <GeoJSON key={"ruta"+route.name} data={route.geojson} ref={routeRef}/>
                  </Overlay>:""
                }
              </LayerGroup>
            </LayersControl>
          </MapContainer>
        </Row>
      </Container>
    </>
  );
}
