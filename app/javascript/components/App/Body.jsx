import React from 'react';
import { Row, Col, Button } from 'react-bootstrap'
import RestaurantsList from '../Restaurants/RestaurantsList'
import RestaurantsMap from '../Restaurants/RestaurantsMap'

class Body extends React.Component{
	constructor(props) {
		super(props);
		this.state = {
			defaultCenter: props.defaultCenter,
			restaurantsOnMap: props.restaurants
		};
		this.handleShowAllRestaurantsOnMap = this.handleShowAllRestaurantsOnMap.bind(this);
		this.handleRestaurantItemListClick = this.handleRestaurantItemListClick.bind(this);
	}

	handleRestaurantItemListClick(restaurant){
		this.setState({
			defaultCenter: {lng: restaurant.lng, lat: restaurant.lat},
			restaurantsOnMap: [restaurant]
		})
	}

	handleShowAllRestaurantsOnMap(){
		this.setState({
			defaultCenter: this.props.defaultCenter,
			restaurantsOnMap: this.props.restaurants
		})
	}

	componentWillReceiveProps(props){
		this.setState({restaurantsOnMap: props.restaurants})
	}

	render() {
		return(
			<Row className="we-eat-body">
				<Col md={4} className="restaurants-list">
					<RestaurantsList
						restaurants={this.props.restaurants}
						onRestaurantItemListClick={this.handleRestaurantItemListClick}
					/>
				</Col>
				<Col md={8} className="restaurants-map">
					<Button bsSize="small" className="show-all-on-map-button" onClick={this.handleShowAllRestaurantsOnMap}>
						Show All
					</Button>
					<RestaurantsMap
						isMarkerShown
						googleMapURL="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=geometry,drawing,places"
						loadingElement={<div style={{ height: `100%` }} />}
						containerElement={<div style={{ height: `580px` }} />}
						mapElement={<div style={{ height: `100%` }} />}
						restaurants={this.state.restaurantsOnMap}
						defaultCenter={this.state.defaultCenter}
					/>
				</Col>
			</Row>
		)
	}
}

export default Body;

