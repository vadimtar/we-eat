import React from 'react';
import { Row, Col } from 'react-bootstrap'

export default function RestaurantsListItem(props) {
	const restaurant = props.restaurant;
	return(
		<div className="restaurants-list-item">
			<Row>
				<Col md={12} className="restaurant-name">
					{restaurant.name}
				</Col>
			</Row>
			<Row>
				<Col md={4}>
					{restaurant.cuisine.name}
				</Col>
				<Col md={4}>
					{restaurant.rating}
				</Col>
				<Col md={4}>
					{restaurant.maximum_delivery_time}
				</Col>
			</Row>
			<Row>
				<Col md={6}>
					{restaurant.address}
				</Col>
				<Col md={6}>
					{restaurant.is_tenbis ? '10Bis' : ''}
				</Col>
			</Row>
		</div>
	)
}