{
  environment = {
    variables = {
      HOMEBREW_NO_ANALYTICS = "1";
      HOMEBREW_NO_INSECURE_REDIRECT = "1";
      HOMEBREW_NO_EMOJI = "1";
      HOMEBREW_NO_ENV_HINTS = "1";
    };
  };

  homebrew = {
    enable = true;
    casks = [
      "windows-app"
      "docker-desktop"
      "nikitabobko/tap/aerospace"
      "obsidian"
    ];
    taps = [
      "nikitabobko/tap"
    ];
    brews = [
   ];
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    caskArgs.require_sha = true;
  };
}

