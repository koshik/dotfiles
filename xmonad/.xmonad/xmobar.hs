Config {
  lowerOnStart = True,
  overrideRedirect = False,
  border = BottomB,
  borderColor = "#111111",
  position = Top,
  font = "xft:10x20:pixelsize=14",
  commands = [
    Run Wireless "wlp2s0" ["-t", "<essid>: <quality>%", "-H", "200", "-L", "10", "-h", "#FFB6B0", "-l", "#CEFFAC", "-n", "#FFFFCC"] 50,
    Run Date "%a %b %_d %H:%M" "date" 50,
    Run Battery ["-t", "Batt: <left>%"] 100,
    Run MultiCpu ["-t", "Cpu:<total>%", "-L", "30", "-H", "60", "-h", "#FFB6B0", "-l", "#CEFFAC", "-n", "FFFFCC", "-w", "3"] 100,
    Run Memory ["-t", "Mem: <usedratio>%"] 10,
    Run Swap ["-t","Swap: <usedratio>%"] 10
  ],
  sepChar = "%",
  alignSep = "}{",
  template = " }{ %wlp2s0wi% | %memory% | %swap% | %multicpu% | %battery% | <fc=#000099>%date%</fc>"
}
