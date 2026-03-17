#https://docs.godotengine.org/en/stable/engine_details/development/compiling/optimizing_for_size.html

# scons platform=windows profile=custom.py build_profile=build.gdbuild d3d12=no
# scons platform=android profile=custom.py build_profile=build.gdbuild d3d12=no swappy=yes
# scons platform=web profile=custom.py build_profile=build.gdbuild d3d12=no target=template_release threads=no


target="template_release"
debug_symbols="no"
optimize="size_extra"
lto="full"
disable_advanced_gui="yes"
deprecated="no"  # Disables deprecated features
vulkan="no"      # Disables the Vulkan driver (used in Forward+/Mobile Renderers)
use_volk="no"    # Disables more Vulkan stuff
openxr="no"      # Disables Virtual Reality/Augmented Reality stuff
minizip="no"     # Disables ZIP archive support


# disable things not disabled by compilation configuration tool (from docs)
module_astcenc_enabled = "no"
module_basis_universal_enabled = "no"
module_bcdec_enabled = "no"
module_csg_enabled = "no"
module_dds_enabled = "no"
module_enet_enabled = "no"
module_etcpak_enabled = "no"
module_fbx_enabled = "no"
module_gltf_enabled = "no"
module_gridmap_enabled = "no"
module_hdr_enabled = "no"
module_interactive_music_enabled = "no"
module_jsonrpc_enabled = "no"
module_ktx_enabled = "no"
module_mbedtls_enabled = "no"
module_meshoptimizer_enabled = "no"
module_mobile_vr_enabled = "no"
module_msdfgen_enabled = "no"
module_multiplayer_enabled = "no"
module_noise_enabled = "no"
module_navigation_3d_enabled = "no"
module_openxr_enabled = "no"
module_regex_enabled = "no"
module_tga_enabled = "no"
module_theora_enabled = "no"
module_tinyexr_enabled = "no"
module_upnp_enabled = "no"
module_vhacd_enabled = "no"
module_zip_enabled = "no"