# All host-level config for work goes here
{ ... }: {
  networking.extraHosts = ''
    127.0.0.1 app-dev.spaceback.me
    127.0.0.1 api-dev.spaceback.me
  '';
}
