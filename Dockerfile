FROM gradle

# prepare ubuntu for TexturePacker
RUN apt-get update && \
apt-get install -y libgl1-mesa-glx libglib2.0-0 wget npm git dpkg &&\
rm -rf /var/lib/apt/lists/*

# downloaded TexturePacker.deb package into container
RUN wget -qO /tmp/TexturePacker.deb https://www.codeandweb.com/download/texturepacker/5.1.0/TexturePacker-5.1.0-ubuntu64.deb \
    && dpkg -i /tmp/TexturePacker.deb \
    && rm /tmp/TexturePacker.deb

# Uncomment this line if you agree to the license terms
RUN echo agree | TexturePacker --version
