# Device specific configuration for ThinkPad X1 Carbon 7th Gen (20R1)
{ config, pkgs, ... }:

{
  # Activate acpi_call module for TLP ThinkPad features
  boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];

  # Update Intel CPU Microcode
  hardware.cpu.intel.updateMicrocode = true;

  # Enable Bluetuooth.
  hardware.bluetooth.enable = true;

  # Enable TLP Power Management
  services.tlp = {
    enable = true;
    extraConfig = ''
      START_CHARGE_THRESH_BAT0=85
      STOP_CHARGE_THRESH_BAT0=90
    '';
  };

  # Enable fprintd
  services.fprintd.enable = true;
}