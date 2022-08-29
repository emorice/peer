## A re-packaging of the PEER library with updated python3 bindings

PEP 517 based build system. For linux/python3. Install instructions:

```
pip install 'git+https://github.com/emorice/peer.git'
```
 
This installs the required build dependencies in a build environment, including cmake and swig,
builds the package from source, and installs the resulting wheel  in the current python environment.
 
Note that support for pyproject.toml and build dependencies was introduced in
setuptools 61, but some systems have an older version installed and improper
isolation that may leak the older setuptools system version in the build environment. If this affects
you, try running the build from inside a virtual environment (without
`--system-site-packages` !)

Original description follows, with outdated instructions removed:
 
---

PEER package source distribution.
A complete documentation can be found her
https://github.com/PMBio/peer/wiki/

### Package content

Source distribution of the PEER library with bindings to python, ~~R,standalone~~

~~######## Installation instructions ##########~~

### Usage

Quick examples of use cases of peer can be found in examples.
For a comprehensive documentation and examples please see
https://github.com/PMBio/peer/wiki/
