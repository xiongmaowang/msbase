package com.ms.base.util;


import org.codehaus.groovy.grails.web.context.ServletContextHolder;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;
import java.util.zip.Adler32;
import java.util.zip.CheckedOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * @author rosten
 * @version 20080910
 * 
 *          工具类
 */
public final class Util {
	
	//判断是否手机客户端
	public static boolean IsMobile(String requestHeader) {
        boolean isMoblie = false;
        String[] mobileAgents = { "iphone", "android", "phone", "mobile", "wap", "netfront", "java", "opera mobi",
                "opera mini", "ucweb", "windows ce", "symbian", "series", "webos", "sony", "blackberry", "dopod",
                "nokia", "samsung", "palmsource", "xda", "pieplus", "meizu", "midp", "cldc", "motorola", "foma",
                "docomo", "up.browser", "up.link", "blazer", "helio", "hosin", "huawei", "novarra", "coolpad", "webos",
                "techfaith", "palmsource", "alcatel", "amoi", "ktouch", "nexian", "ericsson", "philips", "sagem",
                "wellcom", "bunjalloo", "maui", "smartphone", "iemobile", "spice", "bird", "zte-", "longcos",
                "pantech", "gionee", "portalmmm", "jig browser", "hiptop", "benq", "haier", "^lct", "320x320",
                "240x320", "176x220", "w3c ", "acs-", "alav", "alca", "amoi", "audi", "avan", "benq", "bird", "blac",
                "blaz", "brew", "cell", "cldc", "cmd-", "dang", "doco", "eric", "hipt", "inno", "ipaq", "java", "jigs",
                "kddi", "keji", "leno", "lg-c", "lg-d", "lg-g", "lge-", "maui", "maxo", "midp", "mits", "mmef", "mobi",
                "mot-", "moto", "mwbp", "nec-", "newt", "noki", "oper", "palm", "pana", "pant", "phil", "play", "port",
                "prox", "qwap", "sage", "sams", "sany", "sch-", "sec-", "send", "seri", "sgh-", "shar", "sie-", "siem",
                "smal", "smar", "sony", "sph-", "symb", "t-mo", "teli", "tim-", "tosh", "tsm-", "upg1", "upsi", "vk-v",
                "voda", "wap-", "wapa", "wapi", "wapp", "wapr", "webc", "winw", "winw", "xda", "xda-",
                "Googlebot-Mobile" };
        if (requestHeader != null) {
            for (String mobileAgent : mobileAgents) {
                if (requestHeader.toLowerCase().indexOf(mobileAgent) >= 0) {
                    isMoblie = true;
                    break;
                }
            }
        }
        return isMoblie;
        
    }
	// 过滤特殊字符
	public static String StringFilter(String str) throws PatternSyntaxException {
		if (str != null) {
			String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
			Pattern p = Pattern.compile(regEx);
			Matcher m = p.matcher(str);
			return m.replaceAll("").trim();
		} else
			return null;
	}

	/**
	 * @param len
	 *            需要显示的长度注意：长度是以byte为单位的，一个汉字是2个byte</font>)
	 * @param symbol
	 *            用于表示省略的信息的字符，如 “...”,“>>>”等。
	 * @return 返回处理后的字符串
	 */
	public static String getLimitLengthString(String oString, int len,
			String symbol) throws UnsupportedEncodingException {
		int counterOfDoubleByte = 0;
		byte b[];

		b = oString.getBytes("GBK");
		if (b.length <= len)
			return oString;
		for (int i = 0; i < len; i++) {
			if (b[i] < 0)
				counterOfDoubleByte++;
		}

		if (counterOfDoubleByte % 2 == 0)
			return new String(b, 0, len, "GBK") + symbol;
		else
			return new String(b, 0, len - 1, "GBK") + symbol;
	}

	@SuppressWarnings("deprecation")
	public static int getMonthByString(Timestamp dateTime) {
		int result = 0;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String dateTimeStr = df.format(dateTime);
		try {
			java.util.Date d1 = df.parse(dateTimeStr);
			result = d1.getMonth();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("deprecation")
	public static int getMonthByString(String dateStr) {
		int result = 0;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		try {
			java.util.Date d1 = df.parse(dateStr);
			result = d1.getMonth();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static int getBetweenDayNumber(String dateA, String dateB) {
		long dayNumber = 0;
		long DAY = 24L * 60L * 60L * 1000L;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date d1 = df.parse(dateA);
			java.util.Date d2 = df.parse(dateB);
			dayNumber = (d2.getTime() - d1.getTime()) / DAY;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (int) dayNumber;
	}

	public static double DoubleToFormat(double dealNum, int index) {

		BigDecimal bd = new BigDecimal(dealNum);
		bd = bd.setScale(index, BigDecimal.ROUND_HALF_UP);
		double d = bd.doubleValue();

		return d;
	}

	public static float numberToFormat(float dealNum, int index) {

		BigDecimal bd = new BigDecimal(dealNum);
		bd = bd.setScale(index, BigDecimal.ROUND_HALF_UP);
		float d = bd.floatValue();

		return d;
	}

	public static Timestamp convertToTimestamp(String str) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp tsmp = null;

		try {
			tsmp = new Timestamp(format.parse(str).getTime());
			return tsmp;
		} catch (ParseException e) {
			format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				tsmp = new Timestamp(format.parse(str).getTime());
				return tsmp;
			} catch (ParseException e1) {
				return tsmp;
			}

		}
	}

	public static boolean strInArray1(String str, List list) {
		boolean index = false;

		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				String obj = (String) list.get(i);
				if (obj.equals(str)) {
					index = true;
					break;
				}
			}
		}
		return index;
	}

	public static boolean strInArray(String str, List list) {
		boolean index = false;

		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				Object[] obj = (Object[]) list.get(i);
				if (obj[0].toString().equals(str)) {
					index = true;
					break;
				}
			}
		}
		return index;
	}

	public static boolean numInArray(float num, float num1, float num2) {
		DecimalFormat format = new DecimalFormat(".00");

		num = Util.obj2Float(format.format(num));
		num1 = Util.obj2Float(format.format(num1));
		num2 = Util.obj2Float(format.format(num2));

		if (num >= num1 && num <= num2) {
			return true;
		} else {
			return false;
		}
	}

	public static int obj2int(Object n) {// Object转整型
		if (null == n)
			return 0;
		else
			return Integer.valueOf(n.toString()).intValue();
	}

	public static float obj2Float(Object n) {// Object转float型
		if (null == n)
			return 0;
		else
			return Float.valueOf(n.toString()).floatValue();

	}

	public static long obj2Long(Object n) {// Object转long型
		if (null == n)
			return 0;
		else
			return Long.valueOf(n.toString()).longValue();

	}

	public static double obj2Double(Object n) {// Object转float型
		if (null == n)
			return 0;
		else
			return Double.valueOf(n.toString()).doubleValue();

	}

	public static int str2int(String n) {// 字符串转整型
		if (n == null || n.trim().length() <= 0)
			return 0;
		else
			return Integer.valueOf(n).intValue();
	}

	public static String sqlCheck(String str) {// 过滤特殊字符，防SQL注入
		str = obj2str(str);
		str = str.replaceAll("'", "");
		str = str.replaceAll(" ", "");
		str = str.replaceAll("%", "");
		return str;
	}

	public static String obj2str(Object str) {// Object转字符串，null转空字符串
		if (null == str)
			return "";
		return str.toString();
	}

	public static String strToGBK(String source) {// 中文问题处理，转换GBK码
		String strTarget = obj2str(source);
		if (source != null) {
			try {
				byte[] temp1 = source.getBytes("GBK");
				if (source.equals(new String(temp1)))
					strTarget = source;
				else
					strTarget = new String(source.getBytes("iso-8859-1"), "GBK");
			} catch (Exception e) {
			}
		}
		return strTarget;
	}

	public static String strToUtf8(String source) {// 中文问题处理，转换utf8码
		String strTarget = obj2str(source);
		if (source != null) {
			try {
				byte[] temp1 = source.getBytes("utf-8");
				if (source.equals(new String(temp1)))
					strTarget = source;
				else
					strTarget = new String(source.getBytes("iso-8859-1"),
							"utf-8");
			} catch (Exception e) {
			}
		}
		return strTarget;
	}

	public static String strLeft(String oStr, String splitStr) {
		int index = oStr.indexOf(splitStr);
		if (index != -1) {
			return oStr.substring(0, index);
		} else {
			return oStr;
		}
	}

	public static String strRight(String oStr, String splitStr) {
		int index = oStr.indexOf(splitStr);
		if (index != -1) {
			return oStr.substring(index + 1);
		} else {
			return oStr;
		}
	}

	/**
	 * <br>
	 * 方法说明：实现文件的压缩处理 <br>
	 * 输入参数：String fileName 压缩的文件 <br>
	 * 返回类型：
	 */
	public static void ZipFiles(String fileName) {
		try {
			FileOutputStream f = new FileOutputStream(fileName + ".zip");
			// 使用输出流检查
			CheckedOutputStream cs = new CheckedOutputStream(f, new Adler32());
			// 声明输出zip流
			ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(
					cs));
			// 写一个注释
			out.setComment("Upload Zipping");
			// 对多文件进行压缩
			BufferedReader in = new BufferedReader(new InputStreamReader(
					new FileInputStream(fileName), "ISO8859_1"));
			out.putNextEntry(new ZipEntry(fileName));
			int c;
			while ((c = in.read()) != -1)
				out.write(c);
			in.close();
			// 关闭输出流
			out.close();
		} catch (Exception e) {
			System.err.println(e);
		}
	}

	/*
	 * 获取客户端登录的ip地址
	 */

	public static String getIpAddress(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	// jdk6以后提供的官方方法
	public static String getMacAddress() {
		String macString = "";
		try {
			InetAddress address = InetAddress.getLocalHost();

			/*
			 * Get NetworkInterface for the current host and then read the
			 * hardware address.
			 */
			NetworkInterface ni = NetworkInterface.getByInetAddress(address);
			byte[] mac = ni.getHardwareAddress();

			/*
			 * Extract each array of mac address and convert it to hexa with the
			 * following format 08-00-27-DC-4A-9E.
			 */

			for (int i = 0; i < mac.length; i++) {
				macString += String.format("%02X%s", mac[i],
						(i < mac.length - 1) ? "-" : "");

			}
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (SocketException e) {
			e.printStackTrace();
		}

		return macString;
	}

	/**
	 * 获取windows网卡的mac地址. 此方法只适用windows
	 * 
	 * @return mac地址
	 */
	public static String getWindowsMACAddress() {
		String mac = null;
		BufferedReader bufferedReader = null;
		Process process = null;
		try {
			process = Runtime.getRuntime().exec("ipconfig /all");// windows下的命令，显示信息中包含有mac地址信息
			bufferedReader = new BufferedReader(new InputStreamReader(
					process.getInputStream()));
			String line = null;
			int index = -1;
			while ((line = bufferedReader.readLine()) != null) {
				index = line.toLowerCase().indexOf("physical address");// 寻找标示字符串[physical
				// address]
				if (index >= 0) {// 找到了
					index = line.indexOf(":");// 寻找":"的位置
					if (index >= 0) {
						mac = line.substring(index + 1).trim();// 取出mac地址并去除2边空格
					}
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bufferedReader != null) {
					bufferedReader.close();
				}
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			bufferedReader = null;
			process = null;
		}

		return mac;
	}
}
