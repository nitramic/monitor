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
