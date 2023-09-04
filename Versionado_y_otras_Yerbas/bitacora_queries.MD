
SELECT * FROM win_services WHERE "service_name"=~/SQL/  <---- Go Regex!!! =~/SQL/
SELECT LAST(*) FROM win_services WHERE "service_name"=~/SQL/

########################
## Servicios en Linux ##
########################

SELECT LAST(active_code) FROM systemd_units GROUP BY host
SELECT LAST(active_code) FROM systemd_units WHERE "name"=~/docker/ GROUP BY host

Verificar porque trae el valor pero sin nombre de host, no sé si es porque solo reporta un solo agente