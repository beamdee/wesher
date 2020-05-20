# dockerised wireguard mesh VPN setup for docker nodes

Setup a mesh wireguard VPN on docker nodes, quick and easy.



#1 First node (can be any node, just to create a node with a key).

docker-compose.yml
```
version: '3.5'
services:
   vpn:
     image: bram/wesher
     ports:
      - "7946:7946"
      - "7946:7946/udp"
      - "51820:51820/udp"
     restart: always
     tty: true
     network_mode: "host"
     environment:
      - WESHER_BIND_ADDR=<PUBLICIPOFTHISNODE>
      # leave empty to generate one, you can find it in the logs
      - WESHER_CLUSTER_KEY=<FILLINKEYFROMFIRSTNODEHERE>
```


#2 Other nodes (provide the key from the first node (or create your own for all))

docker-compose.yml
```
version: '3.5'
services:
   vpn:
     image: bram/wesher
     ports:
      - "7946:7946"
      - "7946:7946/udp"
      - "51820:51820/udp"
     restart: always
     tty: true
     network_mode: "host"
     environment:
      - WESHER_BIND_ADDR=<PUBLICIPOFTHISNODE>
      - WESHER_CLUSTER_KEY=<FILLINKEYFROMFIRSTNODEHERE>
      - WESHER_JOIN=<IPOFFIRSTNODE,IPSOFOTHERNODESIFANY>
     command: /usr/sbin/wesher -
```


