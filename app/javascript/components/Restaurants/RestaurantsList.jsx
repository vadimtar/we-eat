import React from 'react';
import RestaurantsListItem from './RestaurantsListItem'

export default function RestaurantsList(props) {
	return (
		<div className="restaurants-list">
			{props.restaurants.map(restaurant =>
				<RestaurantsListItem
					key={restaurant.id}
					restaurant={restaurant}
				/>
			)}
		</div>
	);
}