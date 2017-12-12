# docker rpi-tonido, This project makes it possible to run Tonido on Docker on a Raspberry Pi

##Build
```
$./build.sh
```

##Run
```
$docker run -d -i -t -p 10001:10001 --volume $(pwd)/tonido-data/:/root azsoftalanzheng/rpi-tonido
```
