import {combineReducers} from 'redux';

import globalCelebrations from 'scripts/reducers/global_celebrations.js';

export default combineReducers({
    globalCelebrations,
});

export const getGlobalCelebrations = (state) => state.globalCelebrations;
