import React from 'react';
import { Row } from 'react-bootstrap'
import Header from './Header'
import SearchBar from './SearchBar'
import Body from './Body'
import Footer from './Footer'
import RestaurantSearch from '../Restaurants/RestaurantSearch'


const RATINGS = [{id: 1, value: 1},{id: 2, value: 2},{id: 3, value: 3}];
const DELIVERY_TIME = [{id: 1, value: 15},{id: 2, value: 30}, {id: 3, value: 45}, {id: 4, value: 60}];

const filterFunctions = {
	byName: filterParam => {
		return objectToCompare => {
			return objectToCompare.name.toLowerCase().indexOf(filterParam.toLowerCase()) !== -1
		}
	},
	byCuisineId: filterParam => {
		return objectToCompare => {
			return objectToCompare.cuisine.id === parseInt(filterParam)
		}
	},
	byMinimumRating: filterParam => {
		return objectToCompare => {
			return objectToCompare.rating >= filterParam
		}
	},
	byMaximumDeliveryTime: filterParam => {
		return objectToCompare => {
			return objectToCompare.maximum_delivery_time <= filterParam
		}
	}
};

class App extends React.Component {
	constructor(props){
		super(props);
		this.state = {
			restaurants: [],
			cuisines: [],
			filteredRestaurants: [],
			filterParams: {
				byName: '',
				byCuisineId: '',
				byMinimumRating: '',
				byMaximumDeliveryTime: ''
			}
		};

		this.handleRestaurantSearchByName = this.handleRestaurantSearchByName.bind(this);
		this.handleRestaurantSearchByCuisineId = this.handleRestaurantSearchByCuisineId.bind(this);
		this.handleRestaurantSearchByMinimumRating = this.handleRestaurantSearchByMinimumRating.bind(this);
		this.handleRestaurantSearchByMaximumDeliveryTime = this.handleRestaurantSearchByMaximumDeliveryTime.bind(this);
	}

	componentDidMount() {
		this.fetchRestaurants();
		this.fetchCuisines();
	}

	fetchRestaurants() {
		fetch('api/v1/restaurants')
			.then(response => response.json())
			.then(data => {
				this.setState({
					restaurants: data,
					filteredRestaurants: data
				});
			})
	}

	fetchCuisines() {
		fetch('api/v1/cuisines')
			.then(response => response.json())
			.then(data => {
				this.setState({cuisines: data});
			})
	}

	handleRestaurantSearchByMaximumDeliveryTime(e) {
		this.filterRestaurants('byMaximumDeliveryTime', e.target.value);
	}

	handleRestaurantSearchByMinimumRating(e) {
		this.filterRestaurants('byMinimumRating', e.target.value);
	}

	handleRestaurantSearchByCuisineId(e) {
		this.filterRestaurants('byCuisineId', e.target.value);
	}

	handleRestaurantSearchByName(e) {
		this.filterRestaurants('byName', e.target.value);
	}
	
	filterRestaurants(name, value) {
		let filterParams = {...this.state.filterParams};
		filterParams[name] = value;
		this.setState({filterParams: filterParams},() => this.handleRestaurantSearch());
	}

	handleRestaurantSearch() {
		let restaurants = this.state.restaurants.slice();
		for(let key in this.state.filterParams) {
			let filterParam = this.state.filterParams[key];
			if (filterParam !== undefined && filterParam !== '') {
				restaurants = restaurants.filter(filterFunctions[key](filterParam));
			}
		}
		this.setState({filteredRestaurants: restaurants});
	}

	render() {
		return (
			<div className="container-fluid">
				<Header>
					<RestaurantSearch className="restaraunt-search-header text-center"
						onRestaurantNameChange={this.handleRestaurantSearchByName}
					/>
				</Header>
				<Row className="search-bar-container">
					<div className="container">
						<SearchBar
							filterParams={{
								cuisines: this.state.cuisines,
								ratings: RATINGS,
								deliveryTimes: DELIVERY_TIME
							}}
							onRestaurantCuisineChange={this.handleRestaurantSearchByCuisineId}
							onRestaurantRatingChange={this.handleRestaurantSearchByMinimumRating}
							onRestaurantDeliveryTimeChange={this.handleRestaurantSearchByMaximumDeliveryTime}
						/>
					</div>
				</Row>
				<div className="container">
					<Body
						restaurants={this.state.filteredRestaurants}
						defaultCenter={{ lat: 32.0756665, lng: 34.7807043 }}
					/>
				</div>
				<Footer />
			</div>
		);
	}
}

export default App;