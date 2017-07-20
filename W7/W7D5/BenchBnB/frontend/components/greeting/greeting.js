import React from 'react';
import { Link } from 'react-router-dom';

const sessionLinks = () => (
  <nav>
    <Link to='/login' >Login </Link>
  <br/>
  <Link to='/signup' >Sign Up </Link>
  </nav>
)



const personalGreeting = ({currentUser, logout}) => (
  <div>
    <h3>Hi, {currentUser.username}! </h3>
    <button onClick={logout}>Log Out </button>
  </div>
)

const Greeting = ({currentUser, logout}) => (
  currentUser ? personalGreeting(currentUser, logout) : sessionLinks()
);

export default Greeting;
