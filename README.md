# StreamPlay
First, extract all files from .zip
1. Place VbsMaker.bat Inside directory where mp3 files are located.
2. Change execPath and execPathSlashed to the dir where music is located (In ExternalCall.bat) eg. if music dir is C:/Files then execPath=C:/Files and execPahSlashed=C:\Files
3. Run ExternalCall.bat
4. Now Playing song is written inside <music dir>/nowPlaying.txt eg. C:/Files/nowPlaying.txt
