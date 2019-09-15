# Gameplay Overview
___

## Individual Networked GameObject

SWNetwork provides three components for synchronizing and updating individual GameObject states.

!!! note ""
    The agent components can be used independently.

* RealTimeAgent.

* RemoteEventAgent.

* SyncPropertyAgent.

### RealtimeAgent
RealTimeAgent is useful for synchronizing GameObject states that are constantly changing. For example, position, rotation, and Animation.

### RemoteEventAgent
When a player casts a spell, all the remote duplicates of the player should cast the same spell. The RemoteEventAgent is designed to handle this use case.

### SyncPropertyAgent
SyncPropertyAgent is often used to synchronize GameObject states that are not modified frequently. For example, a player's costumes, weapon, and HP.


## Room Level States

SWNetwork also provides three components to manage room level states.

!!! warning ""
    You must create separate GameObjects for different room agent components.

* SceneSpawner
* RoomPropertyAgent
* RoomRemoteEventAgent

### SceneSpawner
Manages instantiation and destroy of Networked GameObjects. 

### RoomPropertyAgent
RoomPropertyAgent is similar to SyncPropertyAgent, the difference is that RoomPropertyAgent updates room level states.

### RoomRemoteEventAgent
RoomRemoteEventAgent is similar to RemoteEventAgent, the difference is that RoomRemoteEventAgent synchronizes room level actions.