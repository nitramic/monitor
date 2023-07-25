## Link Dashboards
https://grafana.com/docs/grafana/latest/dashboards/build-dashboards/manage-dashboard-links/#:~:text=Add%20links%20to%20dashboards&text=In%20Type%2C%20select%20dashboards.,links%20to%20all%20other%20dashboards.

## Host (Heat) map
https://grafana.com/grafana/plugins/zestairlove-compacthostmap-panel/

## Dinamyc Text
https://grafana.com/grafana/plugins/marcusolsson-dynamictext-panel/

## 3D Global Panel
https://grafana.com/grafana/plugins/satellogic-3d-globe-panel/

## Docs
https://grafana.com/docs/

## Como transformar los datos
En este caso de Bytes a GB para que sea mas facil de entender
https://docs.influxdata.com/influxdb/cloud/query-data/flux/mathematic-operations/
Aca lo que hice es basado en el doc de imflux, divido directamente en el query ya que permite realizar operaciones.

Query original
SELECT mean("free") FROM "autogen"."disk" WHERE ("host"::tag = 'NB-SVILUPPO99' AND "device"::tag = 'C:') AND $timeFilter GROUP BY time(10s) fill(null)
1690273890000,12492963840
1690273900000,12477947904


Query modificado
SELECT mean("free")/1073741824 FROM "autogen"."disk" WHERE ("host"::tag = 'NB-SVILUPPO99' AND "device"::tag = 'C:') AND $timeFilter GROUP BY time(10s) fill(null)
1690273790000,11.635761260986328
1690273800000,11.635635375976562

## Grafana cli para instalar (en este caso, un panel de monitoreo) plugins
Dentro del contenedor que contiene instalado el grafana correr ($ grafana cli plugins list-remote) para listar los plugins y luego instalar
(grafana-cli plugins install zestairlove-compacthostmap-panel)

$ grafana cli plugins list-remote
id: abhisant-druid-datasource version: 0.0.6
id: aceiot-svg-panel version: 0.0.11
id: ae3e-plotly-panel version: 0.5.0
.
.
.
id: yeya24-chaosmesh-datasource version: 0.2.3
id: zestairlove-compacthostmap-panel version: 0.9.0
id: zuburqan-parity-report-panel version: 1.2.2

9e5a5fe47b34:/usr/share/grafana$ grafana-cli plugins install zestairlove-compacthostmap-panel
✔ Downloaded and extracted zestairlove-compacthostmap-panel v0.9.0 zip successfully to /var/lib/grafana/plugins/zestairlove-compacthostmap-panel

Please restart Grafana after installing or removing plugins. Refer to Grafana documentation for instructions if necessary.

###########
Para este caso es un dashboard de hostmap
###########