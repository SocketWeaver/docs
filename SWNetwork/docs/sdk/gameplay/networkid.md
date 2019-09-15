# NetworkID
___

Used to Identify a GameObject in a networked game.

| Name                 |                                                                                  Function                                                                                  |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ID                   | Automatically assign at run time.                                                                                                                                          |
| OwnerRemotePlayerId  | The owner's full playerId.                                                                                                                                                 |
| OwnerCustomPlayerId  | The owner's custom playerId.                                                                                                                                               |
| Type                 | <strong>Player</strong>: Player controlled GameObject. <br><strong>Non-Player</strong>: Non-player controlled GameObject.                                                                                          |
| SendRealtimeData     | Indicates whether the networked GameObject sends Realtime data to the game server. <br><strong>Only controls the behaviour of non-player networked GameObjects.</strong>                         |
| DynamicallySpawned   | Disable this for non-player networked GameObjects that are not spawned/destroyed by the SceneSpawner.                                                                      |
| FixedNetworkObjectID | The Fixed NetworkObjectID of the non-player Networked GameObject that are not spawned/destroyed by the SceneSpawner.<br>A valid <strong>FixedNetworkObjectIDs</strong> should be between <strong>1-4999</strong>. |
| Filterable           | Indicates whether the GameObject can be filtered by the realtime filter. <br><strong>Only controls the behaviour of player networked GameObjects</strong>.                                       |
| Visible Size         | Size of the bounding box of the GameObject.                                                                                                                                 |

## Creation
### Player controlled networked GameObjects 
* Created dynamically by the SceneSpawners.
### Non-player controlled networked GameObjects
* Created dynamically by the SceneSpawners.
* Created statically by assigning FixedNetworkObjectIDs.

## Ownership
You can find out if local player is the owner of a networked GameObject by checking the IsMine proprotry of its NetworkID component.

### Example
In this example, NetworkID.IsMine is called to find out if the local player has the authority to move the GameObject. Only the GameObjects that the local player owns should receive input updates. 
``` c#
using UnityEngine;
using SWNetwork;

public class PlayerMovement : MonoBehaviour
{
    public float moveSpeed = 6.0F;
    
    CharacterController characterController;
    NetworkID networkId;

    void Start()
    {
        networkId = GetComponent<NetworkID>();
        characterController = GetComponent<CharacterController>();
    }

    void Update()
    {
        if (networkId.IsMine)
        {
            float speedX = Input.GetAxis("Horizontal") * moveSpeed;
            float speedZ = Input.GetAxis("Vertical") * moveSpeed;
            
            Vector3 movement = new Vector3(speedX, verticalVelocity, speedZ);
            characterController.Move(movement * Time.deltaTime);
        }
    }
}
```

## Destroy

You can destroy a networked GameObject by calling the Destroy(float) method of its NetworkID component.

The networked GameObject will be removed across the network. The optional parameter specifies the amount of delay in seconds before destroying.

### Example
In this example, NetworkID.Destroy(float) is called to destory the networked GameObject with a delay of 2.5 seconds. 
``` c#
void Die()
{
    if(NetworkClient.Instance == null || NetworkClient.Instance.IsHost)
    {
        networkID.Destroy(2.5f);
    }
}
```

## FAQ

!!! question "What would be the best way to restore a player status (position, health, etc.) after he closes the game and comes back a moment later? The SceneSpawner would just spawn a new player GameObject, but I'd like to restore its status to when he disconnected."
    <strong>Answer</strong>: If players leave temporarily and reconnect back to the rooms, you probably want to use a longer playerTimeToLive to create rooms. So players don't get removed from rooms too quickly. 


## NetworkObjectID Range
Every networked GameObject must have a <strong>NetworkID</strong> component, and the SDK assigns a unique id to each <strong>NetworkID</strong> component. 

The id has a range from 1 to 65535. 

1-25000 is reserved for player-owned objects. each player can have up to 100 networked objects so id of 100-199 is owned by player 1 in the game, 200-299 is owned by player 2 in the game...

When players connect to the room game server, the game server will assign <strong>roomPlayerIDs</strong> to them, and <strong>roomPlayerID</strong> 1 will be assigned to the first player connects to the room. <strong>roomPlayerID</strong> 2 will be assigned to the second player connects to the room... 

If the first player went offline and reconnect back to the room game server before the room <strong>playerTimeToLive</strong> is over, the room game server still remembers the player's <strong>roomPlayerID</strong>(which is 1 in this case). so the player will gain ownership of the GameObjects with ID in the 100-199 range. If the first player went offline for too long and got kicked by the room keeper, the player's <strong>roomPlayerID</strong> will be recycled and appended to the end of the available <strong>roomPlayerID</strong> queue. So if the player joins the same room again, a new <strong>roomPlayerID</strong> will be assigned. Say the new <strong>roomPlayerID</strong> is 3, the player will create new sets of GameObjects and own GameObjects with id in the 300-399 range.
