import React from 'react';
import Header from './Header'
import SearchBar from './SearchBar'
import Body from './Body'

const URL = 'http://localhost:3000/api/v1';
const RATINGS = [{id: 1, value: 1},{id: 2, value: 2},{id: 3, value: 3}];
const DELIVERY_TIME = [{id: 1, value: 15},{id: 2, value: 30}, {id: 3, value: 45}, {id: 4, value: 60}];

class App extends React.Component {
	constructor(props){
		super(props);
		this.state = {
			restaurants: [],
			cuisines: []
		}
	}

	componentDidMount() {
		this.fetchRestaurants();
		this.fetchCuisines();
	}

	fetchRestaurants() {
		fetch(URL + '/restaurants')
			.then(response => response.json())
			.then(data => {
				this.setState({restaurants: data});
			})
	}

	fetchCuisines() {
		fetch(URL + '/cuisines')
			.then(response => response.json())
			.then(data => {
				this.setState({cuisines: data});
			})
	}

	render() {
		return (
			<div>
				<Header />
				<SearchBar
					searchParams={{
						cuisines: this.state.cuisines,
						ratings: RATINGS,
						deliveryTimes: DELIVERY_TIME
					}}
				/>
				<Body restaurants={this.state.restaurants} />
			</div>
		);
	}
}

export default App;