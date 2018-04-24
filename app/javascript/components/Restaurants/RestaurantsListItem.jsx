import React from 'react';
import { Row, Col, Button, OverlayTrigger, Tooltip } from 'react-bootstrap'
import StarRatings from 'react-star-ratings';

class RestaurantsListItem extends React.Component {
	constructor(props){
		super(props);

		this.state = {
			showAddReviewModal: false
		};

		this.handleShowAddNewReviewModal = this.handleShowAddNewReviewModal.bind(this);
		this.handleHideAddNewReviewModal = this.handleHideAddNewReviewModal.bind(this);
	}

	handleShowAddNewReviewModal(e) {
		e.stopPropagation();
		// this.setState({
		// 	showAddReviewModal: true
		// })
	}

	handleHideAddNewReviewModal() {
		this.setState({
			showAddReviewModal: false
		})
	}

	render() {
		const restaurant = this.props.restaurant;
		const restaurantRating = parseFloat((restaurant.rating * 100) / 100).toFixed(2);
		const tooltip = <Tooltip id="modal-tooltip">wow.</Tooltip>;
		return(
			<div>
				<li
					className="restaurants-list-item"
					onClick={() => this.props.onRestaurantItemListClick(restaurant)}
				>
					<Row>
						<Col md={5} className="restaurant-name">
							{restaurant.name}
						</Col>
						<Col md={7}>
							<StarRatings
								rating={parseFloat(restaurantRating)}
								numberOfStars={3}
								starDimension="15px"
								starSpacing="2px"
								starRatedColor="#eac23b"
							/>
							&nbsp;
							<span className="restaurant-rating-in-float">
							({restaurantRating} {restaurant.reviews_count > 0 && <span>from {restaurant.reviews_count} reviews</span>}
								)
							</span>
						</Col>
					</Row>
					<Row>
						<Col md={3}>
							{restaurant.cuisine.name}
						</Col>
						<Col md={4}>
							<i className="fas fa-motorcycle fa-lg"></i>
							&nbsp;{restaurant.maximum_delivery_time}m
						</Col>
						<Col md={3}>
							{restaurant.is_tenbis ?  <img className="ten-bis-img" src="/assets/10bis.png" alt="10Bis"/> : ''}
						</Col>
					</Row>
					<Row className="restaurant-list-item-address">
						<Col md={12}>
							{restaurant.address}
						</Col>
					</Row>
					<Row className="restaurant-list-item-actions">
						<Col md={2}>
								<Button bsSize="xsmall" onClick={this.handleShowAddNewReviewModal}>
									<i className="fas fa-user-plus fa-sm"></i>
								</Button>
						</Col>
						<Col md={2}>
							<Button bsSize="xsmall">
								<i className="fas fa-info-circle fa-sm"></i>
							</Button>
						</Col>
					</Row>
				</li>
			</div>
		)
	}

}

export default RestaurantsListItem;