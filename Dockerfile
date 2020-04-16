FROM conda/miniconda3
COPY repoclient.sh /tmp/repoclient.sh
RUN conda update conda -n base -y && \
    /tmp/repoclient.sh && \
    rm -rf /tmp/repoclient.sh && \
    echo "source <(/usr/local/bin/conda shell.posix activate te)" >> ~/.bashrc

