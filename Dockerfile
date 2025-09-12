# Gunakan image resmi Ubuntu sebagai base
FROM ubuntu:24.04

# Set label maintainer
LABEL maintainer="official4jelas"

# Nonaktifkan prompt interaktif selama instalasi paket
ENV DEBIAN_FRONTEND=noninteractive

# Instal paket yang diperlukan
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y tmate

# Atur direktori kerja
WORKDIR /ydiskyha

# Ekspos port yang diperlukan (opsional)
EXPOSE 22

# Mulai sesi tmate saat kontainer dimulai
CMD ["tmate", "-F"]
