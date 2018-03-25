import React from 'react';
import { Row, Col} from 'react-bootstrap'
import SearchByCuisine from '../Search/SearchByCuisine'
import SearchByRating from '../Search/SearchByRating'
import SearchByDeliveryTime from '../Search/SearchByDeliveryTime'

export default function SearchBar(){
	return (
		<Row className="search-bar">
			<Col md={3}>
				<SearchByCuisine/>
			</Col>
			<Col md={3}>
				<SearchByRating/>
			</Col>
			<Col md={3}>
				<SearchByDeliveryTime/>
			</Col>
		</Row>
	);
}
