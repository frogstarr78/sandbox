import java.awt.Font;
import java.awt.GraphicsEnvironment;

class ListFonts {

	public static void main(String[] args) throws Exception {

		if ( args.length > 0 && args[0].equals("-n") ) {
			GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
			String fonts[] = ge.getAvailableFontFamilyNames();

			System.out.println("Font Family names: ...");
			for (int i = 0; i < fonts.length; i++) {
				System.out.println(fonts[i]);
			}
		} else {
			GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
			Font[] fonts = ge.getAllFonts();

			System.out.println("Fonts FontName, family, name: ...");
			for (int i = 0; i < fonts.length; i++) {
				System.out.print(fonts[i].getFontName() + ", ");
				System.out.print(fonts[i].getFamily() + ", ");
				System.out.print(fonts[i].getName());
				System.out.println();
			}
		}
	}
}
