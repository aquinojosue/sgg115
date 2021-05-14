import React from 'react';
import Navbar from 'react-bootstrap/Navbar'
import {Container, NavbarBrand } from 'react-bootstrap'
export default function(){
    return(
    <>
        <Navbar bg="dark" variant="dark">
            <Container>
                <NavbarBrand>Sistema de ayuda para ejercitarse - SGG115 Grupo 08 2021</NavbarBrand>
            </Container>
        </Navbar>
    </>
    )
}