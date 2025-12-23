{
  swapDevices = [{
    device = "/swapfile";
    size = 16384;
  }];

  zramSwap = {
    enable = true;
    algorithm = "lz4";
  };

  services.earlyoom = {
    enable = true;

    freeMemThreshold = 5;
    freeSwapThreshold = 10;
  };
}
