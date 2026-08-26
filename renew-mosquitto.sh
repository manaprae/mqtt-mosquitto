#!/bin/bash

# --- 1. สั่งต่ออายุใบรับรอง ---
# --standalone จะเปิดพอร์ต 80 ชั่วคราว (ต้องมั่นใจว่าไม่มี Web Server อื่นรันอยู่)
# --pre-hook: สั่งหยุด Mosquitto ก่อนถ้าจำเป็น (หรือจัดการพอร์ต 80)
# --post-hook: สั่งให้ Mosquitto โหลดใบรับรองใหม่หลังจากต่ออายุสำเร็จ
certbot renew --standalone --non-interactive --agree-tos \
    --deploy-hook "chmod -R 755 /etc/letsencrypt/archive/ && \
                   chmod -R 755 /etc/letsencrypt/live/ && \
                   docker kill -s HUP mosquitto"

# --- 2. บันทึกลง Log เพื่อตรวจสอบย้อนหลัง ---
echo "Certbot renew check finished at $(date)" >> ./log/mqtt_renew.log
