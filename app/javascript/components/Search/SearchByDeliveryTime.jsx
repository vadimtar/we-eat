import React from 'react';
import SearchSelect from './SearchSelect'

export default function SearchByDeliveryTime(props){
	const options = props.deliveryTimes.map(deliveryTime => {
		return (
			<option key={deliveryTime.id} value={deliveryTime.value}>{deliveryTime.value}</option>
		)
	});

	return (
		<SearchSelect
			controlId='formControlsSelectDeliveryTime'
			options={options}
			onSelectChange={props.onRestaurantDeliveryTimeChange}
		/>
	);
}