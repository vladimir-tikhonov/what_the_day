import React, {PureComponent} from 'react';
import {BottomNavigation, BottomNavigationItem} from 'material-ui/BottomNavigation';
import Divider from 'material-ui/Divider';
import CSSModules from 'react-css-modules';
import { withRouter } from 'react-router';

import IconLanguage from 'material-ui/svg-icons/action/language';
import IconBuild from 'material-ui/svg-icons/action/build';
import IconAccountCircle from 'material-ui/svg-icons/action/account-circle';

import style from 'styles/components/Navbar.scss';

const iconStyle = {
    height: '4em',
}

const worldIcon = <IconLanguage style={iconStyle}/>;
const buildIcon = <IconBuild style={iconStyle}/>;
const accountCircleIcon = <IconAccountCircle style={iconStyle}/>;

class Navbar extends PureComponent {
    render() {
        const {selectedIndex, router} = this.props;

        return (
            <div styleName="navbar-wrapper">
                <Divider inset/>
                <BottomNavigation styleName="navbar-mui-override" selectedIndex={selectedIndex}>
                    <BottomNavigationItem
                        styleName="item-mui-override"
                        label="Global celebrations"
                        icon={worldIcon}
                        onTouchTap={() => router.push('/')} />

                    <BottomNavigationItem
                        styleName="item-mui-override"
                        label="Personal celebrations"
                        icon={buildIcon}
                        onTouchTap={() => router.push('/personal')} />

                    <BottomNavigationItem
                        styleName="item-mui-override"
                        label="Profile"
                        icon={accountCircleIcon}
                        onTouchTap={() => router.push('/profile')} />
                </BottomNavigation>
            </div>
        )
    }
}

Navbar.propTypes = {
    selectedIndex: React.PropTypes.number.isRequired,
    router: React.PropTypes.object.isRequired,
}

export default withRouter(CSSModules(Navbar, style));

export const GLOBAL_CELEBRATIONS_ITEM_INDEX = 0;
export const PERSONAL_CELEBRATIONS_ITEM_INDEX = 1;
export const PROFILE_ITEM_INDEX = 2;
