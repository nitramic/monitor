## Aca inicio todo
https://www.srijn.net/advanced-postgresql-monitoring-using-telegraf/
https://www.influxdata.com/blog/monitoring-your-postgresql-database-with-telegraf-and-influxdb/
https://github.com/influxdata/telegraf/blob/master/plugins/inputs/postgresql/README.md

https://github.com/influxdata/telegraf/tree/master/plugins/inputs/execd?ref=srijn.net
https://github.com/srijan/telegraf-execd-pg-custom?ref=srijn.net
https://github.com/srijan/telegraf-execd-pg-custom/tree/main
https://docs.influxdata.com/telegraf/v1.9/administration/configuration/
https://www.influxdata.com/blog/plugin-spotlight-exec-execd/
https://docs.influxdata.com/telegraf/v1.19/external_plugins/shim/

https://dzone.com/articles/monitoring-your-postgresql-database-with-telegraf




## Otros
https://docs.influxdata.com/telegraf/v1.19/external_plugins/shim/
https://docs.logz.io/shipping/prometheus-sources/telegraf-postgresql.html
https://dzone.com/articles/monitoring-your-postgresql-database-with-telegraf
https://dev.to/ftisiot/out-of-the-box-postgresql-monitoring-with-influxdb-and-grafana-dashboards-blc
https://medium.com/unified-apis/monitoring-postgresql-with-telegraf-influxdb-and-grafana-5b2f05f33bfe
https://grafana.com/grafana/dashboards/4164-vm-pgsql-box-a/

https://www.commandprompt.com/education/how-to-get-list-of-running-queries-in-postgresql/


## Importante, proximos paso para el monitoreo (Real Time ?)
https://www.shanelynn.ie/postgresql-find-slow-long-running-and-blocked-queries/
Nota: De aca sale la idea de multiples instancias del script/daemon/plugin de monitoreo de telegraf
En este caso serian 2.
El primero que correria cada 10 segundos +/- con queris "limitados" para no sobrecargar la base
El Segundo para que guarde data de larga duracion, correria de 2 a 5 min por vuelta (falta definir)

https://virtual-dba.com/blog/postgresql-performance-identifying-hot-and-slow-queries/
https://www.shanelynn.ie/postgresql-find-slow-long-running-and-blocked-queries/

## git de influx para el plugin de postgres
https://github.com/influxdata/telegraf/blob/master/plugins/inputs/postgresql/README.md


#### Lo mejor / Load Testers :D
pgbench
https://stackoverflow.com/questions/28053097/simulating-emulating-a-heavily-loaded-database-server-in-postgresql
https://blog.lawrencejones.dev/building-a-postgresql-load-tester/
https://hackernoon.com/how-to-create-and-load-test-data-in-postgresql-i41e353m
https://sunnykichloo.wordpress.com/2022/07/29/postgresql-database-stress-testing-using-pgbench/

# Ver
https://manpages.ubuntu.com/manpages/trusty/man1/pg_activity.1.html
https://pganalyze.com/blog/5mins-postgres-high-cpu-utilization-explain-plans-linux-perf
https://dba.stackexchange.com/questions/44084/troubleshooting-high-cpu-usage-from-postgres-and-postmaster-services
## Tracing SQL queries
https://www.keyvanfatehi.com/2022/12/22/how-to-trace-postgresql-database-sql-queries/
https://www.postgresql.org/docs/current/dynamic-trace.html