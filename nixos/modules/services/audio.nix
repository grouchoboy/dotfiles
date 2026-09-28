{ lib, config, ... }:

let
  cfg = config.modules.services.audio;
in
{
  options.modules.services.audio = {
    enable = lib.mkEnableOption "PipeWire Audio";
  };

  config = lib.mkIf cfg.enable {
    # Disable PulseAudio in favor of PipeWire
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
