homebrew-BanzaiNGS
==================

Borrowing from Torsten Seemann - get Banzai Pipeline dependencies as (Linux) 
brew formula.

**I'm only worring about a Ubuntu 14.04 target**. Don't tap this shit!

**I don't care for compiling from source**. Don't tap this shit!


Usage
-----

(Assuming you have brew/linux-brew installed.)

Tap the kegs::

    brew tap homebrew/science
    brew tap chapmanb/cbl
    brew tap tseemann/homebrew-bioinformatics-linux
    brew tap mscook/BanzaiNGS

Install a BanzaiNGS recipe::

    brew install NCBIBlastBinary


Why?
----

See the pipelin.es_ REPO

.. _pipelin.es: https://github.com/mscook/pipelin.es


Reference material
------------------

https://github.com/Homebrew/homebrew/blob/master/Library/Contributions/example-formula.rb

https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md#formula-cookbook

http://jimkubicek.com/blog/2015/02/14/creating-a-homebrew-formula-for-a-python-project/

