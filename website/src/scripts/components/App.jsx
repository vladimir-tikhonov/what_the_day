import React from 'react';
import CSSModules from 'react-css-modules';

import style from 'styles/components/App.scss';

const App = (props) => (
    <div styleName="app-wrapper">
        <div styleName="app">
            {props.children}
        </div>
    </div>
);

export default CSSModules(App, style);
