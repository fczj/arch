jdk-dir:
  file.directory:
    - name: /usr/local/soft

jdk-file:
  file.managed:
    - source: salt://jdk/files/jdk-8u72-linux-x64.tar.gz
    - name: /usr/local/soft/jdk-8u72-linux-x64.tar.gz 
    - require:
      - file: jdk-dir

#uless保证安装完了就不再安装
jdk-install:
  cmd.run:
    - name: '/bin/tar -zxf jdk-8u72-linux-x64.tar.gz&& ln -sv jdk1.8.0_72 jdk'
    - cwd: /usr/local/soft
    - unless: 'test -e jdk1.8.0_72'
    - require:
      - file: jdk-file

#absent如果存在就会删除,目录会递归删除
jdk-rmzip:
  file.absent:
    - name: /usr/local/soft/jdk-8u72-linux-x64.tar.gz

jdk-path:
  file.append:
    - name: /home/lanjing/.bashrc
    - text:
      - export JAVA_HOME=/usr/local/soft/jdk
      - export PATH=$JAVA_HOME/bin:$PATH

