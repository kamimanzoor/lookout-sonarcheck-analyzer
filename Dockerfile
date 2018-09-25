FROM python:3.7-slim-stretch

RUN apt-get update && \
    apt-get install -y dumb-init curl libxml2-dev build-essential ca-certificates
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt

ADD ./sonarcheck_analyzer.py /bin/sonarcheck_analyzer.py

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["python3", "/bin/sonarcheck_analyzer.py"]
