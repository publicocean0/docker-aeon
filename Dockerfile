from bitnami/minideb:latest
ENV VERSION="v0.12.2.1"
run apt-get update && apt-get -y install wget bzip2 && wget "https://github.com/aeonix/aeon/releases/download/${VERSION}/aeon-linux-x64-${VERSION}.tar.bz2" 
run  tar -jxvf  "aeon-linux-x64-${VERSION}.tar.bz2"
run ln -s /aeon "aeon-${VERSION}"
run wget "https://github.com/Bendr0id/xmrigCC/releases/download/1.6.4/xmrigCC-1.6.4-with_tls-gcc7-linux-static-miner_only-x64.tar.gz"
run tar -xvzf xmrigCC-1.6.4-with_tls-gcc7-linux-static-miner_only-x64.tar.gz && rm xmrigCC-1.6.4-with_tls-gcc7-linux-static-miner_only-x64.tar.gz
run apt-get -y autoremove wget bzip2 && apt-get -y clean  
run mv /aeon-${VERSION} /aeon
run useradd -s /usr/sbin/nologin --uid 10005 -r -M -d /aeon aeon 
run chown -R aeon /aeon  
run  rm -f  "aeon-linux-x64-${VERSION}.tar.bz2"
USER aeon
WORKDIR /aeon
expose 11180 11181
cmd ["/aeon/aeond"]
