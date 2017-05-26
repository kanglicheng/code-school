import { connect } from 'react-redux';
import PokemonIndex from './pokemon_index';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import { selectAllPokemon, allPokemonFetched } from '../../reducers/selectors';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state),
  fetched: allPokemonFetched(state) 
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(requestAllPokemon())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);
