import React from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import App from 'scripts/components/App.jsx';
import GlobalCelebrations from 'scripts/pages/GlobalCelebrations.jsx';
import PersonalCelebrations from 'scripts/pages/PersonalCelebrations.jsx';
import Profile from 'scripts/pages/Profile.jsx';
import NotFound from 'scripts/pages/NotFound.jsx';

const Routes = () => {
    return (
        <Router history={browserHistory}>
            <Route path="/" component={App}>
                <IndexRoute component={GlobalCelebrations} />
                <Route path="/personal" component={PersonalCelebrations} />
                <Route path="/profile" component={Profile} />
            </Route>
            <Route path="*" component={NotFound}/>
        </Router>
    );
};

export default Routes;
