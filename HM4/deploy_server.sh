#!/bin/sh
apt-get update -y && apt-get install git python3 python3-pip -y
git clone https://github.com/cache-invalidation/lod_final_server
python3 -m pip install flask flask_cors tarantool json-rpc rauth
touch lod_final_server/src/credentials.py
printf "CLIENT_ID=0\nCLIENT_SECRET=0\nTARANTOOL_IP='127.0.0.1'\nTARANTOOL_PORT=3301\n" > lod_final_server/src/credentials.py
export FLASK_APP=lod_final_server/src/main.py
flask run --host=0.0.0.0 --port 5000 2> /dev/null
