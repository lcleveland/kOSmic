{ config, lib, ... }:
let
  cfg = config.core.settings.sound.pipewire;
in
{
  options.core.settings.sound.pipewire = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable Pipewire";
    };
    alsa.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable ALSA";
    };
    bluetooth.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable Bluetooth";
    };
    pulse.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable PulseAudio";
    };
    jack.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = lib.mdDoc "Enable JACK";
    };
  };
  config = lib.mkIf cfg.enable {
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = cfg.enable;
      alsa.enable = cfg.alsa.enable;
      alsa.support32Bit = cfg.alsa.enable;
      pulse.enable = cfg.pulse.enable;
      jack.enable = cfg.jack.enable;
      wireplumber.extraConfig.bluetoothEnhancements = lib.mkIf cfg.bluetooth.enable {
        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
        };
      };
    };
  };
}
