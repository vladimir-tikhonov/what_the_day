import React, {PureComponent} from 'react';

import {PROFILE_ITEM_INDEX} from 'scripts/components/Navbar.jsx';
import Page from 'scripts/components/Page.jsx';

class Profile extends PureComponent {
    render() {
        return (
            <Page selectedNavbarIndex={PROFILE_ITEM_INDEX}>
                <h2>Profile page</h2>
            </Page>
        );
    }
}

export default Profile;
