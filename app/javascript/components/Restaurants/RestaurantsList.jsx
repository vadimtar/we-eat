import React from 'react';
import RestaurantsListItem from './RestaurantsListItem'

export default function RestaurantsList(props) {
	return (
		<ul>
			{props.restaurants.map(restaurant =>
				<RestaurantsListItem
					key={restaurant.id}
					restaurant={restaurant}
					onRestaurantItemListClick={props.onRestaurantItemListClick}
				/>
			)}
		</ul>
	);
}