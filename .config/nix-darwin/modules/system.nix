{
#  system.activationScripts.extraActivation.text = ''
#    '';
#  system.activationScripts.postUserActivation.text = ''
#    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u;
#
#    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false            
#    defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false    
#    defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false       
#    defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false 
#    defaults write -g NSWindowShouldDragOnGesture -bool true
#    defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
#    '';

  system.primaryUser = "rahenriques";

  system.defaults = {
    dock = {
      mru-spaces = false;
      enable-spring-load-actions-on-all-items = true;
      appswitcher-all-displays = true;
      launchanim = false;
      magnification = true;
      mineffect = "scale";
      minimize-to-application = false;
      mouse-over-hilite-stack = true;
      show-recents = false;

      largesize = 16;

      autohide = true;
      autohide-delay = 0.24;
      autohide-time-modifier = 1.0;

      expose-group-apps = true;
      expose-animation-duration = 1.0;

      static-only = false;
      persistent-apps = [
      {
        app = "/System/Applications/Launchpad.app";
      }
      ];
    };

    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    screencapture = {
      location = "~/Pictures/Screenshots";
    };

    screensaver = {
      askForPasswordDelay = 10;
    };

    NSGlobalDomain = {
      AppleShowScrollBars = "WhenScrolling";
      "com.apple.swipescrolldirection" = false;
      "com.apple.mouse.tapBehavior" = 1;
      "com.apple.sound.beep.volume" = 0.0;
      "com.apple.sound.beep.feedback" = 0;
    };

    controlcenter = {
      AirDrop = false;
      Bluetooth = false;
      Display = false;
      NowPlaying = false;
      FocusModes = true;
      Sound = true;
    };

    menuExtraClock = {
      FlashDateSeparators = true;
      Show24Hour = true;
      ShowDate = 1;
      ShowDayOfMonth = true;
    };

  };

  # networking.wakeOnLan.enable = false;
}
