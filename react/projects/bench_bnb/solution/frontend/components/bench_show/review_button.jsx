import React from 'react';
import { withRouter } from 'react-router';

const ReviewButton = ({benchId, router}) => (
  <button className="review-button"
          onClick={_handleClick(router, `/benches/${benchId}/review`)}
  >
    Leave a Review
  </button>
);

const _handleClick = (router, url) => (
  () => router.push(url)
);

export default withRouter(ReviewButton);
