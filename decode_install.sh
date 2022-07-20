conda create -y -n decode_env -c turagalab -c pytorch -c conda-forge decode=0.10.0 jupyterlab ipykernel
rm /opt/conda/envs/decode_env/lib/python3.8/site-packages/decode/utils/frames_io.py
cp ETC/frames_io.py /opt/conda/envs/decode_env/lib/python3.8/site-packages/decode/utils/.