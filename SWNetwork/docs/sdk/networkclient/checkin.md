# Check-in
___

SocketWeaver needs to validate a client's API_KEY before the client can use SocketWeaver services. You can use the CheckIn() method of the NetworkClient class to submit Clients API_KEY to SocketWeaver. The CheckIn() method also submits a client's PlayerId to SocketWeaver, and the PlayerId is used in the Lobby servers and the game servers to identify a player.

!!! note ""
    NetworkClient generates a random unique PlayerId on the first launch of a game and stores the PlayerId on the device hard drive. NetworkClient loads the PlayerId from the hard drive in the Awake() method.

## Using generated PlayerId

If you call CheckIn() method without a custom PlayerId, NetworkClient will use the generated random PlayerId to check into the SocketWeaver services.

## Custom PlayerId

You can use custom player Id to override the generated playerId by calling CheckIn(customPlayerId). This is useful if you use service like Google Firebase to manage user profiles. You can use it for development testing as well.

## Connect to Lobby Servers

After validating clients' API_KEY, SocketWeaver routes clients to the lobby cluster that are geographically closest to them. SWNetwork SDK will automatically connect to the assigned lobby clusters.

You can add a handler for the NetworkClient.Lobby.OnLobbyConncetedEvent and start the matchmaking process of your game from there.

| Methods         |                                                                                                        |
|-----------------|:-------------------------------------------------------------------------------------------------------|
| CheckIn()       | Checking into the SocketWeaver services with the generated unique player Id.                           |
| CheckIn(string) | Checking into the SocketWeaver services with the specified playerId. Make sure the playerId is unique. |

### Example

``` c#
string customPlayerId = "a1b2c3d4";

NetworkClient.Instance.CheckIn(customPlayerId, (bool successful, string error) =>
{
    if (!successful)
    {
        Debug.LogError(error);
    }
});
```