import React from 'react';
import Header from './Header'
import SearchBar from './SearchBar'
import Body from './Body'


class App extends React.Component {
	constructor(props){
		super(props);
		this.state = {
			restaurants: [],
			cuisines: ['Italian'],
			ratings: [1,2,3],
			deliveryTime: [15,30,45,60]
		}
	}

	componentDidMount() {
		let url = 'http://localhost:3000/api/v1/restaurants';

		fetch(url)
			.then(response => response.json())
			.then(data => {
				this.setState({restaurants: data});
			})
	}

	render() {
		return (
			<div>
				<Header />
				<SearchBar />
				<Body restaurants = {this.state.restaurants} />
			</div>
		);
	}
}

export default App;