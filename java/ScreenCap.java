import java.util.*;
import java.io.*;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;


class ScreenCap {
	public void captureScreen(String fileName) throws Exception {
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		Rectangle screenRectangle = new Rectangle(screenSize);
		Robot robot = new Robot();
		BufferedImage image = robot.createScreenCapture(screenRectangle);
		String fileTypeAndExtension = "jpg";
		ImageIO.write(image, fileTypeAndExtension, new File(fileName + "." + fileTypeAndExtension));
	}

	public static void main (String[] args) {
		ScreenCap sc = new ScreenCap();

		try {
			sc.captureScreen("java-screenshot");
		} catch (Exception e){
			System.out.println("Error: ");
			System.out.println(e.getMessage());
		}
	}
}
