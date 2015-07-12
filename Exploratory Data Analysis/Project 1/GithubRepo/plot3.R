#for plot 3
with(power_com, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(power_com, lines(DateTime, Sub_metering_1))
with(power_com, lines(DateTime, Sub_metering_2, col = "red"))
with(power_com, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = names(power_com)[6:8])
dev.copy(png, file = "plot3.png")
dev.off()