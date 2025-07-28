// script.js
// Example usage:
// Fetching user data from the API and logging it to the console
fetch('/api/users')
    .then(response => response.json())
    .then(data => console.log(data));