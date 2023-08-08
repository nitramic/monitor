# Inicio de pruebas finales con telegraf
## 1 - Clonar el repo de GIT
Esto se hace para bajar en nuestro caso el agente y compilarlo.
Con esto lo busco es dejar un plugin a la medida de lo que necesito para el monitoreo

### La idea general es:
Instalar el agente en cada uno de los servers, para que envie la data la base de influx.
Los datos iniciales son:
                        Uptime
                        CPU
                        Memmory
                        Disk (space)
                        I/O
Datos a enviar a futuro:
                        Datos de Postgres (plugin de Python etcd)
                        Datos del Tomcat  (Plugin Apache)
                        Datos del frontend(Plugin Apache, a determinar)

De los datos que se van a generar en forma local.
Datos de VMWare:
                Hosts
                    CPU
                    Memoria
                    Datastores (Como resolver con clusters? del vsphere?)
Datos de los enlaces:
                Links
                    Uso / Velocidad
                    VPN (?) si estan up & running
Datos de la UPS:
                Si tiene alguna posibilidad de leer el estado
Datos del A/A:
                Si se puede implementar algun monitor.
Datos de los NAS:
                Hay algun plungin para QNAP?
Datos de la central Telefonica:
                Ni idea, buscar 3CX

ver video de Influx University y revisar el clone de git, como hace el buil con el agente y los resultados finales del trabajo 146MB contra 19?
Exportar eso en un caso de uso.

############## OUTPUT de TELEGRAF ###################
 telegraf --help
NAME:
   Telegraf - The plugin-driven server agent for collecting & reporting metrics.

USAGE:
   Telegraf [global options] command [command options] [arguments...]

COMMANDS:
   version  print current version to stdout
   config   commands for generating and migrating configurations
   secrets  commands for listing, adding and removing secrets on all known secret-stores
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --config value [ --config value ]                      configuration file to load
   --config-directory value [ --config-directory value ]  directory containing additional *.conf files
   --test-wait value                                      wait up to this many seconds for service inputs to complete in test mode (default: 0)
   --usage value                                          print usage for a plugin, ie, 'telegraf --usage mysql'
   --pprof-addr value                                     pprof host/IP and port to listen on (e.g. 'localhost:6060')
   --watch-config value                                   monitoring config changes [notify, poll] of --config and --config-directory options
   --pidfile value                                        file to write our pid to
   --password value                                       password to unlock secret-stores
   --old-env-behavior                                     switch back to pre v1.27 environment replacement behavior (default: false)
   --once                                                 run one gather and exit (default: false)
   --debug                                                turn on debug logging (default: false)
   --quiet                                                run in quiet mode (default: false)
   --test                                                 enable test mode: gather metrics, print them out, and exit. Note: Test mode only runs inputs, not processors, aggregators, or outputs (default: false)
   --deprecation-list                                     print all deprecated plugins or plugin options (default: false)
   --input-list                                           print available input plugins (default: false)
   --output-list                                          print available output plugins (default: false)
   --version                                              DEPRECATED: display the version and exit (default: false)
   --sample-config                                        DEPRECATED: print out full sample configuration (default: false)
   --plugin-directory value                               DEPRECATED: path to directory containing external plugins
   --section-filter value                                 filter the sections to print, separator is ':'. Valid values are 'agent', 'global_tags', 'outputs', 'processors', 'aggregators' and 'inputs'
   --input-filter value                                   filter the inputs to enable, separator is ':'
   --output-filter value                                  filter the outputs to enable, separator is ':'
   --aggregator-filter value                              filter the aggregators to enable, separator is ':'
   --processor-filter value                               filter the processors to enable, separator is ':'
   --secretstore-filter value                             filter the secret-stores to enable, separator is ':'
   --help, -h                                             show help
root@test:/etc/telegraf# telegraf --version
Telegraf 1.27.3 (git: HEAD@afcf0133)
