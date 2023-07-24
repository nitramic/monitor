## Referencia a la pagina
https://www.influxdata.com/blog/using-telegraf-on-windows/

## Download e instalacion
https://portal.influxdata.com/downloads/
### Otra forma
https://technixleo.com/how-to-install-and-use-telegraf-on-windows/

## Config 
https://docs.influxdata.com/telegraf/v1.9/administration/configuration/

## Inspiracion para los dashboards
https://grafana.com/grafana/dashboards/1941-windows-overview/
https://github.com/rasoulivand/windows-exporter-dashboard/blob/main/windows-exporter-dashboard.json

## Monitoreo de Metricas de red en Windows
https://www.sqlservercentral.com/blogs/guide-for-set-up-of-telegraf-for-monitoring-windows-1
https://learn.microsoft.com/en-us/previous-versions/ms803962(v=msdn.10)?redirectedfrom=MSDN

## Otra Data piola - monitoreo red
https://www.influxdata.com/blog/how-monitor-internet-speed-telegraf-influxdb-cloud/


#Notas breves
se realiza el dowload, en este caso un wget
luego se abre el zip y se copia a c:\Program Files\telegraf

Se instala y se indica archivo o dir de conf para telegraf
> .\telegraf.exe --service install --config "C:\Program Files\telegraf\conf\telegraf.conf"

Se verifica el status del nuevo servicio instalado, ya se realizando un start o un stop

.\telegraf.exe --service start
2023-07-21T14:16:39Z E! Failed to start Telegraf Data Collector Service: An instance of the service is already running.

.\telegraf.exe --service start

Para probar la config (En este caso desde powershell con admin privilegies)
PS C:\Program Files\telegraf> .\telegraf --config-directory 'C:\Program Files\telegraf\conf' --test
2023-07-21T14:17:36Z I! Loading config: C:\Program Files\telegraf\conf\telegraf.conf
2023-07-21T14:17:36Z I! Starting Telegraf 1.27.2
2023-07-21T14:17:36Z I! Available plugins: 237 inputs, 9 aggregators, 28 processors, 23 parsers, 59 outputs, 4 secret-stores
2023-07-21T14:17:36Z I! Loaded inputs: cpu disk diskio mem swap system
2023-07-21T14:17:36Z I! Loaded aggregators:
2023-07-21T14:17:36Z I! Loaded processors:
2023-07-21T14:17:36Z I! Loaded secretstores:
2023-07-21T14:17:36Z W! Outputs are not used in testing mode!
2023-07-21T14:17:36Z I! Tags enabled: dc=via-pasuvio-10 host=NB-SVILUPPO99
> mem,dc=via-pasuvio-10,host=NB-SVILUPPO99 available=1757212672i,available_percent=20.668810599217103,total=8501760000i,used=6744547328i,used_percent=79.33118940078289 1689949056000000000
> system,dc=via-pasuvio-10,host=NB-SVILUPPO99 load1=0,load15=0,load5=0,n_cpus=4i 1689949056000000000
> system,dc=via-pasuvio-10,host=NB-SVILUPPO99 uptime=13917i 1689949056000000000
> system,dc=via-pasuvio-10,host=NB-SVILUPPO99 uptime_format=" 3:51" 1689949056000000000
> diskio,dc=via-pasuvio-10,host=NB-SVILUPPO99,name=C: io_time=0i,iops_in_progress=0i,merged_reads=0i,merged_writes=0i,read_bytes=19604273152i,read_time=633i,reads=716106i,weighted_io_time=0i,write_bytes=9048890880i,write_time=124i,writes=243467i 1689949056000000000
> disk,dc=via-pasuvio-10,device=C:,fstype=NTFS,host=NB-SVILUPPO99,mode=rw,path=\C: free=15325622272i,inodes_free=0i,inodes_total=0i,inodes_used=0i,total=240002265088i,used=224676642816i,used_percent=93.6143843199227 1689949056000000000
> disk,dc=via-pasuvio-10,device=D:,fstype=FAT,host=NB-SVILUPPO99,mode=rw,path=\D: free=3244032i,inodes_free=0i,inodes_total=0i,inodes_used=0i,total=10534912i,used=7290880i,used_percent=69.20684292379471 1689949056000000000
> swap,dc=via-pasuvio-10,host=NB-SVILUPPO99 free=4573741056i,total=17003520000i,used=12429778944i,used_percent=73.10121047877145 1689949056000000000
> swap,dc=via-pasuvio-10,host=NB-SVILUPPO99 in=0i,out=0i 1689949056000000000
> cpu,cpu=cpu0,dc=via-pasuvio-10,host=NB-SVILUPPO99 usage_guest=0,usage_guest_nice=0,usage_idle=64.70588235294117,usage_iowait=0,usage_irq=2.9411764705882355,usage_nice=0,usage_softirq=0,usage_steal=0,usage_system=8.823529411764707,usage_user=23.529411764705884 1689949057000000000
> cpu,cpu=cpu1,dc=via-pasuvio-10,host=NB-SVILUPPO99 usage_guest=0,usage_guest_nice=0,usage_idle=54.54545454545455,usage_iowait=0,usage_irq=0,usage_nice=0,usage_softirq=0,usage_steal=0,usage_system=15.151515151515152,usage_user=30.303030303030305 1689949057000000000
> cpu,cpu=cpu2,dc=via-pasuvio-10,host=NB-SVILUPPO99 usage_guest=0,usage_guest_nice=0,usage_idle=54.54545454545455,usage_iowait=0,usage_irq=0,usage_nice=0,usage_softirq=0,usage_steal=0,usage_system=27.272727272727273,usage_user=18.181818181818183 1689949057000000000
> cpu,cpu=cpu3,dc=via-pasuvio-10,host=NB-SVILUPPO99 usage_guest=0,usage_guest_nice=0,usage_idle=45.45454545454545,usage_iowait=0,usage_irq=0,usage_nice=0,usage_softirq=0,usage_steal=0,usage_system=42.42424242424242,usage_user=12.121212121212121 1689949057000000000
> cpu,cpu=cpu-total,dc=via-pasuvio-10,host=NB-SVILUPPO99 usage_guest=0,usage_guest_nice=0,usage_idle=55.303030303030305,usage_iowait=0,usage_irq=0,usage_nice=0,usage_softirq=0,usage_steal=0,usage_system=23.484848484848484,usage_user=21.21212121212121 1689949057000000000
PS C:\Program Files\telegraf>