# ARPPort

For Auto Restart Process by Port

ARPPort is a simple tool which monitor a specific [port] and run a "command" if [port] is not available anymore
By running "command" you can watchdog a service running on [port] and start it again
The main reason why this program has been created is to ensure an API is running even if it has been stopped for some reason

## Install

You need basic things like netstat, grep, awk, cut

```
sudo apt install net-tools
git clone
```

### Installing

First install python3 and pip3

```
sudo apt install python3 python-pip3
```
Then use pip3 to install needed python3's modules

```
pip3 install pandas sklearn tensorflow keras pandas random numpy pickle matplotlib
```

## Authors

* **Théo Guidoux** - [zetechmoy](https://github.com/zetechmoy) - [@TGuidoux](https://twitter.com/TGuidoux)

## License

This project is licensed under the Apache2 License - see the [LICENSE.md](LICENSE.md) file for details
