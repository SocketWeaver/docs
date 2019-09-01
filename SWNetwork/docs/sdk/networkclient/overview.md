# NetworkClient Overview
___

NetworkClient is the entry point of your game to interact with the SocketWeaver backend services. You must have one and only one NetworkClient active in your Scene.



The NetworkClient's main responsibilites include the following:

* Checking into the SocketWeaver services.

* Managing the connections to the lobby server and the room game servers.

## Lifecycle
NetworkClient automatically calls its own methods in different MonoBahaviour event functions.



