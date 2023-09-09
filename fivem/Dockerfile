FROM busybox

WORKDIR /fivem
COPY artifact.sh entrypoint.sh ./
RUN chmod 744 artifact.sh entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["+set", "txAdminPort", "40125"]
