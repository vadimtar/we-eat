import React from 'react';
import { Row, Col, FormGroup, FormControl } from 'react-bootstrap'
import { Redirect } from 'react-router';

class Restaurant extends React.Component{

	constructor(props) {
		super(props);

		this.state = {
			shouldRedirect: false,
			cuisineId: null,
			name: '',
			address: '',
			isTenbis: false,
			maxDeliveryTime: null,
		};

		this.handleNameChange = this.handleNameChange.bind(this);
		this.handleCuisineIdChange = this.handleCuisineIdChange.bind(this);
		this.handleAddressChange = this.handleAddressChange.bind(this);
		this.handleIsTenbisChange = this.handleIsTenbisChange.bind(this);
		this.handleMaxDeliveryChange = this.handleMaxDeliveryChange.bind(this);
		this.handleSubmitForm = this.handleSubmitForm.bind(this);

	}

	handleSubmitForm(e) {
		e.preventDefault();
		fetch('api/v1/restaurants', {
			method: 'POST',
			headers: {
				'Accept': 'application/json',
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				name: this.state.name,
				cuisine_id: this.state.cuisineId,
				is_tenbis: this.state.isTenbis,
				address: this.state.address,
				maximum_delivery_time: this.state.maxDeliveryTime,
			})
		}).then(response => {
			this.setState({shouldRedirect: true})
		})
	}

	handleNameChange(e) {
		this.setState({name: e.target.value})
	}

	handleCuisineIdChange(e) {
		this.setState({cuisineId: e.target.value})
	}

	handleAddressChange(e) {
		this.setState({address: e.target.value})
	}

	handleIsTenbisChange(e) {
		this.setState({isTenbis: e.target.value})
	}

	handleMaxDeliveryChange(e) {
		this.setState({maxDeliveryTime: e.target.value})
	}

	render() {
		const options = this.props.cuisines.map(cuisine => {
			return (
				<option key={cuisine.id} value={cuisine.id}>{cuisine.name}</option>
			)
		});
		if (this.state.shouldRedirect) {
			return <Redirect to='/'/>;
		}
		return(
			<div className="container">
				<div className="add-restaurant-title"><h3>Add a Restaurant</h3></div>
				<form onSubmit={this.handleSubmitForm}>
					<Row>
						<label htmlFor="name">
							Name
							<br/>
							<input type="text" onChange={this.handleNameChange} required />
						</label>
					</Row>
					<Row>
						<label htmlFor="cuisine">
							Cuisine
							<FormGroup controlId="cuisines">
								<FormControl componentClass="select" onChange={this.handleCuisineIdChange} placeholder="select" >
									<option value="">Select</option>
									{options}
								</FormControl>
							</FormGroup>
						</label>
					</Row>
					<Row>
						<label htmlFor="address">
							Address
							<br/>
							<input type="text" onChange={this.handleAddressChange} required />
						</label>
					</Row>
					<Row>
						<label htmlFor="max-delivery-minutes">
							Max delivery time
							<br/>
							<input type="text" onChange={this.handleMaxDeliveryChange} required />
						</label>
					</Row>
					<Row>
						<label htmlFor="10bis">
							10bis?
							<br/>
							<input type="checkbox" onChange={this.handleIsTenbisChange}/>
						</label>
					</Row>
					<Row>
						<input className="submit-btn" type="submit" value="Submit" />
					</Row>
				</form>
			</div>
		)
	}

}

export default Restaurant;