import React from 'react';
import { Row, Col, PageHeader } from 'react-bootstrap'

export default function Header(props) {
	return (
		<Row className="header">
			<Col md={12}>
				<Row>
					<Col md={12}>
						<PageHeader>WeEat</PageHeader>
					</Col>
				</Row>
				{props.children}
			</Col>
		</Row>
	);
}