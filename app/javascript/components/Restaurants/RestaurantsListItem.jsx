import React from 'react';
import { Row, Col } from 'react-bootstrap'
import StarRatings from 'react-star-ratings';

export default function RestaurantsListItem(props) {
	const restaurant = props.restaurant;
	return(
		<li
			className="restaurants-list-item"
			onClick={() => props.onRestaurantItemListClick(restaurant)}
		>
			<Row>
				<Col md={6} className="restaurant-name">
					{restaurant.name}
				</Col>
				<Col md={6}>
					<StarRatings
						rating={restaurant.rating}
						numberOfStars={3}
						starDimension="15px"
						starSpacing="2px"
						starRatedColor="#eac23b"
					/>
				</Col>
			</Row>
			<Row>
				<Col md={3}>
					{restaurant.cuisine.name}
				</Col>
				<Col md={4}>
					<i className="fas fa-motorcycle fa-lg"></i>
					&nbsp;{restaurant.maximum_delivery_time}m
				</Col>
				<Col md={3}>
					{restaurant.is_tenbis ?  <img className="ten-bis-img" src="/assets/10bis.png" alt="10Bis"/> : ''}
				</Col>
			</Row>
			<Row className="restaurant-list-item-address">
				<Col md={12}>
					{restaurant.address}
				</Col>
			</Row>
		</li>
	)
}