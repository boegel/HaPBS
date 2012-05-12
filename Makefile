TORQUE="$(HOME)/Downloads/torque-3.0.4_src"

all: HAPBS.chs
	c2hs --cppopts="-I$(TORQUE)/src/include" HAPBS.chs
	ghc --make HAPBS.hs -i$(HOME)/Library/Haskell/ghc-7.0.4/lib/c2hs-0.16.3/share
	ghc --make test.hs -i$(HOME)/Library/Haskell/ghc-7.0.4/lib/c2hs-0.16.3/share -L$(HOME)/Downloads/torque-3.0.4/lib -ltorque

vsc: HAPBS.chs
	c2hs --cppopts="-I/usr/include/torque" HAPBS.chs
	ghc --make HAPBS.hs -i$(HOME)/.cabal/share/c2hs-0.16.3
	ghc --make test.hs -i$(HOME)/.cabal/share/c2hs-0.16.3 -ltorque

clean:
	rm -f test.hi test.o test HAPBS.hs HAPBS.chi HAPBS.chs.h HAPBS.hi HAPBS.o
