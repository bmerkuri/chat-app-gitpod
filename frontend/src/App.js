import './App.css';
import axios from 'axios';
import {useState,useEffect } from 'react';

function App() {

  const [users,setUsers] = useState([]);
  useEffect(() => {
    axios
    .get(
       "/api/rest/get-user"
    )
    .then((res) => {
      setUsers(res.data.users);
    });
  },[]);
  return (
    <div className="App">
      
        {users.map((user) => (
          <li>  {user.id} ,{user.name} </li>
        ))}
      
    </div>
  );
}

export default App;