import React from 'react';
import Card from './Card';

function ShowCard(props) {
  const { numberOfCards } = props;
  return (
    <div>
      {Array.from({ length: numberOfCards }, (_, index) => (
        <Card key={index} inputValue={index + 1} cardNumber={index + 1} />
      ))}
    </div>
  );
}

export default ShowCard;