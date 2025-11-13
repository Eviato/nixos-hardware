{ lib, ... }:

{
  imports = [
    ../../../../common/pc/ssd
    ../../../../common/cpu/intel/arrow-lake
  ];

  hardware.trackpoint.device = "TPPS/2 Synaptics TrackPoint";

  services.thermald.enable = lib.mkDefault true;

  boot = {
    # See https://thesofproject.github.io/latest/getting_started/intel_debug/introduction.html#pci-devices-introduced-after-2016
    extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=1
    '';
  };
}
