import React, { Component } from 'react';
import GiphyIndexItem from './giphy_index_item';

const GiphysIndex = ({ giphys }) => {
  return (
    <div>
      <ul>
        {giphys.map((giphy, idx) => <GiphyIndexItem key={idx} giphy={giphy} />)}
      </ul>
    </div>
  );
};

export default GiphysIndex;
