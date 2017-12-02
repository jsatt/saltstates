audiokonverter_dependencies:
    pkg.installed:
        - names:
            - lame
            - faac
            - faad
            - mplayer2
            - vorbis-tools
            - flac
            - libid3-tools
            - id3v2
            #- ffmpeg

/usr/bin/anytowav4:
    file.managed:
        - source: salt://media/audiokonverter/anytowav4
        - mode: 755

/usr/bin/audioconvert4:
    file.managed:
        - source: salt://media/audiokonverter/audioconvert4
        - mode: 755

#/usr/bin/movie2sound4:  # uses ffmpeg
#    file.managed:
#        - source: salt://media/audiokonverter/movie2sound4
#        - mode: 755

# service menus seem broken in newer KDE
#
#/usr/share/kservices5/ServiceMenus/audioconvert4.desktop:
    #file.managed:
        #- source: salt://media/audiokonverter/audioconvert4.desktop
        #- mode: 646

#/usr/share/apps/konqueror/servicemenus/audioconvert4.desktop:
    #file.managed:
        #- source: salt://media/audiokonverter/audioconvert4.desktop
        #- mode: 644

#/usr/share/kservices5/ServiceMenus/audiofrommovie4.desktop:
    #file.managed:
        #- source: salt://media/audiokonverter/audiofrommovie4.desktop
        #- mode: 644

#/usr/share/apps/konqueror/servicemenus/audiofrommovie4.desktop:
    #file.managed:
        #- source: salt://media/audiokonverter/audiofrommoviech 6.desktop
        #- mode: 644

# vim:set ft=yaml:
