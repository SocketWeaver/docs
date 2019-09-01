# Configuration
___

NetworkClient can be configured using the NetworkClient custom inspector. 

!!! note ""
    It is recommended to add the NetworkClient component to a separate GameObject in your scene. NetworkClient will automatically prevent the GameObject from being destroyed between Scenes.

## Properties
|          Name | Function                                                                                  |   |
|--------------:|-------------------------------------------------------------------------------------------|---|
| Logging Level | Controls the logging of the SWNetwork SDK lower level code. **Error** is the default setting. |
| Log File Path | Controls log output directory.                                                            |   |
| API_KEY       | The APIKEY of your game. It is generated in the SocketWeaver Developer Portal.            |   |


## Routing info

SocketWeaver routes traffic based on the location of players.

The section below the API_KEY text field shows the routing information of a client.

The first line "f6921e3a..." is the playerId.

