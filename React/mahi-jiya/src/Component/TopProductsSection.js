import React, { useState, useEffect } from "react";

//firebase
import firebase from "firebase";

// react-router-dom
import { Link } from "react-router-dom";

import Product from "./Product";

const TopProductsSection = () => {
  const [topProducts, setTopProducts] = useState([]);
  const [bottomProducts, setBottomProducts] = useState([]);

  const fetchProducts = () => {
    const ref = firebase.firestore();
    ref.collection("topProducts").onSnapshot((snap) => {
      const products = [];
      snap.forEach((doc) => {
        if (doc.exists) {
          products.push({ ...doc.data(), id: doc.id });
        }
      });
      setTopProducts(products);
    });
    ref.collection("bottomProducts").onSnapshot((snap) => {
      const products = [];
      snap.forEach((doc) => {
        if (doc.exists) {
          products.push({ ...doc.data(), id: doc.id });
        }
      });
      setBottomProducts(products);
    });
  };
  useEffect(() => {
    fetchProducts();
  }, []);
  return (
    <div className="top__products__section">
      <p className="top__products__title">top products</p>
      <div className="gallary">
        <div className="top__gallary">
          {topProducts.map((product) => {
            return <Product key={product.id} product={product} />;
          })}
        </div>
        <div className="bottom__gallary">
          {bottomProducts.map((product) => {
            return <Product key={product.id} product={product} />;
          })}
        </div>
      </div>
      <Link to="/products" className="show__button">
        show all
      </Link>
    </div>
  );
};

export default TopProductsSection;
