import Immutable from 'immutable';
import { STORE_HYDRATE } from '../actions/store';

const initialState = Immutable.Map({ columns: [] });

export default function column_settings(state = initialState, action) {
  switch(action.type) {
    case STORE_HYDRATE:
      return state.merge(action.state.get('column_settings'));
  }
  return state;
};
