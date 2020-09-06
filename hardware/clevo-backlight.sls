clevo-backlight:
  file.line:
    - name: /etc/default/grub
    - content: GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_osi=! acpi_osi=Linux"
    - match: GRUB_CMDLINE_LINUX_DEFAULT.*
    - mode: replace
  cmd.run:
    - name: update-grub
    - onchanges:
      - file: clevo-backlight
