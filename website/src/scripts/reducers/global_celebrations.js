import {combineReducers} from 'redux';

import {
    GLOBAL_CELEBRATIONS_REQUEST_STARTED,
    GLOBAL_CELEBRATIONS_REQUEST_FINISHED,
    GLOBAL_CELEBRATIONS_REQUEST_FAILED} from 'scripts/actions/index.js';

function isLoading(state = false, action) {
    switch (action.type) {
    case GLOBAL_CELEBRATIONS_REQUEST_STARTED:
        return true;
    case GLOBAL_CELEBRATIONS_REQUEST_FINISHED:
    case GLOBAL_CELEBRATIONS_REQUEST_FAILED:
        return false;
    default:
        return state;
    }
}

function items(state = [], action) {
    switch (action.type) {
    case GLOBAL_CELEBRATIONS_REQUEST_STARTED:
        return [];
    case GLOBAL_CELEBRATIONS_REQUEST_FINISHED:
        return [...action.items];
    case GLOBAL_CELEBRATIONS_REQUEST_FAILED:
        return [];
    default:
        return state;
    }
}

function countryId(state = null, action) {
    switch (action.type) {
    case GLOBAL_CELEBRATIONS_REQUEST_FINISHED:
        return action.countryId;
    default:
        return state;
    }
}

export default combineReducers({
    isLoading,
    items,
    countryId,
});

export const getIsLoading = (state) => state.isLoading;
export const getItems = (state) => state.items;
export const getCountryId = (state) => state.countryId;
