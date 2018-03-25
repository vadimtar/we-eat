import React from 'react';
import { Row, Col} from 'react-bootstrap'
import SearchByCuisine from '../Search/SearchByCuisine'
import SearchByRating from '../Search/SearchByRating'
import SearchByDeliveryTime from '../Search/SearchByDeliveryTime'

export default function SearchBar(props){
	return (
		<Row className="search-bar">
			<Col md={3}>
				<SearchByCuisine cuisines={props.searchParams.cuisines}/>
			</Col>
			<Col md={3}>
				<SearchByRating ratings={props.searchParams.ratings}/>
			</Col>
			<Col md={3}>
				<SearchByDeliveryTime deliveryTimes={props.searchParams.deliveryTimes}/>
			</Col>
		</Row>
	);
}
