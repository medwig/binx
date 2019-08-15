# binx
Make a script executeable system wide. Makes it easy to write small utility cli scripts and add them to /usr/local/bin

## Install
Binx can install itself!
```
$ git clone https://github.com/medwig/binx.git
$ cd binx
$ ./binx.sh binx.sh 

Copied to /usr/local/bin as binx
```

## Usage
After istalling just call binx and pass the path to the target script
```
$ binx path/to/myscript.py
```

## Notes
Only supports python and bash scripts on linux right now.
