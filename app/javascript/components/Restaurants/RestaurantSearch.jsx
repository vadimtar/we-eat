import React from 'react';
import { FormGroup, FormControl } from 'react-bootstrap'

export default function RestaurantSearch(props) {
	return (
		<FormGroup>
			<FormControl
				type="text"
				placeholder="Search Restaurant"
				onChange={props.onRestaurantNameChange}
			/>
		</FormGroup>
	);
}