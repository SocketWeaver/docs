# Network Status Events
___

The NetworkClient invokes the following event to help you detect connectivity issues.


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