import messagesEN from 'locales/en.json';

const MOTHERS_DAY_ID = 'global_celebrations.mothers_day';
const PROGRAMMERS_DAY_ID = 'global_celebrations.programmers_day';

export default {
    [MOTHERS_DAY_ID]: {
        id: MOTHERS_DAY_ID,
        description: 'WhatTheDay.GlobalCelebrations.MothersDay',
        defaultMessage: messagesEN[MOTHERS_DAY_ID],
    },

    [PROGRAMMERS_DAY_ID]: {
        id: PROGRAMMERS_DAY_ID,
        description: 'WhatTheDay.GlobalCelebrations.ProgrammersDay',
        defaultMessage: messagesEN[PROGRAMMERS_DAY_ID],
    },
};
