# fetch_image
- a buildroot docker to compile kernerl for embedded device

# to run
`# fetch buildroot`
`git submodule update`

`docker pull logic/buildroot_img`
`docker run -it -v <hosts_build_root_dir>:/root/buildroot logickee/buildroot_img:latest /bin/bash # --rm`
