import java.io.*;

public class ToBin {
	private ToBin() {}
	
	public static void main(String[] args) {
		try {
			FileInputStream fis = new FileInputStream(new File(args[0]));
			FileOutputStream fosLo = new FileOutputStream(new File("low.bin"));
			FileOutputStream fosHi = new FileOutputStream(new File("high.bin"));
			int[] image = new int[4096];
			for(int i = 0; i < 2048; i++) {
				if(fis.available() > 0) image[i + i] = fis.read() & 0xFF;
				else image[i + i] = 0xFF;
				if(fis.available() > 0) image[i + i + 1] = fis.read() & 0xFF;
				else image[i + i + 1] = 0xFF;
				fis.skip(2);
			}
			fis.close();
			for(int i = 0; i < 2048; i++) {
				fosLo.write(image[i + i]);
				fosHi.write(image[i + i + 1]);
			}
			fosLo.close();
			fosHi.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
	}
}
