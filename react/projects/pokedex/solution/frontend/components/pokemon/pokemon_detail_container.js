import { connect } from 'react-redux';

import PokemonDetail from './pokemon_detail';
import { requestSinglePokemon } from '../../actions/pokemon_actions';
import { selectSinglePokemon, singlePokemonFetched } from '../../reducers/selectors';

const mapStateToProps = (state, { match }) => ({
  pokemon: selectSinglePokemon(state, match.params.pokemonId),
  items: state.items,
  fetched: singlePokemonFetched(state, match.params.pokemonId) 
});

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: id => dispatch(requestSinglePokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
