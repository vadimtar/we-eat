import React from 'react';
import { Row, Col, Modal } from 'react-bootstrap'

class ModalAddReview extends React.Component {
	constructor(props, context) {
		super(props, context);
	}


	render() {
		return (
			<Modal show={this.props.show} onHide={this.props.onHide}>
				<Modal.Header closeButton>
					<Modal.Title>Modal heading</Modal.Title>
				</Modal.Header>
			</Modal>
		);
	}
}

export default ModalAddReview;