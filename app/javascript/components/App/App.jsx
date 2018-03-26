import React from 'react';
import Header from './Header'
import SearchBar from './SearchBar'
import Body from './Body'

const URL = 'http://localhost:3000/api/v1';
const RATINGS = [{id: 1, value: 1},{id: 2, value: 2},{id: 3, value: 3}];
const DELIVERY_TIME = [{id: 1, value: 15},{id: 2, value: 30}, {id: 3, value: 45}, {id: 4, value: 60}];

const filterFunctions = {
	byName: filterParam => {
		return objectToCompare => {
			if(objectToCompare.name.toLowerCase().indexOf(filterParam.toLowerCase()) !== -1) {
				return true;
			}
			return false;
		}
	},
	byCuisineId: filterParam => {
		return objectToCompare => {
			if(objectToCompare.cuisine.id == filterParam) {
				return true;
			}
			return false;
		}
	},
	byMinimumRating: filterParam => {
		return objectToCompare => {
			if(objectToCompare.rating >= filterParam) {
				return true;
			}
			return false;
		}
	},
	byMaximumDeliveryTime: filterParam => {
		return objectToCompare => {
			if(objectToCompare.maximum_delivery_time <= filterParam) {
				return true;
			}
			return false;
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
		fetch(URL + '/restaurants')
			.then(response => response.json())
			.then(data => {
				this.setState({
					restaurants: data,
					filteredRestaurants: data
				});
			})
	}

	fetchCuisines() {
		fetch(URL + '/cuisines')
			.then(response => response.json())
			.then(data => {
				this.setState({cuisines: data});
			})
	}

	handleRestaurantSearchByMaximumDeliveryTime(e) {
		const deliveryTime = e.target.value;
		let filterParams = {...this.state.filterParams};
		filterParams.byMaximumDeliveryTime = deliveryTime;
		this.setState({filterParams: filterParams},() => this.handleRestaurantSearch());
	}

	handleRestaurantSearchByMinimumRating(e) {
		const rating = e.target.value;
		let filterParams = {...this.state.filterParams};
		filterParams.byMinimumRating = rating;
		this.setState({filterParams: filterParams},() => this.handleRestaurantSearch());
	}

	handleRestaurantSearchByCuisineId(e) {
		const cuisineId = e.target.value;
		let filterParams = {...this.state.filterParams};
		filterParams.byCuisineId = cuisineId;
		this.setState({filterParams: filterParams},() => this.handleRestaurantSearch());
	}

	handleRestaurantSearchByName(e) {
		const restaurantName = e.target.value;
		let filterParams = {...this.state.filterParams};
		filterParams.byName = restaurantName;
		this.setState({filterParams: filterParams},() => this.handleRestaurantSearch());
	}

	handleRestaurantSearch() {
		let restaurants = this.state.restaurants.slice();
		for (let key in this.state.filterParams) {
			let filterParam = this.state.filterParams[key];
			if (filterParam !== undefined && filterParam !== '') {
				restaurants = restaurants.filter(filterFunctions[key](filterParam));
			}
		}
		this.setState({filteredRestaurants: restaurants});
	}

	render() {
		return (
			<div>
				<Header
					onRestaurantNameChange={this.handleRestaurantSearchByName}
				/>
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
				<Body restaurants={this.state.filteredRestaurants} />
			</div>
		);
	}
}

export default App;