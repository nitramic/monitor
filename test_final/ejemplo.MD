telegraf --input-filter cpu:disk:diskio:disque:mem:net:swap:sysstat:system --output-filter influxdb
## Pasaron cosas
telegraf --input-filter cpu:disk:mem --output-filter influxdb config > local_vm2.conf
telegraf --input-filter cpu:disk:io:mem:net:system:swap:netsat:processes:kernel --output-filter influxdb config > local_vm3.conf

### Verificar de instalar 
apt install sysstat

### Para hacer la prueba que funciona:
telegraf --config local_vm2.conf --test

## Panel de Grafana
https://grafana.com/grafana/dashboards/5955-telegraf-system-metrics/