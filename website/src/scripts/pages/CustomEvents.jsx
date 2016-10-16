import * as React from 'react';

import Navbar, {CUSTOM_EVENTS_ITEM_INDEX} from 'scripts/components/Navbar.jsx';
import Page from 'scripts/components/Page.jsx';

class CustomEvents extends React.Component {
    render() {
        return (
            <Page>
                <h2>Custom events page</h2>
                <Navbar selectedIndex={CUSTOM_EVENTS_ITEM_INDEX}/>
            </Page>
        );
    }
}

export default CustomEvents;
