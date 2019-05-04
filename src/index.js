var express = require('express');
const { postgraphile } = require('postgraphile');
const PgSimplifyInflectorPlugin = require('@graphile-contrib/pg-simplify-inflector');
const PgManyToManyPlugin = require('@graphile-contrib/pg-many-to-many');
const app = express();

app.use(
	postgraphile('postgres://postgres:password@localhost/crm', [ 'public',`configuracoes` ], {
		graphiql: true,
		enhanceGraphiql: true,
		dynamicJson: true,
		subscriptions: true,
		watchPg: true,
		appendPlugins: [ PgSimplifyInflectorPlugin, PgManyToManyPlugin ],
		bodySizeLimit: '5MB'
	})
);

app.listen(process.env.PORT || 3000, () => {
	console.log('Listening on port 3000');
});
