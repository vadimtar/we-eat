import React from 'react';
import { Row, Col} from 'react-bootstrap'
import RestaurantsList from '../Restaurants/RestaurantsList'
import RestaurantsMap from '../Restaurants/RestaurantsMap'

export default function Body(props) {
	return(
		<Row className="we-eat-body">
			<Col md={6} className="restaurants-list">
				<RestaurantsList restaurants={props.restaurants}/>
			</Col>
			<Col md={6} className="restaurants-map">
				<RestaurantsMap restaurants={props.restaurants}/>
			</Col>
		</Row>
	)
}

