import * as React from 'react';

import Navbar, {GLOBAL_EVENTS_ITEM_INDEX} from 'scripts/components/Navbar.jsx';
import Page from 'scripts/components/Page.jsx';

class GlobalEvents extends React.Component {
    render() {
        return (
            <Page>
                <h2>Global events page</h2>
                <Navbar selectedIndex={GLOBAL_EVENTS_ITEM_INDEX}/>
            </Page>
        );
    }
}

export default GlobalEvents;
