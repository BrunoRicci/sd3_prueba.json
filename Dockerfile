# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail was-node-suite-comfyui@1.0.2 --mode remote
RUN comfy node install --exit-on-fail comfyui-kjnodes@1.2.2

# The following custom nodes are not available in the ComfyUI registry and no aux_id (GitHub repo) was provided in the workflow metadata,
# so they cannot be automatically installed. If you have GitHub repos for them, provide aux_id values so they can be cloned.
# wlsh
# adv-encode
# comfyroll
# tiled-diffusion
# unknown_registry (contains multiple nodes like GetNode, SetNode, Note, Fast Groups Bypasser (rgthree)) - no aux_id provided

# download models into comfyui
# RUN # Could not find URL for modelo.safetensors
# RUN # Could not find URL for escala.pth

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
