NAME = xalancbmk
SRCS = $(shell find ./src -name "*.cpp")
CFLAGS = -I./src -I./src/xercesc -I./src/xercesc/dom -I./src/xercesc/dom/impl -I./src/xercesc/sax -I./src/xercesc/util/MsgLoaders/InMemory -I./src/xercesc/util/Transcoders/Iconv -I./src/xalanc/include -DPROJ_XMLPARSER -DPROJ_XMLUTIL -DPROJ_PARSERS -DPROJ_SAX4C -DPROJ_SAX2 -DPROJ_DOM -DPROJ_VALIDATORS -DXML_USE_NATIVE_TRANSCODER -DXML_USE_INMEM_MESSAGELOADER -DXML_USE_PTHREADS -DSPEC_CPU_LINUX -DAPP_NO_THREADS -DXALAN_INMEM_MSG_LOADER
LD_CXX = 1
include ../Makefile.apps

test-cmp:
	$(DIFF) run/test.out data/test/output/test.out

train-cmp:
	$(DIFF) run/train.out data/train/output/train.out

ref-cmp:
	$(DIFF) run/ref.out data/ref/output/ref.out
