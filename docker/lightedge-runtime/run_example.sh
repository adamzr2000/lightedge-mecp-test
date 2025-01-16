# docker run --rm -it --name lightedge-runtime -v ./lightedge.github.io/:/lightedge-runtime-master/webui/ --network host lightedge-runtime

docker run --rm -it --name lightedge-runtime --network host lightedge-runtime

# python3.7 /lightedge-runtime-master/lightedge-runtime.py