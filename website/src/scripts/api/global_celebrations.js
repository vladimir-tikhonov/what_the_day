import camelize from 'camelize';

import {get} from 'scripts/api/client.js';

export const loadGlobalCelebrations = (countryId) => {
    return get('/global_celebrations', {countryId: countryId}).then(response => {
        const {celebrations, countryId} = camelize(response.data);

        return {
            celebrations: celebrations,
            countryId: countryId,
        };
    });
};
