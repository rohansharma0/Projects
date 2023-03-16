import React from "react";

const Product = ({ product }) => {
  return (
    <div className="top">
      <img src={product.imageUrl} className="products__images" alt="product" />
      <div className="product__name">
        <p>{product.title ? product.title : ""}</p>
      </div>
    </div>
  );
};

export default Product;
