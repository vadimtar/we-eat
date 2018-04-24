// Run this example by adding <%= javascript_pack_tag 'init' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react';
import ReactDOM from 'react-dom';
import 'bootstrap/dist/css/bootstrap.min.css';
import App from '../components/App/App';
import { BrowserRouter } from 'react-router-dom';

document.addEventListener('DOMContentLoaded', () => {
	ReactDOM.render(
		<BrowserRouter>
			<App/>
		</BrowserRouter>
		,document.body.appendChild(document.createElement('div'))
	)

})