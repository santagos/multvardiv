# The CI runs on Linux Ubuntu, here goes system dependencies
# needed at render step: multvardiv imports rgl, whose shared library
# links against libGLU.so.1
sudo apt-get install -y libglu1-mesa
