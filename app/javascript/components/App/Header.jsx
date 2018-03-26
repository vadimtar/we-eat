import React from 'react';
import { Row, Col, PageHeader } from 'react-bootstrap'
import RestaurantSearch from '../Restaurants/RestaurantSearch'
import RestaurantAdd from '../Restaurants/RestaurantAdd'

export default function Header(props) {
	return (
		<Row className="header">
			<div className="container">
				<Row className="text-center">
					<PageHeader className="text-center">WeEat</PageHeader>
				</Row>
				<Row>
					<RestaurantSearch
						onRestaurantNameChange={props.onRestaurantNameChange}
					/>
				</Row>
				<Row>
					<RestaurantAdd />
				</Row>
			</div>
		</Row>
	);
}