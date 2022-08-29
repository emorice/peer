from skbuild import setup

# Package location must be explicitely passed to scikit-build
setup(packages=["pmbio_peer"], package_dir={"": "python"})
