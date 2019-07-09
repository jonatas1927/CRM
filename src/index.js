var express = require("express");
const { postgraphile } = require("postgraphile");
const PgSimplifyInflectorPlugin = require("@graphile-contrib/pg-simplify-inflector");
const PgManyToManyPlugin = require("@graphile-contrib/pg-many-to-many");
const app = express();
var cors = require("cors");

// app.use(cors());
// Logado no heroku
app.use(
  postgraphile(
    "postgres://pifmperdwrsnya:cdb4e516190e41cd460344bf13d5c6df0a01b6d66814297af70f4c3f0c9bbf53@ec2-174-129-227-51.compute-1.amazonaws.com:5432/d3t178i4iodq21?ssl=1",
    ["public", `configuracoes`],
    {
      graphiql: true,
      // exportGqlSchemaPath: "./Gql.gql",
      // enhanceGraphiql: true,
      dynamicJson: true,
      enableCors: true,
      // graphiqlRoute:,
      graphqlRoute: "/graphql",
      // externalUrlBase:'graphiql',
      subscriptions: true,
      // disableDefaultMutations: true,
      watchPg: true,
      appendPlugins: [PgSimplifyInflectorPlugin, PgManyToManyPlugin],
      bodySizeLimit: "5MB",
      retryOnInitFail:false
      // externalUrlBase: "http://localhost:8080"
    }
  )
);

app.listen(process.env.PORT || 3000, () => {
  console.log("Listening on port 3000");
});
