import React, {PureComponent} from 'react';

import Navbar, {PROFILE_ITEM_INDEX} from 'scripts/components/Navbar.jsx';
import Page from 'scripts/components/Page.jsx';

class Profile extends PureComponent {
    render() {
        return (
            <Page>
                <h2>Profile page</h2>
                <Navbar selectedIndex={PROFILE_ITEM_INDEX}/>
            </Page>
        );
    }
}

export default Profile;
