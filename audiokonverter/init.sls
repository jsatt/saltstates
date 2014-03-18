audiokonverter_dependencies:
    pkg.installed:
        - names:
            - lame
            - faac
            - faad
            - mplayer
            - vorbis-tools
            - flac
            - ffmpeg
            - libid3-tools
            - id3v2

/usr/share/kde4/services/ServiceMenus/audioconvert4.desktop:
    file.managed:
        - source: salt://audiokonverter/audioconvert4.desktop
        - mode: 644

/usr/share/apps/d3lphin/servicemenus/audioconvert4.desktop:
    file.managed:
        - source: salt://audiokonverter/audioconvert4.desktop
        - mode: 644

/usr/share/kde4/services/ServiceMenus/audiofrommovie4.desktop:
    file.managed:
        - source: salt://audiokonverter/audiofrommovie4.desktop
        - mode: 644

/usr/share/apps/d3lphin/servicemenus/audiofrommovie4.desktop:
    file.managed:
        - source: salt://audiokonverter/audiofrommovie4.desktop
        - mode: 644

/usr/bin/anytowav4:
    file.managed:
        - source: salt://audiokonverter/anytowav4
        - mode: 755

/usr/bin/audioconvert4:
    file.managed:
        - source: salt://audiokonverter/audioconvert4
        - mode: 755

/usr/bin/movie2sound4:
    file.managed:
        - source: salt://audiokonverter/movie2sound4
        - mode: 755

# vim:set ft=yaml:
