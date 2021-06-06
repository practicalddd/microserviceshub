const { ApolloServer } = require("apollo-server");
const neo4j = require("neo4j-driver");
const { makeAugmentedSchema } = require("neo4j-graphql-js");

const AURA_ENDPOINT = 'neo4j+s://3710420b.databases.neo4j.io'
const USERNAME = 'neo4j';
const PASSWORD = '<<Password>>';

const typeDefs = /* GraphQL */ `
   type Industry {
	id: ID!
	title: String!
	description: String!
        domains: [Domain] @relation(name: "BROKEN_DOWN_INTO", direction: OUT)
   }

   type Domain {
	title: String!
	description: String!
	teams: [Team] @relation(name: "SPLIT_INTO", direction: OUT)
   }	
   type Team {
	title: String!
	description: String!
        microservices: [Microservice] @relation(name: "OWNED_BY", direction: IN) 
	}

   type Microservice {
	title: String!
	description: String!
	mschassis: [MSChassis] @relation(name: "WRITTEN_USING", direction: OUT)
	deployment: [DeploymentStrategy] @relation(name: "DEPLOYED_USING", direction: OUT)
	monitoring: [MonitoringStrategy] @relation(name: "MONITORED_USING", direction: OUT)
	datastrategy: [DataStrategy] @relation(name: "DATA", direction: OUT)
	documentation: [DocumentationStrategy] @relation(name: "DOCUMENTED_USING", direction: OUT) 
	}

   type MSChassis {
	title: String!
	description: String!
	ver: String!
	}

   type DeploymentStrategy{
	title: String!
	description: String!
	runtime: String!
	cloud: String!
	}

   type DataStrategy{
	title: String!
	description: String!
	type: String!
	tool: String!
	pattern: String!
	scaling: String!
	distribution: String!	
	}

     type MonitoringStrategy{
	title: String!
	description: String!
	logging: String!
	alerting: String!
	metrics: String!
	dashboard: String!
	}

      type DocumentationStrategy{
	title: String!
	description: String!
	available: String!
	tool: String!
	architecture_diagram: String!
	dataflow_diagram: String!
	}
`;

const driver = neo4j.driver(
	AURA_ENDPOINT, 
	neo4j.auth.basic(USERNAME, PASSWORD)
     );

const schema = makeAugmentedSchema({
  typeDefs
});

const server = new ApolloServer({
  schema,
  context: {driver}
});

server.listen().then(({ url }) => {
  console.log(`GraphQL server ready at ${url}`);
});
