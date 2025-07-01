project('onnxruntime_static_combined', ['cpp','c'])

ortlibdir = meson.current_build_dir() 
depsdir = join_paths(ortlibdir, '_deps')
absl_libdir = join_paths(ortlibdir, '_deps', 'abseil_cpp-build', 'absl')
absl_basedir = join_paths(absl_libdir,'base')
absl_stringsdir = join_paths(absl_libdir,'strings')
absl_hashdir = join_paths(absl_libdir,'hash')
absl_logdir = join_paths(absl_libdir,'log')
absl_debuggingdir = join_paths(absl_libdir,'debugging')
absl_timedir = join_paths(absl_libdir,'time')
absl_synchdir = join_paths(absl_libdir,'synchronization')
absl_numericdir = join_paths(absl_libdir,'numeric')
absl_containerdir = join_paths(absl_libdir,'container')
absl_deps2_list = [
  files(join_paths(absl_basedir, 'libabsl_base.a')),
  files(join_paths(absl_stringsdir, 'libabsl_strings.a')),
  files(join_paths(absl_stringsdir, 'libabsl_strings_internal.a')),  
  files(join_paths(absl_basedir, 'libabsl_strerror.a')),
  files(join_paths(absl_stringsdir,'libabsl_str_format_internal.a')),
  files(join_paths(absl_basedir,'libabsl_raw_logging_internal.a')),
  files(join_paths(absl_logdir,'libabsl_log_internal_message.a')),
  files(join_paths(absl_debuggingdir,'libabsl_debugging_internal.a')),
  files(join_paths(absl_debuggingdir,'libabsl_stacktrace.a')),
  files(join_paths(absl_debuggingdir,'libabsl_symbolize.a')),
  files(join_paths(absl_debuggingdir,'libabsl_examine_stack.a')),
  files(join_paths(absl_debuggingdir,'libabsl_demangle_rust.a')),  
  files(join_paths(absl_debuggingdir,'libabsl_demangle_internal.a')),
  files(join_paths(absl_debuggingdir,'libabsl_decode_rust_punycode.a')), 
  files(join_paths(absl_debuggingdir,'libabsl_utf8_for_code_point.a')),
  files(join_paths(absl_logdir,'libabsl_log_initialize.a')),
  files(join_paths(absl_logdir,'libabsl_log_internal_globals.a')),
  files(join_paths(absl_logdir,'libabsl_vlog_config_internal.a')),
  files(join_paths(absl_logdir,'libabsl_log_internal_proto.a')),
  files(join_paths(absl_logdir,'libabsl_log_internal_format.a')),
  files(join_paths(absl_logdir,'libabsl_log_internal_log_sink_set.a')),
  files(join_paths(absl_logdir,'libabsl_log_sink.a')),
  files(join_paths(absl_logdir,'libabsl_log_internal_fnmatch.a')),
  files(join_paths(absl_basedir,'libabsl_malloc_internal.a')),
  files(join_paths(absl_synchdir,'libabsl_kernel_timeout_internal.a')),
  files(join_paths(absl_basedir,'libabsl_spinlock_wait.a')),
  files(join_paths(absl_synchdir,'libabsl_synchronization.a')),
  files(join_paths(absl_numericdir,'libabsl_int128.a')),
  files(join_paths(absl_logdir,'libabsl_log_globals.a')),
  files(join_paths(absl_timedir,'libabsl_time.a')),
  files(join_paths(absl_timedir,'libabsl_time_zone.a')),    
]
absl_deps1_list = [
  files(join_paths(absl_hashdir,'libabsl_hash.a')),
  files(join_paths(absl_containerdir,'libabsl_raw_hash_set.a')),
  files(join_paths(absl_hashdir,'libabsl_city.a')),
  files(join_paths(absl_hashdir,'libabsl_low_level_hash.a')),
  files(join_paths(absl_basedir,'libabsl_throw_delegate.a')),
]
ort_list = [
  files(join_paths(ortlibdir, 'libonnxruntime_session.a')),
  files(join_paths(ortlibdir, 'libonnxruntime_common.a')),
  files(join_paths(ortlibdir, 'libonnxruntime_flatbuffers.a')),
  files(join_paths(ortlibdir, 'libonnxruntime_util.a')),
  files(join_paths(ortlibdir, 'libonnxruntime_framework.a')),
  files(join_paths(ortlibdir, 'libonnxruntime_lora.a')),
  files(join_paths(ortlibdir, 'libonnxruntime_optimizer.a')),
  files(join_paths(ortlibdir, 'libonnxruntime_mlas.a')),
  files(join_paths(ortlibdir, 'libonnxruntime_graph.a')),
  files(join_paths(ortlibdir, 'libonnxruntime_providers.a')),
]

libabsl1 = static_library(
  'absl1',
  'dummy.cpp',
  objects:absl_deps1_list,
)
libabsl1_deps = declare_dependency(
  link_with: libabsl1,
)
libabsl2 = static_library(
  'absl2',
  'dummy.cpp',
  objects:absl_deps2_list,
)
libabsl2_deps = declare_dependency(
  link_with: libabsl2,
) 
libre2 = static_library(
  're2',
  'dummy.cpp',
  objects: files(join_paths(depsdir, 're2-build', 'libre2.a'))
)
libre2_deps = declare_dependency(
  link_with: libre2,
)
libflatbuffers = static_library(
  'flatbuffer',
  'dummy.cpp',
  objects: files(join_paths(depsdir, 'flatbuffers-build', 'libflatbuffers.a'))
)
libflatbuffers_deps = declare_dependency(
  link_with: libflatbuffers
)
libonnx_proto = static_library(
  'onnx_proto',
  'dummy.cpp',
  objects: files(join_paths(depsdir,'onnx-build', 'libonnx_proto.a'))
)
libonnx_proto_dep = declare_dependency(
  link_with: libonnx_proto,
)
libcpuinfo = static_library(
  'cpuinfo',
  'dummy.cpp',
  objects: files(join_paths(depsdir,'pytorch_cpuinfo-build','libcpuinfo.a'))
)
libcpuinfo_deps = declare_dependency(
  link_with: libcpuinfo,
)
libort_statics = static_library(
  'ort_statics',
  'dummy.cpp',
  objects: ort_list
)
libort_deps = declare_dependency(
  link_with: libort_statics, 
)
libonnx = static_library(
  'onnx',
  'dummy.cpp', 
  objects: files(join_paths(depsdir, 'onnx-build','libonnx.a')),
)
libonnx_dep = declare_dependency(
  link_with: libonnx,
)
libproto = static_library(
  'protobuf',
  'dummy.cpp',
  objects:[files(join_paths(depsdir, 'protobuf-build', 'libprotobuf-lite.a'))]
)
libproto_dep = declare_dependency(
  link_with: libproto,
)
final_dep_lists = [
  libort_deps.as_link_whole(),
  libcpuinfo_deps.as_link_whole(),
  libabsl1_deps.as_link_whole(),
  libre2_deps.as_link_whole(),
  libabsl2_deps.as_link_whole(),
  libonnx_dep.as_link_whole(),
  libproto_dep.as_link_whole(),
  libonnx_proto_dep.as_link_whole(),
  libflatbuffers_deps.as_link_whole(),
]

ort_bundle = static_library('ort_wrapper', 'dummy.cpp', dependencies:final_dep_lists)

# forcing meson to directly cp instead of doing the normal install procedure
install_mylib = custom_target(
  'install_mylib',
  input: ort_bundle,
  output: 'libonnxruntime_bundle.a',
  command: ['cp', '@INPUT@', '@OUTPUT@'],
  install: true,
  install_dir: get_option('libdir')
)

pkg_mod = import('pkgconfig')
pkg_mod.generate(
  filebase:'libonnxruntime_bundle',
  name: 'onnxruntime bundle',
  description: 'Combined ONNX Runtime static library',
  version: '1.0.0',  
  libraries: ['-L${libdir}','-lonnxruntime_bundle'],
  subdirs: ['onnxruntime','onnxruntime/core','onnxruntime/core/session'],
  install_dir: join_paths(get_option('prefix'), get_option('libdir'), 'pkgconfig'),
)