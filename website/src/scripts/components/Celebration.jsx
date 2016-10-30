import React, {PureComponent} from 'react';
import CSSModules from 'react-css-modules';
import {injectIntl, intlShape} from 'react-intl';
import Toggle from 'material-ui/Toggle';
import IconCalendar from 'material-ui/svg-icons/action/date-range';
import {blueGrey500} from 'material-ui/styles/colors';

import messages from 'scripts/locale/messages.js';

import style from 'styles/components/Celebration.scss';

const toggleStyles = {
    marginBottom: '0.2em',
};

const labelStyles = {
    fontSize: '1.2em',
    fontWeight: 500,
};

const iconStyles = {
    height: '1.5em',
};

class Celebration extends PureComponent {
    render() {
        const {celebration, intl} = this.props;

        return (
            <div key={celebration.id} styleName="wrapper">
                <Toggle
                    label={intl.formatMessage(messages[`global_celebrations.${celebration.id}`])}
                    labelPosition="right"
                    style={toggleStyles}
                    labelStyle={labelStyles} />
                <div styleName="calendar-wrapper">
                    <IconCalendar style={iconStyles} color={blueGrey500}/>
                    <span>December, 1st ({celebration.daysLeft} days left)</span>
                </div>
            </div>
        );
    }
}

Celebration.propTypes = {
    celebration: React.PropTypes.object.isRequired,
    intl: intlShape.isRequired,
};

export default injectIntl(CSSModules(Celebration, style));
