-- vim: sw=2 ts=2 sts=2 et
Config {
    font = "xft:Dejavu Sans:size=10,sans-serif:size=10,FontAwesome:size=10"
  , bgColor =      "black"
  , fgColor =      "#c0c0c0"
  , position =     Top
  , borderColor =  "#646464"

  -- layout
  , sepChar =  "%"   -- delineator between plugin names and straight text
  , alignSep = "}{"  -- separator between left-right alignment
  , template = " %StdinReader% }{ %battery%   %multicpu%   %disku%   %coretemp%   %memory%   %dynnetwork%   %RJTT%   %date% "

  -- general behavior
  , lowerOnStart =     True    -- send to bottom of window stack on start
  , hideOnStart =      False   -- start with window unmapped (hidden)
  , allDesktops =      True    -- show on all desktops
  , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
  , pickBroadest =     False   -- choose widest display (multi-monitor)
  , persistent =       True    -- enable/disable hiding (True = disabled)

  -- plugins
  --   Numbers can be automatically colored according to their value. xmobar
  --   decides color based on a three-tier/two-cutoff system, controlled by
  --   command options:
  --     --Low sets the low cutoff
  --     --High sets the high cutoff
  --
  --     --low sets the color below --Low cutoff
  --     --normal sets the color between --Low and --High cutoffs
  --     --High sets the color above --High cutoff
  --
  --   The --template option controls how the plugin is displayed. Text
  --   color can be set by enclosing in <fc></fc> tags. For more details
  --   see http://projects.haskell.org/xmobar/#system-monitor-plugins.
  , commands = 
      [ Run StdinReader

      -- weather monitor
      , Run Weather "RJTT" [ "--template", "<fc=#4682B4><tempC></fc>°C <fc=#4682B4><rh></fc>%"
                           ] 36000

      -- network activity monitor (dynamic interface resolution)
      , Run DynNetwork     [ "--template" , " <tx> kB/s  <rx> kB/s (<fc=#4682B4><dev></fc>)"
                           , "--Low"      , "1000"       -- units: kB/s
                           , "--High"     , "5000"       -- units: kB/s
                           , "--low"      , "#00a000"
                           , "--normal"   , "orange"
                           , "--high"     , "red"
                           ] 10

      -- cpu activity monitor
      , Run MultiCpu       [ "--template" , " <total0>% <total1>%"
                           , "--Low"      , "50"         -- units: %
                           , "--High"     , "85"         -- units: %
                           , "--low"      , "#00a000"
                           , "--normal"   , "orange"
                           , "--high"     , "red"
                           ] 10

      -- disk usage monitor
      , Run DiskU          [("/", " <used>"),  ("/mnt/iomega", " <used>")]
                           [ "-L", "20", "-H", "50", "-m", "1", "-p", "3"
                           , "--normal", "#a0a0a0", "--high", "#a0522d"
                           , "--low", "#4f8f9f"
                           ] 20

      -- cpu core temperature monitor
      , Run CoreTemp       [ "--template" , " <core0>°C <core1>°C"
                           , "--Low"      , "70"        -- units: °C
                           , "--High"     , "80"        -- units: °C
                           , "--low"      , "#00a000"
                           , "--normal"   , "orange"
                           , "--high"     , "red"
                           ] 50

      -- memory usage monitor
      , Run Memory         [ "--template" ," <usedratio>%"
                           , "--Low"      , "20"        -- units: %
                           , "--High"     , "90"        -- units: %
                           , "--low"      , "#00a000"
                           , "--normal"   , "orange"
                           , "--high"     , "red"
                           ] 10

      -- battery monitor
      , Run Battery        [ "--template" , " <acstatus>"
                           , "--Low"      , "10"        -- units: %
                           , "--High"     , "80"        -- units: %
                           , "--low"      , "red"
                           , "--normal"   , "orange"
                           , "--high"     , "#00a000"

                           , "--" -- battery specific options
                                     -- discharging status
                                     , "-o"	, "<left>% (<timeleft>)"
                                     -- AC "on" status
                                     , "-O"	, "<fc=#dAA520>Charging</fc>"
                                     -- charged status
                                     , "-i"	, "<fc=#00a000>Charged</fc>"
                           ] 50

      -- time and date indicator 
      --   (%F = y-m-d date, %a = day of week, %T = h:m:s time)
      , Run Date           "<fc=#ABABAB>%F (%a) %T</fc>" "date" 10

      -- keyboard layout indicator
      , Run Kbd            [ ("us(dvorak)" , "<fc=#00008B>DV</fc>")
                           , ("us"         , "<fc=#8B0000>US</fc>")
                           ]
      ]
    }
  }
