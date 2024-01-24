FROM ubuntu:20.04

RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends \
    lib32gcc-s1 libcurl4 libcurl4-openssl-dev && \
    apt-get install --reinstall -y ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd steam
USER steam
WORKDIR /home/steam

COPY --from=steamcmd/steamcmd:ubuntu-20 --chown=steam /root/.steam /home/steam/.steam
COPY --from=steamcmd/steamcmd:ubuntu-20 --chown=steam /usr/games/steamcmd /usr/games/steamcmd
COPY --from=steamcmd/steamcmd:ubuntu-20 --chown=steam /usr/bin/steamcmd /usr/bin/steamcmd

RUN ln -sfn /home/steam/.steam /home/steam/.steam/root
RUN ln -sfn /home/steam/.steam/steamcmd/linux32 /home/steam/.steam/sdk32
RUN ln -sfn /home/steam/.steam/steamcmd/linux64 /home/steam/.steam/sdk64
RUN ln -sfn /home/steam/.steam /home/steam/.steam/steam
RUN ln -sfn /home/steam/.steam/sdk32/steamclient.so /home/steam/.steam/steamcmd/linux32/steamservice.so
RUN ln -sfn /home/steam/.steam/sdk64/steamclient.so /home/steam/.steam/steamcmd/linux64/steamservice.so

CMD ["steamcmd"]
