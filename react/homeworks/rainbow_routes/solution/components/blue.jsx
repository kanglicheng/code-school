import React from 'react';
import { withRouter } from 'react-router';

class Blue extends React.Component {
  constructor() {
    super();
    this.resetBlue = this.resetBlue.bind(this);
    this.addIndigo = this.addIndigo.bind(this);
  }
  
  resetBlue() {
    this.props.router.push('/blue');
  }

  addIndigo() {
    this.props.router.push('/blue/indigo');
  }

  render() {
    return(
      <div>
        <h2 className="blue"></h2>
        <h4 onClick={this.resetBlue}>Blue only</h4>
        <h4 onClick={this.addIndigo}>Add indigo</h4>

        {this.props.children}
      </div>
    );
  }
};

export default withRouter(Blue);
