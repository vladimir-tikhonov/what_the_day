import React, {PureComponent} from 'react';

import Navbar, {PERSONAL_CELEBRATIONS_ITEM_INDEX} from 'scripts/components/Navbar.jsx';
import Page from 'scripts/components/Page.jsx';

class PersonalCelebrations extends PureComponent {
    render() {
        return (
            <Page>
                <h2>Personal celebrations page</h2>
                <Navbar selectedIndex={PERSONAL_CELEBRATIONS_ITEM_INDEX}/>
            </Page>
        );
    }
}

export default PersonalCelebrations;
