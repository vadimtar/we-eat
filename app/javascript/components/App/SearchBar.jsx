import React from 'react';
import { Row, Col} from 'react-bootstrap'
import SearchByCuisine from '../Search/SearchByCuisine'
import SearchByRating from '../Search/SearchByRating'
import SearchByDeliveryTime from '../Search/SearchByDeliveryTime'

export default function SearchBar(props){
	return (
		<Row className="search-bar justify-content-center">
			<Col md={4}>
				<label>Cuisine</label>
				<SearchByCuisine
					cuisines={props.filterParams.cuisines}
					onRestaurantCuisineChange={props.onRestaurantCuisineChange}
				/>
			</Col>
			<Col md={4}>
				<label>Min Rating</label>
				<SearchByRating
					ratings={props.filterParams.ratings}
					onRestaurantRatingChange={props.onRestaurantRatingChange}
				/>
			</Col>
			<Col md={4}>
				<label>Max Delivery Time</label>
				<SearchByDeliveryTime
					deliveryTimes={props.filterParams.deliveryTimes}
					onRestaurantDeliveryTimeChange={props.onRestaurantDeliveryTimeChange}
				/>
			</Col>
		</Row>
	);
}
