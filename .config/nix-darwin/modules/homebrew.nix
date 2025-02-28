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
      "whatsapp"
      "microsoft-teams"
      "thunderbird"
      "bitwarden"
      "firefox"
      "windows-app"
    ];
    onActivation = {
      autoUpdate = true;
      upgrade = false;
      cleanup = "zap";
    };
    caskArgs.require_sha = true;
  };
}

