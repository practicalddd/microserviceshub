CREATE (Aviation:Industry {title:'Aviation', description:'The Aviation Industry caters to airlines'})
CREATE (GroundCrewOperations:Domain{title:'Ground Crew Operations', description:'Management of ground crew and gate activities'})
CREATE (PassengerExperience:Domain{title:'Passenger Experience', description:'Passenger Experience for booking of flights'})
CREATE (FlightOperations:Domain{title:'Flight Operations', description:'Management of Flight Operations'})
CREATE (Inventory:Domain{title:'Inventory', description:'Inventory Management for Aircraft'})
CREATE (Team1:Team{title:'Team 1',description:'Team belonging to the Passenger Experience Domain'})
CREATE (Team2:Team{title:'Team 2',description:'Team belonging to the Flight Operations Domain'})
CREATE (Team3:Team{title:'Team 3',description:'Team belonging to the Flight Operations Domain'})
CREATE (Team4:Team{title:'Team 4',description:'Team belonging to the Inventory Domain'})
CREATE (Team5:Team{title:'Team 5',description:'Team belonging to the Ground Crew Operations Domain'})
CREATE (Team6:Team{title:'Team 6',description:'Team belonging to the Ground Crew Operations Domain'})
CREATE (FlightBookingMS:Microservice{title:'Flight Booking',description:'Microservice that deals with all operations related to Flight Booking'})
CREATE (FlightPlanningMS:Microservice{title:'Flight Planning',description:'Microservice that deals with all operations related to Flight Planning'})
CREATE (FlightMonitoringMS:Microservice{title:'Flight Monitoring',description:'Microservice that deals with all operations related to Flight Monitoring'})
CREATE (InventoryAssignmentMS:Microservice{title:'Inventory Management',description:'Microservice that deals with all operations related to Inventory Management'})
CREATE (FlightPreparationMS:Microservice{title:'Flight Preparation',description:'Microservice that deals with all operations related to Flight Preparation'})
CREATE (GateManagementMS:Microservice{title:'Gate Management',description:'Microservice that deals with all operations related to Gate Management'})
CREATE (Java14:MSChassis{title:'Java',description:'Java',ver:'14.0'})
CREATE (Python390:MSChassis{title:'Python',description:'Python',ver:'3.9.0'})
CREATE (Python395:MSChassis{title:'Python',description:'Python',ver:'3.9.5'})
CREATE (Go1164:MSChassis{title:'Go',description:'Go',ver:'1.16.4'})
CREATE (NodeJS1620:MSChassis{title:'NodeJS',description:'NodeJS', ver:'16.2.0'})
CREATE (RelationalDataStrategy:DataCharacteristic{title:'Relational Data Strategy',description:'Data Strategy using a Relational Model',type:'Relational',tool: 'Postgres', pattern:['read-heavy / write-heavy'],scaling:['Horizontal'],distribution:['Replicated']})
CREATE (GraphDBDataStrategy:DataCharacteristic{title:'GraphDB Data Strategy',description:'Data Strategy using a Graph Model',type:'Graph',tool: 'neo4j', pattern:['read-heavy / write-heavy'],scaling:['Horizontal'],distribution:['Replicated']})

CREATE (AWSECSDeploymentStrategy:DeploymentCharacteristic{cloud:['AWS'],runtime:['ECS'],title:'Deployment Strategy',description:'Deployment Strategy using AWS ECS',dataRuntime:'RDS'})
CREATE (AWSEC2DeploymentStrategy:DeploymentCharacteristic{cloud:['AWS'],runtime:['EC2'],title:'Deployment Strategy',description:'Deployment Strategy using AWS EC2',dataRuntime:'RDS'})

CREATE (MonitoringStrategy:MonitoringCharacteristic{title:'Monitoring',description:'Monitoring characteristics for Microservices',logging:['ELK'],alerting:['Pagerduty'],metrics:['Prometheus'],dashboard:['Grafana']})
CREATE (Documentation:DocumentationCharacteristic{title:'Documentation',description:'Documentation of the Microservice',available:['Yes'],tool:['Confluence'],architecture_diagram:['Yes'],dataflow_diagram:['Yes'], on_call_runbook:['Yes']})


//All Relations
CREATE (Aviation)-[:BROKEN_DOWN_INTO]->(GroundCrewOperations)
CREATE (Aviation)-[:BROKEN_DOWN_INTO]->(PassengerExperience)
CREATE (Aviation)-[:BROKEN_DOWN_INTO]->(FlightOperations)
CREATE (Aviation)-[:BROKEN_DOWN_INTO]->(Inventory)
CREATE (PassengerExperience)-[:SPLIT_INTO]->(Team1)
CREATE (GroundCrewOperations)-[:SPLIT_INTO]->(Team5)
CREATE (GroundCrewOperations)-[:SPLIT_INTO]->(Team6)
CREATE (FlightOperations)-[:SPLIT_INTO]->(Team2)
CREATE (FlightOperations)-[:SPLIT_INTO]->(Team3)
CREATE (Inventory)-[:SPLIT_INTO]->(Team4)


CREATE (FlightBookingMS)-[:OWNED_BY]->(Team1)
CREATE (FlightBookingMS)-[:WRITTEN_USING]->(Java14)
CREATE (FlightBookingMS)-[:DEPLOYED_USING]->(AWSECSDeploymentStrategy)
CREATE (FlightBookingMS)-[:MONITORED_USING]->(MonitoringStrategy)
CREATE (FlightBookingMS)-[:DOCUMENTED_USING]->(Documentation)
CREATE (FlightBookingMS)-[:DATA_STRATEGY]->(RelationalDataStrategy)

CREATE (FlightPlanningMS)-[:OWNED_BY]->(Team2)
CREATE (FlightPlanningMS)-[:WRITTEN_USING]->(Python390)
CREATE (FlightPlanningMS)-[:DEPLOYED_USING]->(AWSEC2DeploymentStrategy)
CREATE (FlightPlanningMS)-[:MONITORED_USING]->(MonitoringStrategy)
CREATE (FlightPlanningMS)-[:DOCUMENTED_USING]->(Documentation)
CREATE (FlightPlanningMS)-[:DATA_STRATEGY]->(GraphDBDataStrategy)


CREATE (FlightMonitoringMS)-[:OWNED_BY]->(Team3)
CREATE (FlightMonitoringMS)-[:WRITTEN_USING]->(Python395)
CREATE (FlightMonitoringMS)-[:DEPLOYED_USING]->(AWSECSDeploymentStrategy)
CREATE (FlightMonitoringMS)-[:MONITORED_USING]->(MonitoringStrategy)
CREATE (FlightMonitoringMS)-[:DOCUMENTED_USING]->(Documentation)
CREATE (FlightMonitoringMS)-[:DATA_STRATEGY]->(RelationalDataStrategy)



CREATE (InventoryAssignmentMS)-[:OWNED_BY]->(Team4)
CREATE (InventoryAssignmentMS)-[:WRITTEN_USING]->(Go1164)
CREATE (InventoryAssignmentMS)-[:DEPLOYED_USING]->(AWSECSDeploymentStrategy)
CREATE (InventoryAssignmentMS)-[:MONITORED_USING]->(MonitoringStrategy)
CREATE (InventoryAssignmentMS)-[:DOCUMENTED_USING]->(Documentation)
CREATE (InventoryAssignmentMS)-[:DATA_STRATEGY]->(RelationalDataStrategy)



CREATE (FlightPreparationMS)-[:OWNED_BY]->(Team5)
CREATE (FlightPreparationMS)-[:WRITTEN_USING]->(NodeJS1620)
CREATE (FlightPreparationMS)-[:DEPLOYED_USING]->(AWSEC2DeploymentStrategy)
CREATE (FlightPreparationMS)-[:MONITORED_USING]->(MonitoringStrategy)
CREATE (FlightPreparationMS)-[:DOCUMENTED_USING]->(Documentation)
CREATE (FlightPreparationMS)-[:DATA_STRATEGY]->(GraphDBDataStrategy)

CREATE (GateManagementMS)-[:OWNED_BY]->(Team6)
CREATE (GateManagementMS)-[:WRITTEN_USING]->(Python395)
CREATE (GateManagementMS)-[:DEPLOYED_USING]->(AWSECSDeploymentStrategy)
CREATE (GateManagementMS)-[:MONITORED_USING]->(MonitoringStrategy)
CREATE (GateManagementMS)-[:DOCUMENTED_USING]->(Documentation)
CREATE (GateManagementMS)-[:DATA_STRATEGY]->(GraphDBDataStrategy)



