import React from 'react';
import { hashHistory } from 'react-router';

class BenchForm extends React.Component{
  constructor(props) {
    super(props);
    this.coords = {lat: props.lat, lng: props.lng};
    this.state = {
      description: "",
      picture_url: "",
      seating: 2
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.navigateToSearch = this.navigateToSearch.bind(this);
  }

  navigateToSearch() {
    hashHistory.push("/");
  }

  update(property) {
    return e => this.setState({
      [property]: e.target.value
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    const bench = Object.assign({}, this.state, this.coords);
    this.props.createBench({bench});
    this.navigateToSearch();
  }

  render() {
    const { description, picture_url, seating } = this.state;
    const { lat, lng } = this.coords;

    return (
        <div className="new-bench-container">
          <div className="new-bench-form">
            <h3 className="new-bench-title">Create A Bench!</h3>

            <form onSubmit={this.handleSubmit}>
              <label className="bench-field">Description</label>
              <input type="text" value={description}
                onChange={this.update("description")} className="bench-field"/>

              <label className="bench-field">Picture URL</label>
              <input type="text" value={picture_url}
                onChange={this.update("picture_url")} className="bench-field"/>

              <label className="bench-field">Number of Seats</label>
              <input min='0' type="number" value={seating}
                onChange={this.update("seating")} className="bench-field"/>

              <label className="bench-field">Latitude</label>
              <input type="text" disabled value={lat} className="bench-field"/>

              <label className="bench-field">Longitude</label>
              <input type="text" disabled value={lng} className="bench-field"/>

              <div className="button-holder">
                <input type="submit" value="Create Bench" className="new-bench-button"/>
              </div>
            </form>

            <div className="button-holder">
              <button
                className="new-bench-button"
                onClick={this.navigateToSearch}>
                Cancel
              </button>
            </div>
          </div>
        </div>
    );
  }
}

export default BenchForm;
