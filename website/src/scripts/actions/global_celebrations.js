import {
    GLOBAL_CELEBRATIONS_REQUEST_STARTED,
    GLOBAL_CELEBRATIONS_REQUEST_FINISHED} from 'scripts/actions/index.js';
import {loadGlobalCelebrations as loadGlobalCelebrationsRequest} from 'scripts/api/global_celebrations.js';

const globalCelebrationsRequestStarted = () => ({
    type: GLOBAL_CELEBRATIONS_REQUEST_STARTED,
});

const globalCelebrationsRequestFinished = (items, countryId) => ({
    type: GLOBAL_CELEBRATIONS_REQUEST_FINISHED,
    items: items,
    countryId: countryId,
});

export const loadGlobalCelebrations = (countryId) => {
    return (dispatch) => {
        dispatch(globalCelebrationsRequestStarted());

        return loadGlobalCelebrationsRequest(countryId).then((data) => {
            dispatch(globalCelebrationsRequestFinished(data.celebrations, data.countryId));
        });
    };
};
