**StreamsizeChecker**

This script scans the game's stream/ directory and displays the size of the loaded stream files. If a stream file is larger than 10 MB, a warning is displayed because it may cause lag. You can change the MB checker, yourself

**Requirements**

This script requires that it is executed in a game environment with access to the Citizen Lua API. It also requires that the stream/ directory exists and contains stream files.

**Usage**

1. Add this script to your game environment.
2. Start the game and execute the script.
3. The script output will display the size of the loaded stream files in the stream/ directory, along with any warnings for stream files larger than 10 MB.

**Functions**

PrintLoadedStreamfileSizes() - scans the game's stream/ directory and displays the size of the loaded stream files.

fileLength(path) - returns the size of a file in bytes.

**Notes**
This script can be useful to check if the size of stream files in the game's stream/ directory is not causing unnecessary lag during gameplay. However, checking stream file sizes is not guaranteed to solve all possible lag issues.

**Credits**

Created by Foxtery#5526
