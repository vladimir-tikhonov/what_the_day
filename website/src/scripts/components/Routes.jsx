import * as React from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import GlobalCelebrations from 'scripts/pages/GlobalCelebrations.jsx';
import NotFound from 'scripts/pages/NotFound.jsx';

const Routes = () => {
    return (
        <Router history={browserHistory}>
            <Route path="/">
                <IndexRoute component={GlobalCelebrations} />
            </Route>
            <Route path="*" component={NotFound}/>
        </Router>
    );
};

export default Routes;
