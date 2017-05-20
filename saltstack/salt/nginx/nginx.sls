nginx_debrepo:
  pkgrepo.managed:
    - humanname: Nginx deb package
    - name: deb http://nginx.org/packages/ubuntu/ trusty nginx
    - dist: trusty
    - file: /etc/apt/sources.list.d/nginx.list
    - refresh_db: true

# Fix error: GPG key isn't available
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62:
  cmd.run
sudo apt-get update:
  cmd.run

install_nginx:
  pkg.installed:
    - fromrepo: trusty
    - pkgs:
      - nginx

nginx:
  service.running:
  - enable: True
