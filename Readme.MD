## Para investigar y aplicar
https://www.virtualmetric.com/blog/maximizing-vmware-performance

https://www.influxdata.com/integration/vmware-vsphere/

https://github.com/influxdata/telegraf/blob/master/plugins/inputs/vsphere/README.md
https://github.com/influxdata/telegraf/blob/master/plugins/inputs/vsphere/endpoint.go


https://computingforgeeks.com/how-to-monitor-vmware-esxi-with-grafana-and-telegraf/

## Comenzamos
1 - https://www.influxdata.com/integration/vmware-vsphere/
2 - https://github.com/influxdata/telegraf/blob/master/plugins/inputs/vsphere/README.md

### Para tomar referencia
https://blog.devops.dev/monitoring-vsphere-via-vcenter-with-telegraf-prometheus-and-grafana-ed2d1fbc7f9f

### Primeros Pasos(?)
https://blog.devops.dev/monitoring-vsphere-via-vcenter-with-telegraf-prometheus-and-grafana-ed2d1fbc7f9f
https://computingforgeeks.com/how-to-monitor-vmware-esxi-with-grafana-and-telegraf/

VMWare_Local pasa a carpeta old, los tags globales generan mucho problemas en los scripts del dashboard de grafana (todavia no estoy muy ducho con los queries de GraphQL)
Por esto se generan 2 nuevas configs para la recoleccion de datos por parte de telegraf
1-para datos en realtime    (VMWARE_realtime.conf)
2-para datos historicos     (VMWARE_historical.conf)
y se suma el dashboard en /Grafana_dashboards/Selects/VMWARE_vSPhere.json