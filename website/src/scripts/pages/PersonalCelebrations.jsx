import React, {PureComponent} from 'react';

import {PERSONAL_CELEBRATIONS_ITEM_INDEX} from 'scripts/components/Navbar.jsx';
import Page from 'scripts/components/Page.jsx';

class PersonalCelebrations extends PureComponent {
    render() {
        return (
            <Page selectedNavbarIndex={PERSONAL_CELEBRATIONS_ITEM_INDEX}>
                <h2>Personal celebrations page</h2>
            </Page>
        );
    }
}

export default PersonalCelebrations;
