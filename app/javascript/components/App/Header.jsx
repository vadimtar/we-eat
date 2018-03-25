import React from 'react';
import { Row, Col, PageHeader } from 'react-bootstrap'
import RestaurantSearch from '../Restaurants/RestaurantSearch'
import RestaurantAdd from '../Restaurants/RestaurantAdd'

export default function Header() {
	return (
		<Row className="header">
			<div className="container">
				<Row className="text-center">
					<PageHeader className="text-center">WeEat</PageHeader>
				</Row>
				<Row>
					<RestaurantSearch />
				</Row>
				<Row>
					<RestaurantAdd />
				</Row>
			</div>
		</Row>
	);
}