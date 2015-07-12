#for plot 2
with(power_com, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n"))
with(power_com, lines(DateTime, Global_active_power))
dev.copy(png, file = "plot2.png")
dev.off()