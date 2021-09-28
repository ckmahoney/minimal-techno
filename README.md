# minimal-techno

A mini minimal techno album made with SuperCollider, sox, and math.

There is no patterning or sequencing happening in any of the SuperCollider files. 
Each one simultaneously plays a collection of sine waves.

`/scores` contains the SuperCollider files used to produce the album.

`/recordings` contains audio samples taken while recording each individual file in `/scores`. It also has the script `mix` for producing the album.

`/album` is the output directory for the album.

## Build

```
cd recording && sh mix
```

## Play

Use your favorite media player, or
```
cd album;
for file in `ls`; do play $file; done;
```
