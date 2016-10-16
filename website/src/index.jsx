import * as React from 'react';
import * as ReactDom from 'react-dom';

import injectTapEventPlugin from 'react-tap-event-plugin';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import getMuiTheme from 'material-ui/styles/getMuiTheme';

import Routes from 'scripts/components/Routes.jsx';

injectTapEventPlugin();

const Root = () => (
    <MuiThemeProvider muiTheme={getMuiTheme()}>
        <Routes />
    </MuiThemeProvider>
);

ReactDom.render(<Root />, document.getElementById('main'));
