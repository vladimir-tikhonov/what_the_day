import React from 'react';
import CSSModules from 'react-css-modules';
import {IntlProvider, addLocaleData} from 'react-intl';

import en from 'react-intl/locale-data/en';
import ru from 'react-intl/locale-data/ru';
import messagesRU from 'locales/ru.json';

import style from 'styles/components/App.scss';

addLocaleData([...en, ...ru]);

const App = (props) => (
    <div styleName="app-wrapper">
        <IntlProvider locale="ru" messages={messagesRU}>
            <div styleName="app">
                {props.children}
            </div>
        </IntlProvider>
    </div>
);

export default CSSModules(App, style);
