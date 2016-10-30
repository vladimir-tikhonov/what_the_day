import React, {PureComponent} from 'react';
import {connect} from 'react-redux';
import CSSModules from 'react-css-modules';
import Divider from 'material-ui/Divider';
import Paper from 'material-ui/Paper';

import {getGlobalCelebrations} from 'scripts/reducers/index.js';
import {getIsLoading, getItems, getCountryId} from 'scripts/reducers/global_celebrations.js';
import {GLOBAL_CELEBRATIONS_ITEM_INDEX} from 'scripts/components/Navbar.jsx';
import {loadGlobalCelebrations} from 'scripts/actions/global_celebrations.js';

import Page from 'scripts/components/Page.jsx';
import Celebration from 'scripts/components/Celebration.jsx';
import style from 'styles/pages/GlobalCelebrations.scss';

class GlobalCelebrations extends PureComponent {
    componentDidMount() {
        this.props.loadGlobalCelebrations(this.props.countryId);
    }

    renderCelebration(celebration) {
        return (
            <Paper zDepth={0} rounded={false} key={celebration.id}>
                <Celebration
                    celebration={celebration} />
                <Divider inset/>
            </Paper>

        );
    }

    render() {
        const {isLoading, celebrations} = this.props;
        return (
            <Page isLoading={isLoading} selectedNavbarIndex={GLOBAL_CELEBRATIONS_ITEM_INDEX}>
                <div><b>Country id:</b> {this.props.countryId}</div>
                <h2 styleName="group-header">Top celebrations</h2>
                {celebrations.map(this.renderCelebration)}
                <h2 styleName="group-header">Other celebrations</h2>
            </Page>
        );
    }
}

GlobalCelebrations.propTypes = {
    isLoading: React.PropTypes.bool.isRequired,
    celebrations: React.PropTypes.array.isRequired,
    countryId: React.PropTypes.string,
    loadGlobalCelebrations: React.PropTypes.func.isRequired,
};

const mapStateToProps = (state) => {
    const globalCelebrationsState = getGlobalCelebrations(state);

    return {
        isLoading: getIsLoading(globalCelebrationsState),
        celebrations: getItems(globalCelebrationsState),
        countryId: getCountryId(globalCelebrationsState),
    };
};

const mapDispatchToProps = (dispatch) => ({
    loadGlobalCelebrations: (countryId) => dispatch(loadGlobalCelebrations(countryId)),
});

export default connect(mapStateToProps, mapDispatchToProps)(CSSModules(GlobalCelebrations, style));
