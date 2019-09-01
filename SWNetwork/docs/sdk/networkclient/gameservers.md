# Game Servers
___

When players in a room are ready to play together, the room owner needs to call NetworkClient.Lobby.StartRoom().

SocketWeaver will start searching for a suitable game server for the room, and the NetworkClient.Lobby.OnRoomReadyEvent will be invoked when the room game server is ready. 

You need to use the NetworClient.ConnectToRoom(Action) method to connect to the room game server to use the SocketWeaver GamePlay API. 

When the game is finised, you need to use the NetworkClient.DisconnectFromRoom() method to disconnect from the game servers to stop receiving the game state updates.


| Methods         |                                                                                                        |
|-----------------|:-------------------------------------------------------------------------------------------------------|
| ConnectToRoom(Action<bool>)      | Connects the local player to the room game servers.                           |
| DisconnectFromRoom() | Disconnects the local player from the room game servers. |

### Example

``` c#
// Connect to the game servers of the room.
void ConnectToRoom()
{
    NetworkClient.Instance.ConnectToRoom(HandleConnectedToRoom);
}

// Callback method NetworkClient.Instance.ConnectToRoom();
// If connected is true,the client has connected to the game servers successfully.</param>
void HandleConnectedToRoom(bool connected)
{
    if (connected)
    {
        Debug.Log("Connected to room");
        // load the game scene
        SceneManager.LoadScene(1);
    }
    else
    {
        Debug.Log("Failed to connect to room");
    }
}
```