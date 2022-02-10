#!/bin/bash

sleep 20
zerotierip=$(cat /zerotier_dump.txt | grep assignedAddresses -A1 | grep 172 | sed -e "s/   \"//" -e "s/\/15\",//")
zerotierip6=$(cat /zerotier_dump.txt | grep assignedAddresses -A2 | grep fd00 | sed -e "s/   \"//" -e "s/\/64\"//")

cat /etc/bird/bird-template.conf |
sed -e "s/ZEROTIERIP/$zerotierip/g" |
sed -e "s/NEIGHBOURIP/$gw4/g" |
sed -e "s/ASNUM/$as/g" |
sed -e "s/NEIGHBOURAS/$neighbouras/g" |
sed -e "s/BGPPASSWORD/$bgppassword/g" > /etc/bird/bird.conf

cat /etc/bird/bird6-template.conf |
sed -e "s/ZEROTIERIP/$zerotierip/g" |
sed -e "s/ZEROTIERIP6/$zerotierip6/g" |
sed -e "s/NEIGHBOURIP6/$gw4/g" |
sed -e "s/ASNUM/$as/g" |
sed -e "s/NEIGHBOURAS/$neighbouras/g" |
sed -e "s/BGPPASSWORD/$bgppassword/g" > /etc/bird/bird6.conf

bird6 -c /etc/bird/bird6.conf
bird -f -c /etc/bird/bird.conf