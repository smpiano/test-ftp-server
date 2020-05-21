docker run -it \
  -v /home/matu/Downloads/win:/home/sermapi/win \
  -p 20-21:20-21 \
  -p 15000-15010:15000-15010 \
  test-ftp-server:v1.0.0 bash
