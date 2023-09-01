1- Create the directory C:\Program Files\Telegraf
2- Place the telegraf.exe and the telegraf.conf files into C:\Program Files\Telegraf.

C:\"Program Files"\Telegraf\telegraf.exe --service install

3- To verify that it works, run:
C:\"Program Files"\Telegraf\telegraf.exe --config C:\"Program Files"\Telegraf\telegraf.conf --test

4- To start collecting data, run:
net start telegraf

######################
Other supported operations
Telegraf can manage its own service through the --service flag:

telegraf.exe --service install	Install telegraf as a service
telegraf.exe --service uninstall	Remove the telegraf service
telegraf.exe --service start	Start the telegraf service
telegraf.exe --service stop	Stop the telegraf service