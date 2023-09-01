El agente de telegraf puede ver los siguientes estados del servicio

> SELECT * FROM systemd_units
name: systemd_units
time                active     active_code host     load   load_code name           sub     sub_code
----                ------     ----------- ----     ----   --------- ----           ---     --------
1693558800000000000 active     0           docker01 loaded 0         docker.service running 0
1693558810000000000 active     0           docker01 loaded 0         docker.service running 0
1693558820000000000 active     0           docker01 loaded 0         docker.service running 0
1693558830000000000 inactive   2           docker01 loaded 0         docker.service dead    1
1693558840000000000 inactive   2           docker01 loaded 0         docker.service dead    1
.
.
.
1693559040000000000 inactive   2           docker01 loaded 0         docker.service dead    1
1693559050000000000 inactive   2           docker01 loaded 0         docker.service dead    1
1693559060000000000 activating 4           docker01 loaded 0         docker.service start   3
1693559070000000000 activating 4           docker01 loaded 0         docker.service start   3
1693559080000000000 active     0           docker01 loaded 0         docker.service running 0