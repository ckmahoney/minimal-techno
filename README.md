# minimal-techno

A techno album produces using SuperCollider, sox, and math.

There is no patterning or sequencing happening in any of the .scd files. Each one plays a collection of sine waves simultaneously.

`/scores` contains the SuperCollider files used to produce the album.

`/recordings` contains audio samples taken while recording each individual file in `/scores`. It also has the script `mix` for producing the album.

`/album` is the output directory for the album.

## Build

```
cd recording && sh mix
```
