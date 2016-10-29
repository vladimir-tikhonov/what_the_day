import React, {PureComponent} from 'react';
import {connect} from 'react-redux';

import {getGlobalCelebrations} from 'scripts/reducers/index.js';
import {getIsLoading, getItems, getCountryId} from 'scripts/reducers/global_celebrations.js';
import {GLOBAL_CELEBRATIONS_ITEM_INDEX} from 'scripts/components/Navbar.jsx';
import {loadGlobalCelebrations} from 'scripts/actions/global_celebrations.js';

import Page from 'scripts/components/Page.jsx';

class GlobalCelebrations extends PureComponent {
    componentDidMount() {
        this.props.loadGlobalCelebrations(this.props.countryId);
    }

    renderCelebrations() {
        const {items} = this.props;

        return items.map(celebration => {
            return (
                <div key={celebration.id}>
                    <b>id: </b> {celebration.id}
                    {' '}
                    <b>days left: </b> {celebration.daysLeft}
                </div>
            );
        });
    }

    render() {
        const {isLoading} = this.props;
        return (
            <Page isLoading={isLoading} selectedNavbarIndex={GLOBAL_CELEBRATIONS_ITEM_INDEX}>
                <h2>Global celebrations page</h2>
                <div><b>Country id:</b> {this.props.countryId}</div>
                {this.renderCelebrations()}
            </Page>
        );
    }
}

GlobalCelebrations.propTypes = {
    isLoading: React.PropTypes.bool.isRequired,
    items: React.PropTypes.array.isRequired,
    countryId: React.PropTypes.string,
    loadGlobalCelebrations: React.PropTypes.func.isRequired,
};

const mapStateToProps = (state) => {
    const globalCelebrationsState = getGlobalCelebrations(state);

    return {
        isLoading: getIsLoading(globalCelebrationsState),
        items: getItems(globalCelebrationsState),
        countryId: getCountryId(globalCelebrationsState),
    };
};

const mapDispatchToProps = (dispatch) => ({
    loadGlobalCelebrations: (countryId) => dispatch(loadGlobalCelebrations(countryId)),
});

export default connect(mapStateToProps, mapDispatchToProps)(GlobalCelebrations);
