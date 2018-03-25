import React from 'react';
import { FormGroup, FormControl } from 'react-bootstrap'

export default function RestaurantSearch() {
	return (
		<FormGroup>
			<FormControl
				type="text"
				placeholder="Search Restaurant"
				// onChange={this.handleChange}
			/>
		</FormGroup>
	);
}