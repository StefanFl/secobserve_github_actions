FROM python:3.11.1-alpine

ARG user=importer
ARG group=importer

RUN addgroup -g 1000 -S ${group} && \
    adduser -u 1000 -S ${user} -G ${group}

COPY requirements.txt /
RUN pip install --no-cache-dir -r requirements.txt

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

USER ${user}
