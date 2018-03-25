import React from 'react';
import SearchSelect from './SearchSelect'

export default function SearchByCuisine(props){
	const options = props.cuisines.map(cuisine => {
		return (
			<option key={cuisine.id} value={cuisine.id}>{cuisine.name}</option>
		)
	});

	return (
		<SearchSelect
			controlId='formControlsSelectCuisine'
			options={options}
		/>
	);
}