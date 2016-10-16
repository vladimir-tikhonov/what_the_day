import * as React from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import App from 'scripts/components/App.jsx';
import GlobalEvents from 'scripts/pages/GlobalEvents.jsx';
import CustomEvents from 'scripts/pages/CustomEvents.jsx';
import Profile from 'scripts/pages/Profile.jsx';
import NotFound from 'scripts/pages/NotFound.jsx';

const Routes = () => {
    return (
        <Router history={browserHistory}>
            <Route path="/" component={App}>
                <IndexRoute component={GlobalEvents} />
                <Route path="/custom" component={CustomEvents} />
                <Route path="/profile" component={Profile} />
            </Route>
            <Route path="*" component={NotFound}/>
        </Router>
    );
};

export default Routes;
