# Multi Telegraf instances

## Premisa
#### Quiero hacer un server para tests, desde ahi enviar telemetria de diferentes ambientes a diferentes bases de influx, si bien es el mismo server, primero levanto la base de pruebas para luego pasar a la base de produccion.

EJ: 
#### Linux Ubuntu
Quiero que la maquina test envie su telemetria local
#### VMWare en Cluster
Tambien quiero empezar a emviar telemetria de un VMWARE, asi veo que datos me convienen, que datos no se deben duplicar ya que me los envia el server local, medir cuanto es el delta por dia, que datos me convienen tener y por cuanto tiempo (segun la necesitdad)
#### Apache Tomcat 8
Quiero empezar a tomar las metricas que genera el tomcat, junto con sus logs para hacer un panel del tipo display y a su vez poder hacer consultas de tiempo de respuesta desde un host remoto
#### Postgres 14
Aca quiero hacer consultas de queries para ver las metricas y los datos que me puede enviar la base de postgres, inicialmente este script esta basado en python 2.7 y hay que hacer el upgrade despues.

### Que hacer?
Primero voy a ver como se configuran multiple instancias en el server test
Luego con cada instancia voy enviando los datos de los diferentes entornos a mis bases de Influx

### Configs
Inicialmente voy a usar la config loc


### Basado en esto
https://community.influxdata.com/t/multiple-telegraf-configs/245/5

You would need to run multiple telegraf processes:

$ telegraf -config config1 > telegraf1.log 2>&1 &
$ telegraf -config config2 > telegraf2.log 2>&1 &
If you need systemd or init.d to keep the process alive and start on boot then you would need to copy the service file and change some naming so that you could run:

$ sudo systemctl start telegraf1
$ sudo systemctl start telegraf2
# OR
$ sudo service telegraf1 start
$ sudo service telegraf2 start

### Bueno, que es lo que hice
Al momento generé 2 archivos con configs de telegraf
1-Linux local, envia data al influx de CPU, Memoria, Disco y Red.
2-VMWare, hace una conexion con el vcenter, sin verificar el TLS y envia todas la metricas

#### Para iniciar
Genero los 2 files y los pongo en el dir /etc/telegraf, desde ahi llamo al telegraf para que tome esa config.

root@test:/etc/telegraf# /usr/bin/telegraf -config /etc/telegraf/telegraf.conf &
root@test:/etc/telegraf# /usr/bin/telegraf -config /etc/telegraf/VMWare_local.conf &

Si bien no arroja error, puedo verificar el estado:

root@test:/etc/telegraf# 2023-08-25T10:28:18Z I! Loading config: /etc/telegraf/VMWare_local.conf
2023-08-25T10:28:18Z W! DeprecationWarning: Option "force_discover_on_init" of plugin "inputs.vsphere" deprecated since version 1.14.0 and will be removed in 2.0.0: option is ignored
2023-08-25T10:28:18Z I! Starting Telegraf 1.27.3
2023-08-25T10:28:18Z I! Available plugins: 237 inputs, 9 aggregators, 28 processors, 23 parsers, 59 outputs, 4 secret-stores
2023-08-25T10:28:18Z I! Loaded inputs: vsphere
2023-08-25T10:28:18Z I! Loaded aggregators:
2023-08-25T10:28:18Z I! Loaded processors:
2023-08-25T10:28:18Z I! Loaded secretstores: 
2023-08-25T10:28:18Z I! Loaded outputs: influxdb
2023-08-25T10:28:18Z I! Tags enabled: dc=Cloud host=test os=VMWare
2023-08-25T10:28:18Z W! Deprecated inputs: 0 and 1 options
2023-08-25T10:28:18Z I! [agent] Config: Interval:10s, Quiet:false, Hostname:"test", Flush Interval:10s
2023-08-25T10:28:18Z I! [inputs.vsphere] Starting plugin

root@test:/etc/telegraf# 2023-08-25T10:29:46Z I! Loading config: /etc/telegraf/telegraf.conf
2023-08-25T10:29:46Z I! Starting Telegraf 1.27.3
2023-08-25T10:29:46Z I! Available plugins: 237 inputs, 9 aggregators, 28 processors, 23 parsers, 59 outputs, 4 secret-stores
2023-08-25T10:29:46Z I! Loaded inputs: cpu disk kernel mem net processes swap system
2023-08-25T10:29:46Z I! Loaded aggregators:
2023-08-25T10:29:46Z I! Loaded processors:
2023-08-25T10:29:46Z I! Loaded secretstores:
2023-08-25T10:29:46Z I! Loaded outputs: influxdb
2023-08-25T10:29:46Z I! Tags enabled: dc=On-Prem host=test os=Linux
2023-08-25T10:29:46Z I! [agent] Config: Interval:10s, Quiet:false, Hostname:"test", Flush Interval:10s
2023-08-25T10:29:46Z W! DeprecationWarning: Value "false" for option "ignore_protocol_stats" of plugin "inputs.net" deprecated since version 1.27.3 and will be removed in 1.36.0: use the 'inputs.nstat' plugin instead 

root@test:/etc/telegraf# ps -ef | grep telegraf
root       20716   20408  0 10:28 pts/1    00:00:01 /usr/bin/telegraf -config /etc/telegraf/VMWare_local.conf
root       20726   20408  0 10:29 pts/1    00:00:01 /usr/bin/telegraf -config /etc/telegraf/telegraf.conf
root       20744   20408  0 10:37 pts/1    00:00:00 grep --color=auto telegraf
root@test:/etc/telegraf#

#### ya con ambos corriendo, genero la config en el systemctl para que inicie cuando levantan la maquina(VM)

