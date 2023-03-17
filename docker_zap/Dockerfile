# Python run stage
FROM owasp/zap2docker-stable

# Install importer
COPY importer/ /usr/local/importer/
RUN pip install --no-cache-dir -r /usr/local/importer/requirements.txt

ENV PATH="/usr/local/importer/bin:$PATH"
