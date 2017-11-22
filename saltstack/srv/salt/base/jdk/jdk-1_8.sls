#makedirs会自动创建目录，如果目标不存在
jdk-file:
  file.managed:
    - source: salt://jdk/files/jdk-8u72-linux-x64.tar.gz
    - name: /usr/local/soft/jdk-8u72-linux-x64.tar.gz 
    - makedirs: True

jdk-install:
  cmd.run:
    - name: ' /bin/tar -zxf jdk-8u72-linux-x64.tar.gz&&ln -sv jdk1.8.0_72 jdk'
    - cwd: /usr/local/soft
    - unless: 'test -e jdk1.8.0_72'
    - require:
      - file: jdk-file

#absent存在则删除
jdk-rmzip:
  file.absent:
    - name: /usr/local/soft/jdk-8u72-linux-x64.tar.gz

jdk-path:
  file.append:
    - name: /home/lanjing/.bashrc
    - text:
      - export JAVA_HOME=/usr/local/soft/jdk
      - export PATH=$JAVA_HOME/bin:$PATH

