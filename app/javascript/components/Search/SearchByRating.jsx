import React from 'react';
import SearchSelect from "./SearchSelect";

export default function SearchByRating(props){
	const options = props.ratings.map(rating => {
		return (
			<option key={rating.id} value={rating.id}>{rating.value}</option>
		)
	});

	return (
		<SearchSelect
			controlId='formControlsSelectRating'
			options={options}
			onSelectChange={props.onRestaurantRatingChange}
		/>
	);
}