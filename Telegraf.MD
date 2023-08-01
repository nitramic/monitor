## Install
https://docs.influxdata.com/telegraf/v1.27/install/

## Configuring Telegraf
https://docs.influxdata.com/telegraf/v1.9/administration/configuration/

https://github.com/influxdata/telegraf/blob/master/plugins/inputs/processes/README.md
### Explicado por grafana
https://grafana.com/tutorials/stream-metrics-from-telegraf-to-grafana/?src=grafana_gettingstarted

## Como guardar Secrets o variables de entorno
https://github.com/influxdata/telegraf/blob/master/docs/CONFIGURATION.md#secret-store-secrets

## Documentation
https://docs.influxdata.com/telegraf/v1.27/
https://university.influxdata.com/courses/data-collection-with-telegraf-tutorial/
https://sweetcode.io/set-up-telegraf-influxdb-and-grafana-with-docker-compose/

## Como Funciona los plugins de telegraf para ejecutar comandos externos al momento de colectar datos exec & execd
https://www.influxdata.com/blog/plugin-spotlight-exec-execd/
https://docs.influxdata.com/telegraf/v1.20/plugins/#exec

https://github.com/influxdata/telegraf/blob/release-1.20/plugins/inputs/docker/README.md
https://docs.influxdata.com/telegraf/v1.27/data_formats/input/
https://docs.influxdata.com/telegraf/v1.19/external_plugins/shim/

## Multiple telegraf configs
https://stackoverflow.com/questions/58920613/how-to-configure-multiple-telegraf-service-file-to-run-multiple-telegraf-instanc
https://community.influxdata.com/t/multiple-telegraf-configs/245/4

para envio de datos a multiple telegraf databases
https://github.com/influxdata/telegraf/issues/809


## Otro, como stremear telegraf hacia grafana Live
https://grafana.com/blog/2021/08/16/streaming-real-time-telegraf-metrics-using-grafana-live/
https://grafana.com/tutorials/stream-metrics-from-telegraf-to-grafana/
## Monitoreo de Postgres via telegraf hacia Grafana
https://www.influxdata.com/blog/monitoring-your-postgresql-database-with-telegraf-and-influxdb/

################### Implementacion ###################
Hacer un pull de la imagen de Telegraf
user@docker01:~$ mkdir telegraf

Comando para generar archivo de config de telegraf
user@docker01:~$ docker run --rm telegraf -sample-config > telegraf/telegraf.conf

Descomentamos lo que necesitamos monitorear y las config que enviamos
EJ Input/Output/Etc

Luego ejecutamos el contenedo con todo lo que necesitamos ya configurado

########### Otro tipo de implementacion ########### (Probar)
se pueden dejar como varias instancias de telegraf corriendo para que colecte datos
En mi caso seria por ejemplo vmware para realtime cada 5 o 10 sec y las otras metricas que serian 
mas para analisis en ventanas de tiempo mas largas para ver su "evolucion" (?) cada 1min

como a su vez levantar metricas con un script, como en este caso, uno de python que toma mas datos de 
postgres que el propio agente de telegraf cada 30 segundos.

todo eso metido en el directorio ./conf de telegraf, para que cuando levante va a buscar y aplicar
todos los archivos .conf que encuentre en ese directorio.

Nota de correccion:
Eliminar o comentar todos los plugins en el file /etc/telegraf/telegraf.conf, seteando solamente la entrada [agent] 
y [global_tags].

Crear un archivo para cada plugin de [imput] y otro para cada plugin de [output] y colocarlos dentro del directorio
/etc/telegraf/telegraf.d
EJ:.
    /etc/telegraf/telegraf.d/inputs.disk.conf
    /etc/telegraf/telegraf.d/inputs.diskio.conf
    /etc/telegraf/telegraf.d/inputs.kernel.conf
    /etc/telegraf/telegraf.d/outputs.influxdb.conf

