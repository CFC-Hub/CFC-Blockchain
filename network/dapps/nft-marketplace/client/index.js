const express = require("express");
const bodyParser = require("body-parser");
const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
const route = express.Router();
const port = process.env.PORT || 5001;
app.use("/v1", route);
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
const artifact = require("./contracts/LearningNFT.json");
const artifactPop = require("./contracts/PopNFT.json");

route.get("/get-learningNFT", (req, res) => {
  res.status(200).send({ network: artifact.networks, abi: artifact.abi });
});

route.get("/get-popNFT", (req, res) => {
  res.status(200).send({ network: artifactPop.networks, abi: artifactPop.abi });
});
