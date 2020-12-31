const express = require('express');
const app = express();
const PORT = 3000;


app.get('/', (req, res) => {
    res.json({ message: 'Welcome to the backend' })
})


app.listen(PORT, () => console.log(`Connected to ${PORT}`))