import React from 'react';
import CSSModules from 'react-css-modules';

import style from 'styles/components/Page.scss';

const Page = (props) => (
    <div styleName="page">
        {props.children}
    </div>
);

export default CSSModules(Page, style);
