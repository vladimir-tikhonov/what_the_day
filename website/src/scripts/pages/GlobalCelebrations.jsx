import React, {PureComponent} from 'react';

import Navbar, {GLOBAL_CELEBRATIONS_ITEM_INDEX} from 'scripts/components/Navbar.jsx';
import Page from 'scripts/components/Page.jsx';

class GlobalCelebrations extends PureComponent {
    render() {
        return (
            <Page>
                <h2>Global celebrations page</h2>
                <Navbar selectedIndex={GLOBAL_CELEBRATIONS_ITEM_INDEX}/>
            </Page>
        );
    }
}

export default GlobalCelebrations;
