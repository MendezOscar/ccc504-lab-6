const hapi = require('hapi');

const server = new hapi.Server();
const mongoose = require('mongoose');
const companyRoutes = require('./routes/company.routes');


const mongoDbUri = 'mongodb://lala:mLab2018@ds143143.mlab.com:43143/hapi_db';
mongoose.connect(mongoDbUri, {
    useMongoClient: true
});
mongoose.connection.on('connected', () => {
    console.log(`app is connected to ${mongoDbUri}`);
});
mongoose.connection.on('error', err => {
    console.log('error while connecting to mongodb', err);
});

/*
const user = {
    1: {
        id: 'hapi_db.lala',
        name: 'lala'
    }
};

const validate = async function (decoded, request) {

    if (!user[decoded.id]) {
        return { isValid: false };
    }
    else {
        return { isValid: true };
    }
};

const init = async () => {

    
    await server.register(require('hapi-auth-jwt2'));

    server.auth.strategy('jwt', 'jwt',
        {
            key: 'NeverShareYourSecret',
            validate: validate,
            verifyOptions: { algorithms: ['HS256'] }
        });

    server.auth.default('jwt');

    server.connection({ host: '127.0.0.1', port: '3000' });

    server.route([
        {
          method: "GET", path: "/", config: { auth: false },
          handler: function(request, reply) {
            reply({text: 'Token not required'});
          }
        },
        {
          method: 'GET', path: '/restricted', config: { auth: 'jwt' },
          handler: function(request, reply) {
            reply({text: 'You used a Token!'})
            .header("Authorization", request.headers.authorization);
          }
        },
      ]);

      await server.start();
      return server;

    server.route(companyRoutes);
};

init().then(server => {
    console.log('Server running at:', server.info.uri);
  })
  .catch(error => {
    console.log(error);
  });*/
// ======================= No Funciona =======================

server.connection({ host: '127.0.0.1', port: '3000' });
server.route({
    path: '/',
    method: 'GET',
    handler(req, reply) {
        reply('Welcome to HapiJs course!!');
    }
});

server.route(companyRoutes);

server.start(err => {
    if (err) {
        throw err;
    }
    console.log(`Server Running at PORT ${server.info.port}`);
});