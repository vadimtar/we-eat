import React from 'react';
import { Row } from 'react-bootstrap'
import RestaurantSearch from '../Restaurants/RestaurantSearch'
import RestaurantAdd from '../Restaurants/RestaurantAdd'

export default function Header() {
	return (
		<Row className="header">
			<div className="container">
				<h1 className="text-center">WeEat</h1>
				<RestaurantSearch />
				<RestaurantAdd />
			</div>
		</Row>
	);
}