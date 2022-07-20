docker run \
  --name jeong-decode \
  --gpus all \
  -v /home/jonghoonjung/nfs:/home/jeong/nfs \
  -v /home/jonghoonjung/nfs3:/home/jeong/nfs3 \
  -it jeong-decode:jjh