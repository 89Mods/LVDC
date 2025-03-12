import java.io.*;

public class ToVerilogHex {
	public static void main(String[] args) {
		try {
			if(args.length < 2) {
				System.out.println("ToFlashImage [infile] [outfile]");
				System.exit(1);
			}
			int limit = 128 * 1024;
			byte[] image = new byte[limit];
			FileInputStream fis = new FileInputStream(new File(args[0]));
			fis.read(image);
			fis.close();
			//This is for use with the spiflash, which is logically split into 8-bit bytes. Best way to use it here is to split it into 32-bit words of which only 26 bits are used.
			FileOutputStream fos = new FileOutputStream(new File("spiflash.bin"));
			BufferedWriter bw = new BufferedWriter(new FileWriter(new File(args[1])));
			for(int i = 0; i < image.length; i+=4) {
				bw.write(String.format("%02x ", image[i+3]));
				bw.write(String.format("%02x ", image[i+2]));
				bw.write(String.format("%02x ", image[i+1]));
				bw.write(String.format("%02x", image[i+0]));
				bw.newLine();
				fos.write(image[i+3]);
				fos.write(image[i+2]);
				fos.write(image[i+1]);
				fos.write(image[i+0]);
			}
			fos.close();
			bw.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
	}
}
