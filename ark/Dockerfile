FROM steamcmd/steamcmd:ubuntu-20

COPY entrypoint.sh /ark/entrypoint.sh
RUN chmod 744 /ark/entrypoint.sh

ENTRYPOINT [ "/ark/entrypoint.sh" ]
