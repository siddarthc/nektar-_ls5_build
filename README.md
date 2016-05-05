# nektar-_ls5_build
make file changes to install nektar++ on lonestar5

For some reason, the default make files dont work on ls5 and hence the pain of manually downloading, installing and linking thirdparty software.

To avoid extra pain, just use ifort and icc as default compilers.

ThirdParty software needed:
1) ARPACK
2) gsmpi
3) loki
4) modmetis
5) tinyxml

The compiled softwares are located in ThirdParty.tar.gz

Just download ThirdParty.tar.gz, untar and link with nektar++

To install nektar++, replace default cmake files with the files in this repo
mkdir build & cd build
Configure using CC=icc CXX=icc ccmake ..
NOTE: Turn on cmake options for linking with LIBIFPORT and LIBIFCORE
Turn on MKL and turn off NATIVE_SYSTEM_BLAS_LAPACK
Install using make install 
