import * as React from 'react';
import * as ReactDom from 'react-dom';

import injectTapEventPlugin from 'react-tap-event-plugin';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
import {createStore, compose, applyMiddleware} from 'redux';
import {Provider} from 'react-redux';
import thunk from 'redux-thunk';

import Routes from 'scripts/components/Routes.jsx';
import reducer from 'scripts/reducers/index.js';

import '!!style!css!styles/index.scss';

injectTapEventPlugin();

const store = createStore(reducer, compose(
    applyMiddleware(thunk),
    window.devToolsExtension ? window.devToolsExtension() : f => f,
));

const Root = () => (
    <MuiThemeProvider muiTheme={getMuiTheme()}>
         <Provider store={store}>
            <Routes />
        </Provider>
    </MuiThemeProvider>
);

ReactDom.render(<Root />, document.getElementById('main'));
