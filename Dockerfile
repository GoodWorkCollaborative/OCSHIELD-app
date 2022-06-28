FROM mambaorg/micromamba:0.22.0

COPY --chown=$MAMBA_USER:$MAMBA_USER env.yaml /tmp/env.yaml
RUN micromamba install -y -f /tmp/env.yaml && \
  micromamba clean --all --yes

# Add our code
ADD . /opt/app/
WORKDIR /opt/app

CMD panel serve --address="0.0.0.0" --port=$PORT 2020_directory.ipynb --allow-websocket-origin=occensusnetwork.herokuapp.com