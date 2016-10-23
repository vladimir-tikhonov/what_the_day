import React, {PureComponent} from 'react';
import CSSModules from 'react-css-modules';

import Navbar from 'scripts/components/Navbar.jsx';
import PageLoader from 'scripts/components/PageLoader.jsx';
import style from 'styles/components/Page.scss';

class Page extends PureComponent {
    renderContent() {
        if (this.props.isLoading) {
            return <PageLoader />;
        } else {
            return this.props.children;
        }
    }

    render() {
        return (
            <div styleName="page">
                {this.renderContent()}
                <Navbar selectedIndex={this.props.selectedNavbarIndex}/>
            </div>
        );
    }
}

Page.propTypes = {
    isLoading: React.PropTypes.bool,
    selectedNavbarIndex: React.PropTypes.number.isRequired,
};

Page.defaultProps = {
    isLoading: false,
};

export default CSSModules(Page, style);
