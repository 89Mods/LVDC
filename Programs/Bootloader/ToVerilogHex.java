import java.io.*;

public class ToVerilogHex {
	public static void main(String[] args) {
		try {
			if(args.length < 2) {
				System.out.println("ToVerilogHex [infile] [outfile]");
				System.exit(1);
			}
			int limit = 8192;
			byte[] image = new byte[limit];
			FileInputStream fis = new FileInputStream(new File(args[0]));
			fis.read(image);
			fis.close();
			//This is for use with the 4K boot-ROM, so chop of everything above the first 16 bits
			BufferedWriter bw = new BufferedWriter(new FileWriter(new File(args[1] + "_lo.txt")));
			for(int i = 0; i < image.length; i+=4) {
				bw.write(String.format("%02x ", image[i]));
				bw.newLine();
			}
			bw.close();
			bw = new BufferedWriter(new FileWriter(new File(args[1] + "_hi.txt")));
			for(int i = 1; i < image.length; i+=4) {
				bw.write(String.format("%02x ", image[i]));
				bw.newLine();
			}
			bw.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
	}
}
