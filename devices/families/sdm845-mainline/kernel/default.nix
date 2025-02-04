{ mobile-nixos
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder {
  version = "6.11.0";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845-6.11.0";
    hash = "sha256-Mf6lCozshFMSFHiy7AjS4dQ/jVWn0hXKFLcSHxwAwCc=";
  };

  patches = [
    ./0001-enable-usb-host-by-modifying-dr_mode.patch
  ];

  isModular = true;
  isCompressed = "gz";
}
