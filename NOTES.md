To be managed by the cookbook:

1. Monit definition `monit.erb`
2. Nginx virtualhost `nginx_puma.conf.erb`
3. Puma configuration `puma.conf.erb`

Re (2) In the virtualhost add:

```
proxy_headers_hash_max_size 512;
proxy_headers_hash_bucket_size 128;
```

Finally see this issue for systemd problem: https://github.com/seuros/capistrano-puma/issues/313