# Mqtt-Docker
ระบบรับส่งข้อความสำหรับอุปกรณ์ IoT ที่ชื่อว่า MQTT Broker (เช่น Eclipse Mosquitto) เพื่อให้ติดตั้งและใช้งานได้ง่าย รบกวนเข้าไปติดตั้ง Docker และ git เพื่อใช้งาน

[install docker and docker compose](https://github.com/manaprae/install_docker)

## Getting started
```bash
git clone https://github.com/manaprae/mqtt-mosquitto
cd mqtt-mosquitto
```
เริ่มต้นทำงาน ด้วยคำสั่ง
```bash
docker compose up
# docker compose up
[+] up 2/2
 ✔ Network mqtt-mosquitto_default Created                                                                        0.0s
 ✔ Container mosquitto            Created                                                                        0.1s
Attaching to mosquitto
mosquitto  | 1787731100: Info: running mosquitto as user: mosquitto.
mosquitto  | 1787731100: Restored 0 base messages
mosquitto  | 1787731100: Restored 0 retained messages
mosquitto  | 1787731100: Restored 0 clients
mosquitto  | 1787731100: Restored 0 subscriptions
mosquitto  | 1787731100: Restored 0 client messages
mosquitto  | 1787731100: mosquitto version 2.1.2 starting
mosquitto  | 1787731100: Config loaded from /mosquitto/config/mosquitto.conf.
mosquitto  | 1787731100: Bridge support available.
mosquitto  | 1787731100: Persistence support available.
mosquitto  | 1787731100: TLS support available.
mosquitto  | 1787731100: TLS-PSK support available.
mosquitto  | 1787731100: Websockets support available.
mosquitto  | 1787731100: Opening ipv4 listen socket on port 1883.
mosquitto  | 1787731100: Opening ipv6 listen socket on port 1883.
mosquitto  | 1787731100: Opening ipv4 listen socket on port 8883.
mosquitto  | 1787731100: Opening ipv6 listen socket on port 8883.
mosquitto  | 1787731100: mosquitto version 2.1.2 running
```
ตอนนี้จะเห็น mqtt ใช้งานได้แล้วครับ  แต่ยังไม่มี Authentication

```bash
docker-compose up -d

docker exec -it mqtt mosquitto_passwd -c /mosquitto/config/pwfile mqttclient
Password: <Your password>
Reenter password: <Re Your password>
```
เราต้องเข้าไปแก้ไข config/mosquitto.conf
```bash
docker-compose stop

vim config/mosquitto.conf

# --- Authentication ---
# allow_anonymous true
allow_anonymous false
password_file /mosquitto/config/pwfile
```
```bash
docker-compose up -d	
```
ถ้าไม่มี Error ใดๆ ก็ผ่านครับ
### ทดสอบ MQTT
download mqtt-explorer 
[เช็ค Version ล่าสุด mqtt-explorer](https://github.com/thomasnordquist/MQTT-Explorer/releases)
ทำการติดตั้งแล้วเปิดโปรแกรมจะได้ ตามรูป แล้วใส่ username + passwd

![mqtt](https://github.com/manaprae/mqtt-mosquitto/blob/main/1787804027688.jpg)
แล้วใส่ username + passwdจะได้ตามรูป

![Login](https://github.com/manaprae/mqtt-mosquitto/blob/main/1787804052031.jpg)

