FROM busybox

WORKDIR /fivem
COPY artifact.sh /fivem/artifact.sh
RUN ./artifact.sh

ENTRYPOINT [ "./run.sh" ]
CMD ["+set", "txAdminPort", "40125"]
