# ARPPort

For Auto Restart Process by Port

ARPPort is a simple tool which monitor a specific [port] and run a "command" if [port] is not available anymore
By running "command" you can watchdog a service running on [port] and start it again
The main reason why this program has been created is to ensure an API is running even if it has been stopped for some reason

## Install

You need basic things like netstat, grep, awk, cut

```
sudo apt install net-tools
git clone https://github.com/zetechmoy/arpport.git arpport
cd arpport
```

## Use

### Starting
```
bash arpport.sh [port] "command to start you service"
```

### Stopping
From the same pwd where arpport.sh has been started
```
bash stop-arpport.sh
```

### Example
```
//Start
cd /path/to/your/api
bash arpport.sh 3000 "npm start"
```

```
//Stop
cd /path/to/your/api
bash stop-arpport.sh
```

## Authors

* **Théo Guidoux** - [zetechmoy](https://github.com/zetechmoy) - [@TGuidoux](https://twitter.com/TGuidoux)
