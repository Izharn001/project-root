require("dotenv").config();

const express = require("express");
const app = express();

const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send(`Running in ${process.env.NODE_ENV}`);
});

app.get("/health", (req, res) => {
  res.send("OK");
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`App running on port ${PORT}`);
});

app.get("/version", (req, res) => {
  res.send(process.env.APP_VERSION || "1.0");
});