import React from 'react';
import { Row, Col} from 'react-bootstrap'

export default function Footer(props) {
	return(
		<Row className="we-eat-footer text-center">
			<Col md={12}>
				WeEat by WeWork | Vadim Tarasov
			</Col>
		</Row>
	)
}

