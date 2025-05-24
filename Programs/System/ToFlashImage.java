import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

public class ToVerilogHex {
	public static void main(String[] args) {
		try {
			if(args.length < 2) {
				System.out.println("ToFlashImage [infile] [outfile]");
				System.exit(1);
			}
			int limit = 4 * 1024 * 1024;
			byte[] image = new byte[limit];
			FileChannelInputStream fis = new FileChannelInputStream(new File(args[0]));
			fis.read(image);
			fis.close();
			//This is for use with the spiflash, which is logically split into 8-bit bytes. Best way to use it here is to split it into 32-bit words of which only 26 bits are used.
			FileChannelOutputStream fos = new FileChannelOutputStream(new File("spiflash.bin"));
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileChannelOutputStream(new File(args[1]))));
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

public class FileChannelOutputStream extends OutputStream {
	
	private FileChannel chan;
	private ByteBuffer b;
	private byte[] buffer;
	private int pos = 0;
	private FileOutputStream fos;
	
	public FileChannelOutputStream(File f) throws IOException {
		fos = new FileOutputStream(f);
		this.chan = fos.getChannel();
		this.b = ByteBuffer.allocate(1024 * 1024 * 4);
		this.buffer = new byte[1024 * 1024 * 4];
	}
	
	@Override
	public void write(int b) throws IOException {
		buffer[pos] = (byte)b;
		pos++;
		if(pos >= buffer.length) {
			flush();
		}
	}
	
	@Override
	public void close() throws IOException {
		flush();
		chan.close();
		fos.close();
	}
	
	@Override
	public void flush() throws IOException {
		this.b.put(buffer, 0, pos);
		pos = 0;
		this.b.flip();
		chan.write(this.b);
		this.b.clear();
	}
	
}

public class FileChannelInputStream extends InputStream {
	
	private ByteBuffer b;
	private FileChannel chann;
	private byte[] buffer; //ByteBuffer functions have a large overhead, so it's a better Idea to copy the ByteBuffer's contents into a byte array
	private int pos;
	private FileInputStream fis;
	
	public FileChannelInputStream(File f) throws IOException {
		fis = new FileInputStream(f);
		this.chann = fis.getChannel();
		this.b = ByteBuffer.allocate(1024 * 1024 * 4);
		chann.read(b);
		b.flip();
		this.buffer = new byte[b.limit()];
		b.get(buffer, 0, b.limit());
		this.pos = 0;
	}
	
	@Override
	public int read() throws IOException {
		if(pos >= buffer.length) {
			if(available() <= 0) return -1;
			b.clear();
			chann.read(b);
			b.flip();
			if(buffer.length != b.limit()) buffer = new byte[b.limit()];
			b.get(buffer);
			pos = 0;
		}
		byte a = buffer[pos];
		pos++;
		return a & 0xFF;
	}
	
	@Override
	public void close() throws IOException {
		b.clear();
		chann.close();
		fis.close();
	}
	
	@Override
	public long skip(long s) throws IOException {
		for(long i = 0; i < s; i++) {
			if(available() <= 0) return i;
			read();
		}
		return s;
	}
	
	@Override
	public int available() throws IOException {
		if(chann.size() - chann.position() <= 0 && pos < buffer.length) {
			return buffer.length - pos;
		}
		return (int) ((chann.size() - chann.position()) > Integer.MAX_VALUE ? Integer.MAX_VALUE : (chann.size() - chann.position()));
	}
	
}
