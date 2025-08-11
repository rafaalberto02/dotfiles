{
  environment = {
    variables = {
      HOMEBREW_NO_ANALYTICS = "1";
      HOMEBREW_NO_INSECURE_REDIRECT = "1";
      HOMEBREW_NO_EMOJI = "1";
      HOMEBREW_NO_ENV_HINTS = "0";
    };
  };

  homebrew = {
    enable = true;
    casks = [
      "libreoffice"
      "tidal"
      "thunderbird"
      "bitwarden"
      "firefox"
      "firefox@nightly"
      "windows-app"
      "docker-desktop"
      "nikitabobko/tap/aerospace"
      "temurin@8"
      "remote-desktop-manager"
    ];
    taps = [
      "nikitabobko/tap"
    ];
    brews = [
      "openjdk@21"
      "openjdk@11"
      "gtk4"
      "pkg-config"
      "sshpass"
      "ansible"
      "nmap"
      "ldns"
      "knot"
    ];
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    caskArgs.require_sha = true;
  };
}

