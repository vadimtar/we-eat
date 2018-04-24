import React from "react"
import { withScriptjs,
	withGoogleMap,
	GoogleMap,
	Marker,
} from "react-google-maps"

const RestaurantsMap = withScriptjs(withGoogleMap((props) =>
	<GoogleMap
		defaultZoom={16}
		defaultCenter={props.defaultCenter}
	>
		{props.restaurants.map((restaurant) => {
			return (
				<Marker
					key={restaurant.id}
					position={{lng: parseFloat(restaurant.lng), lat: parseFloat(restaurant.lat)}}
				/>
			)
		})}
	</GoogleMap>
));

export default RestaurantsMap