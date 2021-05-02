import { MapContainer, TileLayer, LayersControl, LayerGroup } from "react-leaflet";
import DepartamentosHomicidiosLayer from "./components/layers/DepartamentosHomicidiosLayer";
import GimnasiosLayer from "./components/layers/GimnasiosLayer";
import "./styles.css";

const { BaseLayer, Overlay } = LayersControl;

export default function App() {
  return (
    <MapContainer
      center={[13.705953500345197, -89.21219012823919]}
      zoom={9}
    >
      <LayersControl>
        <BaseLayer checked name="OpenStreetMap">
          <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
        </BaseLayer>
        <LayerGroup>
        <Overlay name="Departamentos El Salvador">
          <DepartamentosHomicidiosLayer />
        </Overlay>
        <Overlay name="Gimnasios">
          <GimnasiosLayer />
        </Overlay>
        </LayerGroup>
      </LayersControl>
    </MapContainer>
  );
}
