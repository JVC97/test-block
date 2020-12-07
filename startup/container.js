const { createContainer, asClass, asValue, asFunction } = require("awilix");

//  config
const config = require("../config");
const app = require(".");

// services
const { UserService } = require("../services");

// controllers
const {
  UserController
} = require("../controllers");

// routes
const {
  UserRoutes
} = require("../routes/index.routes");
const Routes = require("../routes");


const container = createContainer();

container
  .register({
    app: asClass(app).singleton(),
    router: asFunction(Routes).singleton(),
    config: asValue(config)
  })
  .register({
    UserService: asClass(UserService).singleton()
  })
  .register({
    UserController: asClass(UserController.bind(UserController)).singleton()
  })
  .register({
    UserRoutes: asFunction(UserRoutes).singleton()
  });

module.exports = container;
