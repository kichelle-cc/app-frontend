import React, { useState, useEffect } from 'react';
import logo from './logo.svg';
import './App.css';


function App() {
  const [currentTime, setCurrentTime] = useState('420');

  useEffect(() => {
    fetch('/index').then(res => res.json()).then(data => {
      setCurrentTime(data.current_time);
    });
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        
        <p>
          The time is {currentTime}
        </p>
          
      </header>
    </div>
  );
}

export default App;
