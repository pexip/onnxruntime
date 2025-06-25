
onnxruntime_fetchcontent_declare(
  cudnn_frontend
  URL ${CMAKE_CURRENT_SOURCE_DIR}/external/mirrors/cudnn_frontend/cudnn-frontend-1.7.0.zip
  URL_HASH SHA1=${DEP_SHA1_cudnn_frontend}
  EXCLUDE_FROM_ALL
)

set(CUDNN_FRONTEND_BUILD_SAMPLES OFF CACHE BOOL "" FORCE)
set(CUDNN_FRONTEND_BUILD_UNIT_TESTS OFF CACHE BOOL "" FORCE)
set(CUDNN_FRONTEND_BUILD_PYTHON_BINDINGS OFF CACHE BOOL "" FORCE)
set(CUDNN_PATH ${onnxruntime_CUDNN_HOME})
onnxruntime_fetchcontent_makeavailable(cudnn_frontend)
