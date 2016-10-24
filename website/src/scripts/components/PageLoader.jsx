import React from 'react';
import CSSModules from 'react-css-modules';
import CircularProgress from 'material-ui/CircularProgress';

import style from 'styles/components/PageLoader.scss';

const PageLoader = () => (
    <div styleName="page-loader">
        <CircularProgress />
    </div>
);

export default CSSModules(PageLoader, style);
