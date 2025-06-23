set(EIGEN_BUILD_DOC OFF CACHE BOOL "" FORCE)
set(EIGEN_BUILD_BLAS OFF CACHE BOOL "" FORCE)
set(EIGEN_BUILD_LAPACK OFF CACHE BOOL "" FORCE)
set(EIGEN_BUILD_PKGCONFIG OFF CACHE BOOL "" FORCE)
set(EIGEN_BUILD_CMAKE_PACKAGE ON CACHE BOOL "" FORCE)

onnxruntime_fetchcontent_declare(
    Eigen3
    URL ${CMAKE_CURRENT_SOURCE_DIR}/external/mirrors/eigen/eigen-1d8b82b0740839c0de7f1242a3585e3390ff5f33.zip
    URL_HASH SHA1=${DEP_SHA1_eigen}
    EXCLUDE_FROM_ALL
)
onnxruntime_fetchcontent_makeavailable(Eigen3)
if(EXISTS "${CMAKE_BINARY_DIR}/_deps/eigen3-subbuild")
  # Copy the entire subbuild folder into build
  add_custom_target(fix_eigen3_build_dir ALL
    COMMAND ${CMAKE_COMMAND} -E copy_directory
      ${CMAKE_BINARY_DIR}/_deps/eigen3-subbuild
      ${CMAKE_BINARY_DIR}/_deps/eigen3-build
    COMMENT "Renaming eigen3 subbuild → build so install() can find it"
  )
endif()
