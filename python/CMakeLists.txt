# Python cmake build script

#default: enable python bindings
option(BUILD_PYTHON_PACKAGE "Enable Python bindings" ON)

if(BUILD_PYTHON_PACKAGE)

	# Find swig
	cmake_policy(SET CMP0078 NEW)
	cmake_policy(SET CMP0086 NEW)
	find_package(SWIG REQUIRED)
	include(${SWIG_USE_FILE})

	# Find the scikit-build commands
	find_package(PythonExtensions REQUIRED)

	set(CMAKE_SWIG_FLAGS "")

	include_directories(./../External)
	include_directories(./../External/Eigen)
	include_directories(${PEER_SRC_DIR}/External/alglib)
	include_directories(${PEER_SRC_DIR}/include)

	set_source_files_properties(peer.i PROPERTIES CPLUSPLUS ON)
	set_source_files_properties(peer.i PROPERTIES SWIG_FLAGS "-includeall")
	set_source_files_properties(peer.i PROPERTIES SWIG_FLAGS "-cpperraswarn")
	set_source_files_properties(peer.i PROPERTIES SWIG_MODULE_NAME "peer")

	# Use swig to generate a module from peer.i
	swig_add_library(_peer LANGUAGE python SOURCES peer.i)

	# Link said module against the core peer library
	target_link_libraries(_peer peerlib alglib)

	# Mark the libray as python extension, which changes its naming scheme
	# and set the necessary includes and links
	python_extension_module(_peer)

	# Install the module
	install(TARGETS _peer LIBRARY DESTINATION python/pmbio_peer)

	# Get the wrapper files
	get_property(support_files_directory TARGET _peer PROPERTY SWIG_SUPPORT_FILES)
	# Install them along the library
	install(DIRECTORY ${support_files_directory} DESTINATION python/pmbio_peer)


endif(BUILD_PYTHON_PACKAGE)
