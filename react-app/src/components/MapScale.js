import {React, useEffect} from 'react'
import {useMap} from 'react-leaflet'
import betterscale from './BetterScale'
export default function(props){
    const map = useMap()
    useEffect(()=>{
        betterscale({metric:true, imperial:false}).addTo(map);
    },[map])
    return null
}