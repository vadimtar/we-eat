import React from 'react';
import { FormGroup, FormControl } from 'react-bootstrap'
import { Row, Col } from 'react-bootstrap'

export default function RestaurantSearch(props) {
	return (
		<Row className="justify-content-center restaurant-name-search-bar">
			<Col md={5}>
				<div className="restaurant-name-search-field">
					<span className="fa fa-search"></span>
					<FormGroup>
						<FormControl
							type="text"
							placeholder="Find a restaurant"
							onChange={props.onRestaurantNameChange}
						/>
					</FormGroup>
				</div>
			</Col>
		</Row>
	);
}