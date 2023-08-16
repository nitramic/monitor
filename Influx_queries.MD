# Instalar Influxdb-client
root@test:~# apt install influxdb-client

## Queries
### Para contectarse
influx -host 192.168.xxx.xxx

O instalar client en Windows y generar config (En este caso estoy instalabo el cliente de v2.7 para manejar una base v1.8)

Luego de instalado, genero la config para conectarme a la base
.\influx config create --config-name Monitor --host-url http://192.168.11.60:8086 --active

### Ahora si, conectado desde una terminal Windows 
PS C:\Users\martin.cima\influxdb2-client-2.7.3> .\influx.exe v1 shell
InfluxQL Shell dev
Connected to InfluxDB OSS 1.8.10

###Notas
El cliente de Influx para linux, desde PowerShell permite el autocomplete y muestra la data de una forma mas "amigable"
EJ.:

SHOW DATABASES

Name: databases
┏━━━━━━━┳━━━━━━━━━━━━━┓
┃ index ┃    name     ┃
┣━━━━━━━╋━━━━━━━━━━━━━┫
┃      1┃_internal    ┃
┃      2┃telegraf     ┃
┃      3┃Clients      ┃
┃      4┃Infra        ┃
┃      5┃Clients_XLR  ┃
┣━━━━━━━┻━━━━━━━━━━━━━┫
┃   2 Columns, 5 Rows,┃
┃             Page 1/1┃
┃ Table 1/1, Statement┃
┃                  1/1┃
┗━━━━━━━━━━━━━━━━━━━━━┛



### Para hacer el test de conexion a la base (como tengo la config ya lista, solo tengo que invocar al comando)
PS C:\Users\martin.cima\influxdb2-client-2.7.3> .\influx.exe ping
OK

### Para Limpiar data (en este caso busco sacar la data de mi maquina, que use inicalmente para construir los dashboards)

> SHOW SERIES
key
---
cpu,cpu=cpu-total,dc=Cloud,host=LYCOMPANY-APP,os=Windows
cpu,cpu=cpu-total,dc=Cloud,host=MOLAJONI-APP,os=Windows
cpu,cpu=cpu-total,dc=Cloud,host=MOSCATELLI-ERP,os=Windows
cpu,cpu=cpu-total,dc=Cloud,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu-total,dc=Cloud,host=SICAPP,os=Windows
cpu,cpu=cpu-total,dc=Cloud,host=boozers-app,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=gronchiapp,os=Windows
cpu,cpu=cpu-total,dc=Cloud,host=headuvm,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=ideapa-app,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=infolamp,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=infomonitor,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=lelodue-app,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=marcolinilinux,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=mecelp-app,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=moscatellilinux,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=santostefano-ec,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=test,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=ubuntuvm,os=Linux
cpu,cpu=cpu-total,dc=Cloud,host=zenithapp,os=Linux
cpu,cpu=cpu-total,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu0,dc=Cloud,host=LYCOMPANY-APP,os=Windows
cpu,cpu=cpu0,dc=Cloud,host=MOLAJONI-APP,os=Windows
cpu,cpu=cpu0,dc=Cloud,host=MOSCATELLI-ERP,os=Windows
cpu,cpu=cpu0,dc=Cloud,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu0,dc=Cloud,host=SICAPP,os=Windows
cpu,cpu=cpu0,dc=Cloud,host=boozers-app,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=gronchiapp,os=Windows
cpu,cpu=cpu0,dc=Cloud,host=headuvm,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=ideapa-app,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=infolamp,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=infomonitor,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=lelodue-app,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=marcolinilinux,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=mecelp-app,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=moscatellilinux,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=santostefano-ec,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=test,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=ubuntuvm,os=Linux
cpu,cpu=cpu0,dc=Cloud,host=zenithapp,os=Linux
cpu,cpu=cpu0,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu1,dc=Cloud,host=LYCOMPANY-APP,os=Windows
cpu,cpu=cpu1,dc=Cloud,host=MOLAJONI-APP,os=Windows
cpu,cpu=cpu1,dc=Cloud,host=MOSCATELLI-ERP,os=Windows
cpu,cpu=cpu1,dc=Cloud,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu1,dc=Cloud,host=SICAPP,os=Windows
cpu,cpu=cpu1,dc=Cloud,host=boozers-app,os=Linux
cpu,cpu=cpu1,dc=Cloud,host=gronchiapp,os=Windows
cpu,cpu=cpu1,dc=Cloud,host=headuvm,os=Linux
cpu,cpu=cpu1,dc=Cloud,host=ideapa-app,os=Linux
cpu,cpu=cpu1,dc=Cloud,host=infomonitor,os=Linux
cpu,cpu=cpu1,dc=Cloud,host=lelodue-app,os=Linux
cpu,cpu=cpu1,dc=Cloud,host=marcolinilinux,os=Linux
cpu,cpu=cpu1,dc=Cloud,host=mecelp-app,os=Linux
cpu,cpu=cpu1,dc=Cloud,host=moscatellilinux,os=Linux
cpu,cpu=cpu1,dc=Cloud,host=santostefano-ec,os=Linux
cpu,cpu=cpu1,dc=Cloud,host=ubuntuvm,os=Linux
cpu,cpu=cpu1,dc=Cloud,host=zenithapp,os=Linux
cpu,cpu=cpu1,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu2,dc=Cloud,host=MOLAJONI-APP,os=Windows
cpu,cpu=cpu2,dc=Cloud,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu2,dc=Cloud,host=headuvm,os=Linux
cpu,cpu=cpu2,dc=Cloud,host=ideapa-app,os=Linux
cpu,cpu=cpu2,dc=Cloud,host=infomonitor,os=Linux
cpu,cpu=cpu2,dc=Cloud,host=lelodue-app,os=Linux
cpu,cpu=cpu2,dc=Cloud,host=marcolinilinux,os=Linux
cpu,cpu=cpu2,dc=Cloud,host=santostefano-ec,os=Linux
cpu,cpu=cpu2,dc=Cloud,host=zenithapp,os=Linux
cpu,cpu=cpu2,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu3,dc=Cloud,host=MOLAJONI-APP,os=Windows
cpu,cpu=cpu3,dc=Cloud,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu3,dc=Cloud,host=headuvm,os=Linux
cpu,cpu=cpu3,dc=Cloud,host=ideapa-app,os=Linux
cpu,cpu=cpu3,dc=Cloud,host=infomonitor,os=Linux
cpu,cpu=cpu3,dc=Cloud,host=lelodue-app,os=Linux
cpu,cpu=cpu3,dc=Cloud,host=marcolinilinux,os=Linux
cpu,cpu=cpu3,dc=Cloud,host=santostefano-ec,os=Linux
cpu,cpu=cpu3,dc=Cloud,host=zenithapp,os=Linux
cpu,cpu=cpu3,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu4,dc=Cloud,host=zenithapp,os=Linux
cpu,cpu=cpu5,dc=Cloud,host=zenithapp,os=Linux
cpu,cpu=cpu6,dc=Cloud,host=zenithapp,os=Linux
cpu,cpu=cpu7,dc=Cloud,host=zenithapp,os=Linux
disk,dc=Cloud,device=C:,fstype=NTFS,host=LYCOMPANY-APP,mode=rw,os=Windows,path=\C:
disk,dc=Cloud,device=C:,fstype=NTFS,host=MOLAJONI-APP,mode=rw,os=Windows,path=\C:
disk,dc=Cloud,device=C:,fstype=NTFS,host=MOSCATELLI-ERP,mode=rw,os=Windows,path=\C:
disk,dc=Cloud,device=C:,fstype=NTFS,host=NB-SVILUPPO99,mode=rw,os=Windows,path=\C:
disk,dc=Cloud,device=C:,fstype=NTFS,host=SICAPP,mode=rw,os=Windows,path=\C:
disk,dc=Cloud,device=C:,fstype=NTFS,host=gronchiapp,mode=rw,os=Windows,path=\C:
disk,dc=Cloud,device=D:,fstype=NTFS,host=LYCOMPANY-APP,mode=rw,os=Windows,path=\D:
disk,dc=Cloud,device=D:,fstype=NTFS,host=MOLAJONI-APP,mode=rw,os=Windows,path=\D:
disk,dc=Cloud,device=E:,fstype=NTFS,host=MOSCATELLI-ERP,mode=rw,os=Windows,path=\E:
disk,dc=Cloud,device=sda2,fstype=ext4,host=boozers-app,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=headuvm,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=ideapa-app,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=infolamp,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=infomonitor,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=lelodue-app,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=marcolinilinux,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=mecelp-app,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=moscatellilinux,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=santostefano-ec,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=test,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=ubuntuvm,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sda2,fstype=ext4,host=zenithapp,mode=rw,os=Linux,path=/
disk,dc=Cloud,device=sdb,fstype=ext4,host=infomonitor,mode=rw,os=Linux,path=/var
disk,dc=On-Prem,device=C:,fstype=NTFS,host=NB-SVILUPPO99,mode=rw,os=Windows,path=\C:
kernel,dc=Cloud,host=boozers-app,os=Linux
kernel,dc=Cloud,host=headuvm,os=Linux
kernel,dc=Cloud,host=ideapa-app,os=Linux
kernel,dc=Cloud,host=infolamp,os=Linux
kernel,dc=Cloud,host=infomonitor,os=Linux
kernel,dc=Cloud,host=lelodue-app,os=Linux
kernel,dc=Cloud,host=marcolinilinux,os=Linux
kernel,dc=Cloud,host=mecelp-app,os=Linux
kernel,dc=Cloud,host=moscatellilinux,os=Linux
kernel,dc=Cloud,host=santostefano-ec,os=Linux
kernel,dc=Cloud,host=test,os=Linux
kernel,dc=Cloud,host=ubuntuvm,os=Linux
kernel,dc=Cloud,host=zenithapp,os=Linux
mem,dc=Cloud,host=LYCOMPANY-APP,os=Windows
mem,dc=Cloud,host=MOLAJONI-APP,os=Windows
mem,dc=Cloud,host=MOSCATELLI-ERP,os=Windows
mem,dc=Cloud,host=NB-SVILUPPO99,os=Windows
mem,dc=Cloud,host=SICAPP,os=Windows
mem,dc=Cloud,host=boozers-app,os=Linux
mem,dc=Cloud,host=gronchiapp,os=Windows
mem,dc=Cloud,host=headuvm,os=Linux
mem,dc=Cloud,host=ideapa-app,os=Linux
mem,dc=Cloud,host=infolamp,os=Linux
mem,dc=Cloud,host=infomonitor,os=Linux
mem,dc=Cloud,host=lelodue-app,os=Linux
mem,dc=Cloud,host=marcolinilinux,os=Linux
mem,dc=Cloud,host=mecelp-app,os=Linux
mem,dc=Cloud,host=moscatellilinux,os=Linux
mem,dc=Cloud,host=santostefano-ec,os=Linux
mem,dc=Cloud,host=test,os=Linux
mem,dc=Cloud,host=ubuntuvm,os=Linux
mem,dc=Cloud,host=zenithapp,os=Linux
mem,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
net,dc=Cloud,host=LYCOMPANY-APP,interface=Ethernet0\ 2,os=Windows
net,dc=Cloud,host=MOLAJONI-APP,interface=Ethernet0\ 2,os=Windows
net,dc=Cloud,host=MOSCATELLI-ERP,interface=Ethernet0\ 2,os=Windows
net,dc=Cloud,host=NB-SVILUPPO99,interface=VirtualBox\ Host-Only\ Network\ #2,os=Windows
net,dc=Cloud,host=NB-SVILUPPO99,interface=Wi-Fi,os=Windows
net,dc=Cloud,host=SICAPP,interface=Ethernet0\ 2,os=Windows
net,dc=Cloud,host=boozers-app,interface=all,os=Linux
net,dc=Cloud,host=boozers-app,interface=ens192,os=Linux
net,dc=Cloud,host=gronchiapp,interface=Ethernet0\ 4,os=Windows
net,dc=Cloud,host=headuvm,interface=all,os=Linux
net,dc=Cloud,host=headuvm,interface=ens192,os=Linux
net,dc=Cloud,host=ideapa-app,interface=all,os=Linux
net,dc=Cloud,host=ideapa-app,interface=ens192,os=Linux
net,dc=Cloud,host=infolamp,interface=all,os=Linux
net,dc=Cloud,host=infolamp,interface=ens192,os=Linux
net,dc=Cloud,host=infomonitor,interface=all,os=Linux
net,dc=Cloud,host=infomonitor,interface=ens160,os=Linux
net,dc=Cloud,host=lelodue-app,interface=all,os=Linux
net,dc=Cloud,host=lelodue-app,interface=ens192,os=Linux
net,dc=Cloud,host=marcolinilinux,interface=all,os=Linux
net,dc=Cloud,host=marcolinilinux,interface=ens160,os=Linux
net,dc=Cloud,host=mecelp-app,interface=all,os=Linux
net,dc=Cloud,host=mecelp-app,interface=ens192,os=Linux
net,dc=Cloud,host=moscatellilinux,interface=all,os=Linux
net,dc=Cloud,host=moscatellilinux,interface=ens160,os=Linux
net,dc=Cloud,host=santostefano-ec,interface=all,os=Linux
net,dc=Cloud,host=santostefano-ec,interface=ens192,os=Linux
net,dc=Cloud,host=test,interface=all,os=Linux
net,dc=Cloud,host=test,interface=ens160,os=Linux
net,dc=Cloud,host=ubuntuvm,interface=all,os=Linux
net,dc=Cloud,host=ubuntuvm,interface=ens160,os=Linux
net,dc=Cloud,host=zenithapp,interface=all,os=Linux
net,dc=Cloud,host=zenithapp,interface=ens192,os=Linux
net,dc=On-Prem,host=NB-SVILUPPO99,interface=VirtualBox\ Host-Only\ Network\ #2,os=Windows
net,dc=On-Prem,host=NB-SVILUPPO99,interface=Wi-Fi,os=Windows
processes,dc=Cloud,host=boozers-app,os=Linux
processes,dc=Cloud,host=headuvm,os=Linux
processes,dc=Cloud,host=ideapa-app,os=Linux
processes,dc=Cloud,host=infolamp,os=Linux
processes,dc=Cloud,host=infomonitor,os=Linux
processes,dc=Cloud,host=lelodue-app,os=Linux
processes,dc=Cloud,host=marcolinilinux,os=Linux
processes,dc=Cloud,host=mecelp-app,os=Linux
processes,dc=Cloud,host=moscatellilinux,os=Linux
processes,dc=Cloud,host=santostefano-ec,os=Linux
processes,dc=Cloud,host=test,os=Linux
processes,dc=Cloud,host=ubuntuvm,os=Linux
processes,dc=Cloud,host=zenithapp,os=Linux
swap,dc=Cloud,host=LYCOMPANY-APP,os=Windows
swap,dc=Cloud,host=MOLAJONI-APP,os=Windows
swap,dc=Cloud,host=MOSCATELLI-ERP,os=Windows
swap,dc=Cloud,host=NB-SVILUPPO99,os=Windows
swap,dc=Cloud,host=SICAPP,os=Windows
swap,dc=Cloud,host=boozers-app,os=Linux
swap,dc=Cloud,host=gronchiapp,os=Windows
swap,dc=Cloud,host=headuvm,os=Linux
swap,dc=Cloud,host=ideapa-app,os=Linux
swap,dc=Cloud,host=infolamp,os=Linux
swap,dc=Cloud,host=infomonitor,os=Linux
swap,dc=Cloud,host=lelodue-app,os=Linux
swap,dc=Cloud,host=marcolinilinux,os=Linux
swap,dc=Cloud,host=mecelp-app,os=Linux
swap,dc=Cloud,host=moscatellilinux,os=Linux
swap,dc=Cloud,host=santostefano-ec,os=Linux
swap,dc=Cloud,host=test,os=Linux
swap,dc=Cloud,host=ubuntuvm,os=Linux
swap,dc=Cloud,host=zenithapp,os=Linux
swap,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
system,dc=Cloud,host=LYCOMPANY-APP,os=Windows
system,dc=Cloud,host=MOLAJONI-APP,os=Windows
system,dc=Cloud,host=MOSCATELLI-ERP,os=Windows
system,dc=Cloud,host=NB-SVILUPPO99,os=Windows
system,dc=Cloud,host=SICAPP,os=Windows
system,dc=Cloud,host=boozers-app,os=Linux
system,dc=Cloud,host=gronchiapp,os=Windows
system,dc=Cloud,host=headuvm,os=Linux
system,dc=Cloud,host=ideapa-app,os=Linux
system,dc=Cloud,host=infolamp,os=Linux
system,dc=Cloud,host=infomonitor,os=Linux
system,dc=Cloud,host=lelodue-app,os=Linux
system,dc=Cloud,host=marcolinilinux,os=Linux
system,dc=Cloud,host=mecelp-app,os=Linux
system,dc=Cloud,host=moscatellilinux,os=Linux
system,dc=Cloud,host=santostefano-ec,os=Linux
system,dc=Cloud,host=test,os=Linux
system,dc=Cloud,host=ubuntuvm,os=Linux
system,dc=Cloud,host=zenithapp,os=Linux
system,dc=On-Prem,host=NB-SVILUPPO99,os=Windows


###################
Limpiando la data
###################

 SHOW SERIES WHERE "host" ='NB-SVILUPPO99'
key
---
cpu,cpu=cpu-total,dc=Cloud,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu-total,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu0,dc=Cloud,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu0,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu1,dc=Cloud,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu1,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu2,dc=Cloud,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu2,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu3,dc=Cloud,host=NB-SVILUPPO99,os=Windows
cpu,cpu=cpu3,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
disk,dc=Cloud,device=C:,fstype=NTFS,host=NB-SVILUPPO99,mode=rw,os=Windows,path=\C:
disk,dc=On-Prem,device=C:,fstype=NTFS,host=NB-SVILUPPO99,mode=rw,os=Windows,path=\C:
mem,dc=Cloud,host=NB-SVILUPPO99,os=Windows
mem,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
net,dc=Cloud,host=NB-SVILUPPO99,interface=VirtualBox\ Host-Only\ Network\ #2,os=Windows
net,dc=Cloud,host=NB-SVILUPPO99,interface=Wi-Fi,os=Windows
net,dc=On-Prem,host=NB-SVILUPPO99,interface=VirtualBox\ Host-Only\ Network\ #2,os=Windows
net,dc=On-Prem,host=NB-SVILUPPO99,interface=Wi-Fi,os=Windows
swap,dc=Cloud,host=NB-SVILUPPO99,os=Windows
swap,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
system,dc=Cloud,host=NB-SVILUPPO99,os=Windows
system,dc=On-Prem,host=NB-SVILUPPO99,os=Windows
> DELETE  WHERE "host" ='NB-SVILUPPO99'
> SHOW SERIES WHERE "host" ='NB-SVILUPPO99'



### Para mover data de una base a otra 