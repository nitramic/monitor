FROM telegraf:latest as telegraf
RUN apt-get update && apt-get install -y --no-install-recommends mtr-tiny && \
	rm -rf /var/lib/apt/lists/*