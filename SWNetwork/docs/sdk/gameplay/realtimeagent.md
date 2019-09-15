# RealtimeAgent
___

Realtime Agent Sends state changes of local player controlled GameObjects to SocketWeaver Game Servers.The changes are then distributed to the remote duplicates across different Network.

!!! note ""
    Realtime Agent sends GameObject States across the network at a fixed rate. The frequency can be set on the SocketWeaver Developer portal. portal.socketweaver.com

Realtime Agent sends GameObject states unreliably. Each state change is useful, however, as the state changes frequently, it is likely to be replaced by a newer value quickly. If you want reliable state synchronization, Sync Property Agent is designed for that use.

## Compression
Realtime Agent automatically compresses the values to minimize bandwidth usage. You should adjust the Min, Max, and Resolution settings to optimize the compression for your game further.

## Restore
By default, RealTime Agent restores GameObjects states when clients reconnect to the game.

## Transform
Synchronizes GameObject Transform.

| Name            |                                                                                                                     Function                                                                                                                     |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Enable          | Controls whether Transform sync is enabled.                                                                                                                                                                                                      |
| Interpolate     | Controls the interpolation of rotation and scale updates. The larger the number the faster the GameObject interpolates to the target rotation and scale.                                                                                         |
| Smooth Level    | Controls the smoothness of position updates. The larger the number the smoother the GameObject moves to the target position. However, a larger smooth level will affect the GameObjects responsiveness.                                          |
| Snap Distance   | Controls the maximum displacement allowed to apply smooth algorithm. If the displacement between two position updates is greater than the Snap distance, the smooth algorithm will be skipped, and the GameObject will snap to the new position. |
| External Freeze | Controls how long in seconds the position tracking will be disabled on the remote copies when external position changes are detected.                                                                                                            |
| Read Function   | Controls in which function the remote duplicates will read the position updates.                                                                                                                                                                 |

## Animation
Synchronizes GameObject Animation parameters

| Name            |                                                   Function                                                  |
|-----------------|-----------------------------------------------------------------------------------------------------------|
| Enable          | Controls whether Animation sync is enabled                                                                  |
| Target Animator | The Animator being synchronized. You need to drag the Animator Component of the GameObject into this field. |

## Generic
Synchronizes public fields of any components

| Name         |                     Function                    |
|--------------|-----------------------------------------------|
| Enable       | Controls whether the Generic tracker is enabled |
| Display Name | Only used in Unity Editor                       |
| Target       | The component to be synchronized                |