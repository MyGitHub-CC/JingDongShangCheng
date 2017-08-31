package entity;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CreateMD5 {

	public static String getMd5(String plainText) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			plainText = plainText + "你好";
			md.update(plainText.getBytes());
			byte b[] = md.digest();
			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			return buf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}

//	public static void main(String[] args) {
//		String s = CreateMD5.getMd5("a");
//		String ss = CreateMD5.getMd5("a");
//
//		System.out.println(s);
//		System.out.println(ss);
//	}
}