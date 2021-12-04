import React from "react";


const Stores = (props) => {

  const { stores } = props;

  const renderStores = () =>  {
    return stores.map((store) => {
      return  <p>(store.name)</p>;
      
    })
  }
  return (
    <div>
      <h1>Stores</h1>
      {renderStores()}
    </div>
  )
}

export default Stores;