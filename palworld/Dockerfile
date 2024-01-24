FROM lapin/steamcmd

USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    xdg-user-dirs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER steam
VOLUME ["/palworld"]
WORKDIR /palworld
COPY entrypoint.sh /palworld/entrypoint.sh
USER root
RUN chmod 744 /palworld/entrypoint.sh

ENV STEAMUSER="anonymous" \
    STEAMPASSWORD="" \
    STEAM2FA="" \
    GAMEPORT="8211" \
    GAMEPLAYERS="16" \
    MULTITHREAD="true"

USER steam
ENTRYPOINT [ "/palworld/entrypoint.sh" ]
