import React from 'react';
import { FormGroup, FormControl } from 'react-bootstrap'

export default function SearchSelect(props){
	return (
		<FormGroup controlId={props.controlId}>
			<FormControl componentClass="select" placeholder="select">
				<option value="Select">Select</option>
				{props.options}
			</FormControl>
		</FormGroup>
	);
}