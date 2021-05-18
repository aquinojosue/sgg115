import { Marker,GeoJSON } from "react-leaflet";
import { useEffect, useState, useRef } from "react";
import { MapContainer, TileLayer, LayersControl, LayerGroup } from "react-leaflet";
import DepartamentoLayer from "./components/layers/DepartamentoLayer";
import GimnasiosLayer from "./components/layers/GimnasiosLayer";
import NatacionLayer from './components/layers/NatacionLayer'
import Header from './components/Header'
import "./styles.css";
import axios from "axios";
import { Container, Row } from "react-bootstrap";
import MunicipioLayer from "./components/layers/MunicipioLayer";
import MapScale from "./components/MapScale";
const { BaseLayer, Overlay } = LayersControl;

export default function App() {
  const routeRef = useRef();
  const [location, setLocation] = useState({
    default: true,
    coords: {latitude: 28.365724898272077, longitude: -81.55254364013672}
  })
  const [collapsed,setCollapsed] = useState(true);
  const [selected,setSelected] = useState("home");

  function onOpen(id){
    setCollapsed(false);
    setSelected(id)
  }

  function onClose(){
    setCollapsed(true)
  }
  const [route, setRoute] = useState(null);
  var layers_departamento = [
    {
      "title":"Sumatoria de crimenes",
      "numClasses":4
    },
    {
      "crimen": "EXTORSION",
      "title": "Extorsiones",
      "numClasses":4
    },
    {
      "crimen": "HURTO_VEH_MERCADERIA",
      "title": "Hurtos de vehículos con mercadería",
      "numClasses":4
    },
    {
      "crimen": "LESIONES",
      "title": "Lesiones",
      "numClasses":5
    },
    {
      "crimen": "ROBO_VEH",
      "title": "Robos de vehículos",
      "numClasses":4
    }
  ]
  var layers_municipios = [
    {
      "title": "Sumatoria de crimenes",
      "numClasses":5
    },
    {
      "crimen": "HOMICIDIO",
      "title": "Homicidios"
    },
    {
      "crimen": "FALLECIDOS_ACC_TTO",
      "colorRange":"RdYlGn",
      "title": "Fallecidos en Accidentes de tránsito"
    },
    {
      "crimen": "HURTO",
      "title": "Hurtos",
      "numClasses":4
    },
    {
      "crimen": "SECUESTRO",
      "title": "Secuestros"
    },
    {
      "crimen": "VIOLACION",
      "title": "Violaciones"
    }
  ]
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
        "coordinates":[[location.coords.longitude,location.coords.latitude],destino]
      }, options)
      .then(response=>{
        var ruta = response.data
        if (route && route.geojson && routeRef && route.destineCoords != destino) routeRef.current.clearLayers()
        
        setRoute({"name":name,"geojson":ruta, "destineCoords":destino})
      })
  }

  return (
    <div >
      <Header style={{"z-index":99}}/>
        <Container>
          <Row style={{"margin-top":"10px"}}>
          <MapContainer
            center={[13.705953500345197, -89.21219012823919]}
            className="markercluster-map"

            zoom={9}
          >
            <MapScale key="mapScale"/>
            <LayersControl position="bottomleft">
              {/* Definicion de las capas base, osea nuestras capas raster */}
              <BaseLayer  name="OpenStreetMap">
                <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
              </BaseLayer>
              <BaseLayer checked name="ESRI Dark Gray Base">
                <TileLayer url="http://services.arcgisonline.com/arcgis/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}"/>
              </BaseLayer>
              <BaseLayer name="Vista satelital (ESRI)">
                <TileLayer url="http://services.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}" />
              </BaseLayer>
                {/* Definicion de nuestras capas de poligonos, las que sacamos de GeoServer */}
                
                <Overlay name="Gimnasios">
                  <GimnasiosLayer setRoute={setRouteORS}/>
                </Overlay>
                <Overlay name="Clubes de Natacion">
                  <NatacionLayer setRoute={setRouteORS}/>
                </Overlay>
                
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
                {
                  
                }
                {
                  layers_departamento.map(layer=>(
                    <Overlay name={layer.title + ` (por departamento)`} >
                      <DepartamentoLayer {...layer} />
                    </Overlay>
                  ))
                }                
                {
                  layers_municipios.map(layer=>(
                    <Overlay name={layer.title + ` (por municipio)`} >
                      <MunicipioLayer {...layer} />
                    </Overlay>
                  ))
                }
            </LayersControl>
          </MapContainer></Row>
        </Container>
    </div>
  );
}
