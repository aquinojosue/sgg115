import { StrictMode } from "react";
import ReactDOM from "react-dom";

import App from "./App";
import "bootswatch/dist/zephyr/bootstrap.min.css";

const rootElement = document.getElementById("root");
ReactDOM.render(
  <StrictMode>
    <App />
  </StrictMode>,
  rootElement
);
