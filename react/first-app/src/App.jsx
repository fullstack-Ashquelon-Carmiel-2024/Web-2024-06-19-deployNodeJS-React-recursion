import logo from './logo.svg';
import './App.css';

function App() {
  // 0. Everything here in React is written in JSX: combination
  //    of HTML and JS
  // 1. function App() creates component <App />, and it is generaly
  //     like a class, so it's name starts with uppercase A
  // 2. return () of the component contains the code that should be rendered
  // 3. JS inside HTML should be in curly braces, like {logo}
  // 4. <header className="App-header"> - in JSX we use attribute className
  //        instead of attribute "class", to diminsh confusion between
  //        group id of HTML or CSS and class of OO JS

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
