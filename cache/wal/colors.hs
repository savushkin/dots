--Place this file in your .xmonad/lib directory and import module Colors into .xmonad/xmonad.hs config
--The easy way is to create a soft link from this file to the file in .xmonad/lib using ln -s
--Then recompile and restart xmonad.

module Colors
    ( wallpaper
    , background, foreground, cursor
    , color0, color1, color2, color3, color4, color5, color6, color7
    , color8, color9, color10, color11, color12, color13, color14, color15
    ) where

-- Shell variables
-- Generated by 'wal'
wallpaper="/home/ivan/.config/background.jpg"

-- Special
background="#101110"
foreground="#9baebd"
cursor="#9baebd"

-- Colors
color0="#101110"
color1="#AB4337"
color2="#E8582C"
color3="#9C4F54"
color4="#D64F45"
color5="#C08861"
color6="#3C6A8B"
color7="#9baebd"
color8="#6c7984"
color9="#AB4337"
color10="#E8582C"
color11="#9C4F54"
color12="#D64F45"
color13="#C08861"
color14="#3C6A8B"
color15="#9baebd"
