package common.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.lang.management.ManagementFactory;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.InetAddress;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.Normalizer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import javax.management.MBeanServer;
import javax.management.ObjectName;
import javax.management.Query;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXB;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

//import org.apache.any23.encoding.TikaEncodingDetector;
//import org.apache.commons.codec.binary.Base64;
//import org.apache.commons.lang3.math.NumberUtils;
//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

//import vn.com.cmc.entity.RpSum;

public class Utils {

	private static final String PHONE_PATTERN = "^[0-9]*$";
	static private String strKey = "iexsbccs";
	static private String algorithm = "DES";
//	private static final Logger logger = LogManager.getLogger(Utils.class);

	private static final SimpleDateFormat sdf = new SimpleDateFormat("MMddhhmmss");

	private static final String SPECIAL = "^[A-Za-z0-9]*$";

	public static Document loadXMLFromString(String xml) throws Exception {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		InputSource is = new InputSource(new StringReader(xml));
		return builder.parse(is);
	}

	public static String getCharacterDataFromElement(Element eElement, String tagName) {
		NodeList name = eElement.getElementsByTagName(tagName);
		Element element2 = (Element) name.item(0);
		Node child = element2.getFirstChild();
		if (child instanceof org.w3c.dom.CharacterData) {
			org.w3c.dom.CharacterData cd = (org.w3c.dom.CharacterData) child;

			return cd.getData();
		}
		return "";
	}

	public static boolean isRowEmpty(String[] obj) {
		int length = obj.length;
		for (int i = 0; i < length; i++) {
			if (!Utils.isNullOrEmpty(obj[i])) {
				return false;
			}
		}
		return true;
	}

//	public static Date getReportDate(String fileName) throws ParseException {
//		return new RpSum(fileName).getReportDate();
//
//	}
//
//	public static String getNumber(String input) {
//		String tmp = input.replaceAll(",", "");
//		return NumberUtils.isNumber(tmp) ? tmp : input;
//
//	}
//
//	public static void base64ToFile(String content, String filePath) throws IOException {
//		byte[] data = Base64.decodeBase64(content);
//		InputStream is = new ByteArrayInputStream(data);
//		OutputStream os = new FileOutputStream(filePath);
//		byte[] buff = new byte[10 * 1024];
//		int len = 0;
//		while ((len = is.read(buff)) > 0)
//			os.write(buff, 0, len);
//		is.close();
//		os.close();
//	}
//
//	public static String base64ToFileAndCheckEncode(String content, String filePath) throws IOException {
//		String encode = "";
//		byte[] data = Base64.decodeBase64(content);
//		InputStream is = new ByteArrayInputStream(data);
//		encode = Charset.forName(new TikaEncodingDetector().guessEncoding(is)).toString();
//		is = new ByteArrayInputStream(data);
//		OutputStream os = new FileOutputStream(filePath);
//		byte[] buff = new byte[10 * 1024];
//		int len = 0;
//		while ((len = is.read(buff)) > 0)
//			os.write(buff, 0, len);
//		is.close();
//		os.close();
//		return encode;
//	}

	/**
	 * Check qua max length
	 * 
	 * @param input
	 * @param length
	 * @return
	 */
	public static boolean checkMaxlength(String input, int length) {
		if (Utils.isNullOrEmpty(input)) {
			return true;
		}
		try {
			if (input.length() > length) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * Check qua max length
	 * 
	 * @param input
	 * @param length
	 * @return
	 */
	public static boolean checkMaxlengthUnicode(String input, int length) {
		if (Utils.isNullOrEmpty(input)) {
			return true;
		}
		try {
			if (input.getBytes("UTF-8").length > length) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	// mac dinh string da duoc check null or empty
	public static boolean checkMinlength(String input, int length) {
		if (Utils.isNullOrEmpty(input)) {
			return true;
		}
		try {
			if (input.trim().getBytes("UTF-8").length < length) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@SuppressWarnings("unchecked")
	public static <T> T cloneBean(T source) {
		try {
			if (source == null) {
				return null;
			}
			T dto = (T) source.getClass().getConstructor().newInstance();
			BeanUtils.copyProperties(source, dto);
			return dto;
		} catch (Exception e) {
			return null;
		}
	}

	public static String lPad(String input, String replace, int length) {
		String format = "%" + length + "s";
		return String.format(format, input).replace(" ", replace);
	}

	public static String rPad(String input, String replace, int length) {
		return String.format("%1$-" + length + "s", input).replace(" ", replace);
	}

	public static String toString(Object obj) {
		return isNullObject(obj) ? "" : obj.toString();
	}

	public static String createFolder() {
		Calendar calendar = Calendar.getInstance();
		String savePath = calendar.get(Calendar.YEAR) + "/" + String.format("%02d", (calendar.get(Calendar.MONTH) + 1))
				+ "/" + calendar.get(Calendar.DAY_OF_MONTH);
		return savePath;
	}

	public static String createFolderk() {
		Calendar calendar = Calendar.getInstance();
		String savePath = calendar.get(Calendar.YEAR) + "/" + String.format("%02d", (calendar.get(Calendar.MONTH) + 1))
				+ "/" + calendar.get(Calendar.DAY_OF_MONTH) + "/" + calendar.get(Calendar.HOUR_OF_DAY) + "/"
				+ calendar.get(Calendar.MINUTE) + "/" + calendar.get(Calendar.SECOND) + "/"
				+ calendar.get(Calendar.MILLISECOND);
		return savePath;
	}

	public static void trimObject(Object model) {
		if (isNullObject(model)) {
			return;
		}
		for (Field field : model.getClass().getDeclaredFields()) {
			try {
				field.setAccessible(true);
				Object value = field.get(model);
				if (value != null) {
					if (value instanceof String) {
						String trimmed = (String) value;
						field.set(model, trimmed.trim());
					}

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static String replaceSpecialString(String str) {
		if (Utils.isNullOrEmpty(str)) {
			return "";
		}
		try {
			String temp = Normalizer.normalize(str, Normalizer.Form.NFD);
			Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
			String rs = pattern.matcher(temp).replaceAll("").replaceAll(" ", " ").replaceAll("đ", "d")
					.replaceAll("�?", "D").replaceAll("[^\\p{Alpha}\\p{Digit}]+", " ");
			return rs;
		} catch (Exception e) {
		}
		return "";
	}

	public static String addZeroToString(String input, int strLength) {
		String result = input;
		for (int i = 1; i <= strLength - input.length(); i++) {
			result = "0" + result;
		}
		return result;
	}

	public static List<String> splitListFile(String strFiles) {
		List<String> lstFile = new ArrayList<String>();
		if (!isNullOrEmpty(strFiles)) {
			String lst[] = strFiles.split(";");
			lstFile = Arrays.asList(lst);
		}
		return lstFile;
	}

	public static List<String> splitListFile(String strFiles, String seperator) {
		List<String> lstFile = new ArrayList<String>();
		if (!isNullOrEmpty(strFiles)) {
			String lst[] = strFiles.split(seperator, -1);
			lstFile = new ArrayList<String>(Arrays.asList(lst));
			if (seperator.indexOf("[") != -1) {
				seperator = seperator.replace("[", "");
			}
			if (seperator.indexOf("]") != -1) {
				seperator = seperator.replace("]", "");
			}
			if (strFiles.endsWith(seperator)) {
				// VD: strFiles = A|B|C| ; seperator = | thi remove ban ghi cuoi cung cua list
				// nguyen nhan do co 1 ban ghi gia tri "" dc split cuoi cung
				lstFile.remove(lstFile.size() - 1);
			}
		}
		return lstFile;
	}

	/**
	 * forward page
	 *
	 * @return
	 * @author ThanhNT
	 */
	public static String forwardPage(String pageName) {
		if (!Utils.isNullOrEmpty(pageName)) {
			return "pretty:" + pageName.trim();
		}
		return "";
	}

	/*
	 * Kiem tra Long bi null hoac zero
	 *
	 * @param value
	 * 
	 * @return
	 */
	public static boolean isNullOrZero(Long value) {
		return (value == null || value.equals(0L));
	}

	/*
	 * Kiem tra Long bi null hoac zero
	 *
	 * @param value
	 * 
	 * @return
	 */
	public static boolean isNullOrOneNavigate(Long value) {
		return (value == null || value.equals(-1L));
	}

	/**
	 * Kiem tra Bigdecimal bi null hoac zero
	 *
	 * @param value
	 * @return
	 */
	public static boolean isNullOrZero(BigDecimal value) {
		return (value == null || value.compareTo(BigDecimal.ZERO) == 0);
	}

	/**
	 * Lay ten phuong thuc getter
	 *
	 * @param columnName
	 * @return
	 */
	public static String getHibernateName(String columnName) {
		String temp = columnName.toLowerCase();
		String[] arrs = temp.split("_");
		String method = "";
		for (String arr : arrs) {
			method += Utils.upperFirstChar(arr);
		}
		return method;
	}

	/**
	 * Upper first character
	 *
	 * @param input
	 * @return
	 */
	public static String upperFirstChar(String input) {
		if (Utils.isNullOrEmpty(input)) {
			return input;
		}
		return input.substring(0, 1).toUpperCase() + input.substring(1);
	}

	/**
	 * Lower first characater
	 *
	 * @param input
	 * @return
	 */
	public static String lowerFirstChar(String input) {
		if (Utils.isNullOrEmpty(input)) {
			return input;
		}
		return input.substring(0, 1).toLowerCase() + input.substring(1);
	}

	public static String safeTrim(String obj) {
		if (obj == null)
			return null;
		return obj.trim();
	}

	public static Long safeToLong(Object obj1, Long defaultValue) {
		Long result = defaultValue;
		if (obj1 != null) {
			if (obj1 instanceof BigDecimal) {
				return ((BigDecimal) obj1).longValue();
			}
			if (obj1 instanceof BigInteger) {
				return ((BigInteger) obj1).longValue();
			}
			try {
				result = Long.parseLong(obj1.toString());
			} catch (Exception ignored) {
			}
		}

		return result;
	}

	/**
	 * @param obj1
	 *            Object
	 * @return Long
	 */
	public static Long safeToLong(Object obj1) {
		return safeToLong(obj1, 0L);
	}

	public static Double safeToDouble(Object obj1, Double defaultValue) {
		Double result = defaultValue;
		if (obj1 != null) {
			try {
				result = Double.parseDouble(obj1.toString());
			} catch (Exception ignored) {
			}
		}

		return result;
	}

	public static Double safeToDouble(Object obj1) {
		return safeToDouble(obj1, 0.0);
	}

	public static String customFormat(String pattern, double value) {
		DecimalFormat decimalFormat = new DecimalFormat(pattern);
		return decimalFormat.format(value);
	}

	public static Short safeToShort(Object obj1, Short defaultValue) {
		Short result = defaultValue;
		if (obj1 != null) {
			try {
				result = Short.parseShort(obj1.toString());
			} catch (Exception ignored) {
			}
		}

		return result;
	}

	public static Short safeToShort(Object obj1) {
		return safeToShort(obj1, (short) 0);
	}

	/**
	 * @param obj1
	 * @param defaultValue
	 * @return
	 * @author phuvk
	 */
	public static int safeToInt(Object obj1, int defaultValue) {
		int result = defaultValue;
		if (obj1 != null) {
			try {
				result = Integer.parseInt(obj1.toString());
			} catch (Exception ignored) {
			}
		}

		return result;
	}

	/**
	 * @param obj1
	 *            Object
	 * @return int
	 */
	public static int safeToInt(Object obj1) {
		return safeToInt(obj1, 0);
	}

	/**
	 * @param obj1
	 *            Object
	 * @return String
	 */
	public static String safeToString(Object obj1, String defaultValue) {
		if (obj1 == null) {
			return defaultValue;
		}

		return obj1.toString();
	}

	public static String safeToLower(String obj1) {
		if (obj1 == null) {
			return null;
		}

		return obj1.toLowerCase();
	}

	/**
	 * @param obj1
	 *            Object
	 * @return String
	 */
	public static String safeToString(Object obj1) {
		return safeToString(obj1, "");
	}

	/**
	 * safe equal
	 *
	 * @param obj1
	 *            Long
	 * @param obj2
	 *            Long
	 * @return boolean
	 */
	public static boolean safeEqual(Long obj1, Long obj2) {
		if (obj1 == obj2)
			return true;
		return ((obj1 != null) && (obj2 != null) && (obj1.compareTo(obj2) == 0));
	}

	/**
	 * safe equal
	 *
	 * @param obj1
	 *            Long
	 * @param obj2
	 *            Long
	 * @return boolean
	 */
	public static boolean safeEqual(BigInteger obj1, BigInteger obj2) {
		if (obj1 == obj2)
			return true;
		return (obj1 != null) && (obj2 != null) && obj1.equals(obj2);
	}

	/**
	 * @param obj1
	 * @param obj2
	 * @return
	 * @date 09-12-2015 17:43:20
	 * @author TuyenNT17
	 * @description
	 */
	public static boolean safeEqual(Short obj1, Short obj2) {
		if (obj1 == obj2)
			return true;
		return ((obj1 != null) && (obj2 != null) && (obj1.compareTo(obj2) == 0));
	}

	/**
	 * safe equal
	 *
	 * @param obj1
	 *            String
	 * @param obj2
	 *            String
	 * @return boolean
	 */
	public static boolean safeEqual(String obj1, String obj2) {
		if (obj1 == obj2)
			return true;
		return ((obj1 != null) && (obj2 != null) && obj1.equals(obj2));
	}

	/**
	 * check null or empty Su dung ma nguon cua thu vien StringUtils trong apache
	 * common lang
	 *
	 * @param cs
	 *            String
	 * @return boolean
	 */
	public static boolean isNullOrEmpty(CharSequence cs) {
		int strLen;
		if (cs == null || (strLen = cs.length()) == 0) {
			return true;
		}
		for (int i = 0; i < strLen; i++) {
			if (!Character.isWhitespace(cs.charAt(i))) {
				return false;
			}
		}
		return true;
	}

	public static boolean isNullOrEmpty(final Collection<?> collection) {
		return collection == null || collection.isEmpty();
	}

	public static boolean isNullOrEmpty(final Object[] collection) {
		return collection == null || collection.length == 0;
	}

	public static boolean isNullOrEmpty(final Map<?, ?> map) {
		return map == null || map.isEmpty();
	}

	/**
	 * Tra ve doi tuong default neu object la null, neu khong thi tra object
	 *
	 * @param object
	 * @param defaultValue
	 * @param <T>
	 * @return
	 */
	public static <T> T defaultIfNull(final T object, final T defaultValue) {
		return object != null ? object : defaultValue;
	}

	/**
	 * Ham nay mac du nhan tham so truyen vao la object nhung gan nhu chi hoat dong
	 * cho doi tuong la string Chuyen sang dung isNullOrEmpty thay the
	 *
	 * @param obj1
	 * @return
	 */
	@Deprecated
	public static boolean isStringNullOrEmpty(Object obj1) {
		return obj1 == null || obj1.toString().trim().equals("");
	}

	/**
	 * @param obj1
	 *            Object
	 * @return BigDecimal
	 */
	public static BigDecimal safeToBigDecimal(Object obj1) {
		BigDecimal result = BigDecimal.ZERO;
		if (obj1 == null) {
			return result;
		}
		try {
			result = new BigDecimal(obj1.toString());
		} catch (Exception ignored) {
		}

		return result;
	}

	public static BigInteger safeToBigInteger(Object obj1, BigInteger defaultValue) {
		BigInteger result = defaultValue;
		if (obj1 == null) {
			return result;
		}
		try {
			result = new BigInteger(obj1.toString());
		} catch (Exception ignored) {
		}

		return result;
	}

	public static BigInteger safeToBigInteger(Object obj1) {
		BigInteger result = BigInteger.ZERO;
		try {
			if (obj1 instanceof BigInteger) {
				result = (BigInteger) obj1;
			} else {
				result = new BigInteger(obj1.toString());
			}

		} catch (Exception ignored) {
		}

		return result;
	}

	/**
	 * add
	 *
	 * @param obj1
	 *            BigDecimal
	 * @param obj2
	 *            BigDecimal
	 * @return BigDecimal
	 */
	public static BigInteger add(BigInteger obj1, BigInteger obj2) {
		if (obj1 == null) {
			return obj2;
		} else if (obj2 == null) {
			return obj1;
		}

		return obj1.add(obj2);
	}

	/**
	 * @param number
	 * @param pattern
	 * @return
	 * @author KhuongDV Ham format so thuc ve dang co max la 4 chu so thap phan.
	 *         Trim() so 0 vo nghia
	 */
	public static String getFormattedString4Digits(String number, String pattern) {
		double amount = 0;
		try {
			amount = Double.parseDouble(number);
			DecimalFormat formatter = new DecimalFormat(pattern);
			return formatter.format(amount);
		} catch (Exception ex) {
			return number;
		}
	}

	public static Character safeToCharacter(Object value) {
		return safeToCharacter(value, '0');
	}

	public static Character safeToCharacter(Object value, Character defaulValue) {
		if (value == null)
			return defaulValue;
		return String.valueOf(value).charAt(0);
	}

	public static boolean isNullObject(Object obj1) {
		if (obj1 == null) {
			return true;
		}
		if (obj1 instanceof String) {
			return isNullOrEmpty(obj1.toString());
		}
		return false;
	}

	/**
	 * tinh gia tri that cua param ccua tong dai tra ve theo cong thuc =
	 * param/operator
	 *
	 * @param param
	 * @return
	 */
	public static String getProvisionParam(String param, int operator) {
		try {
			String result = "";
			if (isNullOrEmpty(param)) {
				return "";
			}
			Long lmoney = Long.parseLong(param);
			lmoney = lmoney / operator;

			result = lmoney.toString();
			return result;
		} catch (Exception ex) {
			// log.error("Error: ", ex);
			// ex.printStackTrace();
			return param;
		}
	}

	public static String toUpper(String input) {
		if (isNullOrEmpty(input)) {
			return input;
		}
		return input.toUpperCase();
	}

	/**
	 * Validate Data theo Pattern
	 *
	 * @author khuongdv
	 */
	public static boolean validateStringByPattern(String value, String regex) {
		if (isNullOrEmpty(regex) || isNullOrEmpty(value)) {
			return false;
		}
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(value);
		return matcher.matches();
	}

	/**
	 * Bien cac ki tu dac biet ve dang ascii
	 *
	 * @param input
	 * @return
	 */
	public static String convertCharacter(String input) {
		if (input == null) {
			return "";
		}
		String[] aList = { "à", "á", "ả", "ã", "ạ", "â", "ầ", "ấ", "ẩ", "ẫ", "ậ", "ă", "ằ", "ắ", "ẳ", "ẵ", "ặ" };
		String[] eList = { "è", "é", "ẻ", "ẽ", "ẹ", "ê", "�?", "ế", "ể", "ễ", "ệ" };
		String[] iList = { "ì", "í", "ỉ", "ĩ", "ị" };
		String[] oList = { "ò", "ó", "�?", "õ", "�?", "ô", "ồ", "ố", "ổ", "ỗ", "ộ", "ơ", "�?", "ớ", "ở", "ỡ", "ợ" };
		String[] uList = { "ù", "ú", "ủ", "ũ", "ụ", "ư", "ừ", "ứ", "ử", "ữ", "ự" };
		String[] yList = { "ý", "ỳ", "ỷ", "ỹ", "ỵ" };
		String[] AList = { "À", "�?", "Ả", "Ã", "Ạ", "Â", "Ầ", "Ấ", "Ẩ", "Ẫ", "Ậ", "Ă", "Ằ", "Ắ", "Ẳ", "Ẵ", "Ặ" };
		String[] EList = { "È", "É", "Ẻ", "Ẽ", "Ẹ", "Ê", "Ề", "Ế", "Ể", "Ễ", "Ệ" };
		String[] IList = { "Ì", "�?", "Ỉ", "Ĩ", "Ị" };
		String[] OList = { "Ò", "Ó", "Ỏ", "Õ", "Ọ", "Ô", "Ồ", "�?", "Ổ", "Ỗ", "Ộ", "Ơ", "Ờ", "Ớ", "Ở", "Ỡ", "Ợ" };
		String[] UList = { "Ù", "Ú", "Ủ", "Ũ", "Ụ", "Ư", "Ừ", "Ứ", "Ử", "Ữ", "Ự" };
		String[] YList = { "Ỳ", "�?", "Ỷ", "Ỹ", "Ỵ" };
		for (String s : aList) {
			input = input.replace(s, "a");
		}
		for (String s : AList) {
			input = input.replace(s, "A");
		}
		for (String s : eList) {
			input = input.replace(s, "e");
		}
		for (String s : EList) {
			input = input.replace(s, "E");
		}
		for (String s : iList) {
			input = input.replace(s, "i");
		}
		for (String s : IList) {
			input = input.replace(s, "I");
		}
		for (String s : oList) {
			input = input.replace(s, "o");
		}
		for (String s : OList) {
			input = input.replace(s, "O");
		}
		for (String s : uList) {
			input = input.replace(s, "u");
		}
		for (String s : UList) {
			input = input.replace(s, "U");
		}
		for (String s : yList) {
			input = input.replace(s, "y");
		}
		for (String s : YList) {
			input = input.replace(s, "Y");
		}
		input = input.replace("đ", "d");
		input = input.replace("�?", "D");
		return input;
	}

	public static Map<String, String> convertStringToMap(String temp, String regex, String regexToMap) {
		if (isNullOrEmpty(temp)) {
			return null;
		}
		String[] q = temp.split(regex);
		Map<String, String> lstParam = new HashMap<String, String>();
		for (int i = 0; i < q.length; i++) {
			String a = q[i];
			String key = a.substring(0, (a.indexOf(regexToMap) < 0 ? 1 : a.indexOf(regexToMap)));
			String value = a.substring(a.indexOf(regexToMap) + 1);
			lstParam.put(key.trim(), value.trim());
		}
		return lstParam;
	}

	/*
	 * toanld2 ham xu li khoang trang giua xau
	 **/
	public static String replaceSpaceSolr(String inputLocation) {
		if (inputLocation == null || inputLocation.trim().isEmpty()) {
			return "";
		}
		String[] arr = inputLocation.split(" ");
		String result = "";
		for (String s : arr) {
			if (!"".equals(s.trim())) {
				if (!"".equals(result)) {
					result += "\\ ";
				}
				result += s.trim();
			}
		}
		return result;
	}

	public static boolean isInteger(String s) {
		try {
			Integer.parseInt(s);
		} catch (NumberFormatException e) {
			return false;
		} catch (NullPointerException e) {
			return false;
		}
		// only got here if we didn't return false
		return true;
	}

	public static boolean isNumber(String string) {
		return !isNullOrEmpty(string) && string.trim().matches("^\\d+$");
	}

	/**
	 * KhuongDV: Check xem string s co phai la so dt ko NamDX (20151007) bo ham nay
	 * o day vi khong duoc dung Const o Utils
	 *
	 * @param
	 * @return
	 */
	// public static boolean isPhoneNumber(String s){
	// if(!isNumber(s)) return false;
	// s = s.trim();
	// if(s.startsWith(Const.MOBILE_NUMBER.B01X.START_WITH) && s.length()==
	// Const.MOBILE_NUMBER.B01X.LENGTH){
	// return true;
	// }
	// if(s.startsWith(Const.MOBILE_NUMBER.B09X.START_WITH) && s.length()==
	// Const.MOBILE_NUMBER.B09X.LENGTH){
	// return true;
	// }
	// int size = s.length();
	// if(size < Const.CUST_CONTACT.MIN_PHONENO_LENGTH || size >
	// Const.CUST_CONTACT.MAX_PHONENO_LENGTH) return false;
	// return true;
	// }

	public static String addIsdn84(String isdn) {
		if (isNullOrEmpty(isdn) || isdn.length() < 2) {
			return isdn;
		}
		if (!"84".equals(isdn.substring(0, 2))) {
			isdn = "0".equals(isdn.substring(0, 1)) ? "84" + isdn.substring(1) : "84" + isdn;
		}
		return isdn;
	}

	public static boolean isValidFraction(String str) {
		if (str != null) {
			try {
				String tmp[] = str.split("/");
				if (tmp.length == 2) {
					if (safeToLong(tmp[0]) < safeToLong(tmp[1])) {
						return true;
					}
				}
			} catch (Exception e) {

			}
		}
		return false;

	}

	/**
	 * Convert TYPE cua Sale sang type cua QLKTCN khi sinh cong viec NamDX
	 * (20151007) bo ham nay o day vi khong duoc dung Const o Utils
	 * 
	 * @param lineType
	 * @return
	 * @author KhuongDV
	 */
	// public static String getServiceTypeCodeByLineType(String lineType) {
	// if (com.viettel.bccs.sale.common.Const.LINE_TYPE_A_ON_P.equals(lineType)) {
	// return
	// com.viettel.bccs.sale.common.Const.JOB_CREATE_TASK.TASK_LINE_TYPE_A_ON_P;
	// }
	//
	// if (com.viettel.bccs.sale.common.Const.LINE_TYPE_P_ON_A.equals(lineType)) {
	// return
	// com.viettel.bccs.sale.common.Const.JOB_CREATE_TASK.TASK_LINE_TYPE_P_ON_A;
	// }
	// if (com.viettel.bccs.sale.common.Const.LINE_TYPE_A_AND_P.equals(lineType)) {
	// return
	// com.viettel.bccs.sale.common.Const.JOB_CREATE_TASK.TASK_LINE_TYPE_A_AND_P;
	// }
	// return lineType;
	// }

	// public static boolean checkSubIsCd(Long telecom_service_id) {
	// if (!Utils.safeEqual(telecom_service_id, Const.TELECOM_SERVICE_ID.MOBILE)
	// && !Utils.safeEqual(telecom_service_id,
	// Const.TELECOM_SERVICE_ID.HOMEPHONE)) {
	// return true;
	// }
	// return false;
	// }

	/**
	 * Trim tat ca ki tu trang, bao gom ca ki tu trang 2 byte ma ham trim binh
	 * thuong cua java khong trim duoc
	 *
	 * @param needToTrimString
	 *            Xau can trim
	 * @return "" neu la xau null hoac trang, con lai tra ve xau sau khi trim, ""
	 *         neu trim xong khong con gi
	 */
	public static String trim(String needToTrimString) {
		if (needToTrimString == null) {
			return "";
		}
		return needToTrimString.trim();
	}

	/**
	 * Trim string
	 *
	 * @param str
	 * @param alt:
	 *            sau thay the khi str null
	 * @return
	 */
	public static String trim(String str, String alt) {
		if (str == null) {
			return alt;
		}
		return str.trim();
	}

	public static BigDecimal defaultIfSmallerThanZero(BigDecimal value) {
		return defaultIfSmallerThanZero(value, BigDecimal.ZERO);
	}

	public static BigDecimal defaultIfSmallerThanZero(BigDecimal value, BigDecimal defaultValue) {
		if (value == null || value.compareTo(BigDecimal.ZERO) < 0) {
			return defaultValue;
		}
		return value;
	}

	private static String convertUnicode2Nosign(String org) {

		char arrChar[] = org.toCharArray();
		char result[] = new char[arrChar.length];
		for (int i = 0; i < arrChar.length; i++) {
			switch (arrChar[i]) {
			case '\u00E1':
			case '\u00E0':
			case '\u1EA3':
			case '\u00E3':
			case '\u1EA1':
			case '\u0103':
			case '\u1EAF':
			case '\u1EB1':
			case '\u1EB3':
			case '\u1EB5':
			case '\u1EB7':
			case '\u00E2':
			case '\u1EA5':
			case '\u1EA7':
			case '\u1EA9':
			case '\u1EAB':
			case '\u1EAD':
			case '\u0203':
			case '\u01CE': {
				result[i] = 'a';
				break;
			}
			case '\u00E9':
			case '\u00E8':
			case '\u1EBB':
			case '\u1EBD':
			case '\u1EB9':
			case '\u00EA':
			case '\u1EBF':
			case '\u1EC1':
			case '\u1EC3':
			case '\u1EC5':
			case '\u1EC7':
			case '\u0207': {
				result[i] = 'e';
				break;
			}
			case '\u00ED':
			case '\u00EC':
			case '\u1EC9':
			case '\u0129':
			case '\u1ECB': {
				result[i] = 'i';
				break;
			}
			case '\u00F3':
			case '\u00F2':
			case '\u1ECF':
			case '\u00F5':
			case '\u1ECD':
			case '\u00F4':
			case '\u1ED1':
			case '\u1ED3':
			case '\u1ED5':
			case '\u1ED7':
			case '\u1ED9':
			case '\u01A1':
			case '\u1EDB':
			case '\u1EDD':
			case '\u1EDF':
			case '\u1EE1':
			case '\u1EE3':
			case '\u020F': {
				result[i] = 'o';
				break;
			}
			case '\u00FA':
			case '\u00F9':
			case '\u1EE7':
			case '\u0169':
			case '\u1EE5':
			case '\u01B0':
			case '\u1EE9':
			case '\u1EEB':
			case '\u1EED':
			case '\u1EEF':
			case '\u1EF1': {
				result[i] = 'u';
				break;
			}
			case '\u00FD':
			case '\u1EF3':
			case '\u1EF7':
			case '\u1EF9':
			case '\u1EF5': {
				result[i] = 'y';
				break;
			}
			case '\u0111': {
				result[i] = 'd';
				break;
			}
			case '\u00C1':
			case '\u00C0':
			case '\u1EA2':
			case '\u00C3':
			case '\u1EA0':
			case '\u0102':
			case '\u1EAE':
			case '\u1EB0':
			case '\u1EB2':
			case '\u1EB4':
			case '\u1EB6':
			case '\u00C2':
			case '\u1EA4':
			case '\u1EA6':
			case '\u1EA8':
			case '\u1EAA':
			case '\u1EAC':
			case '\u0202':
			case '\u01CD': {
				result[i] = 'A';
				break;
			}
			case '\u00C9':
			case '\u00C8':
			case '\u1EBA':
			case '\u1EBC':
			case '\u1EB8':
			case '\u00CA':
			case '\u1EBE':
			case '\u1EC0':
			case '\u1EC2':
			case '\u1EC4':
			case '\u1EC6':
			case '\u0206': {
				result[i] = 'E';
				break;
			}
			case '\u00CD':
			case '\u00CC':
			case '\u1EC8':
			case '\u0128':
			case '\u1ECA': {
				result[i] = 'I';
				break;
			}
			case '\u00D3':
			case '\u00D2':
			case '\u1ECE':
			case '\u00D5':
			case '\u1ECC':
			case '\u00D4':
			case '\u1ED0':
			case '\u1ED2':
			case '\u1ED4':
			case '\u1ED6':
			case '\u1ED8':
			case '\u01A0':
			case '\u1EDA':
			case '\u1EDC':
			case '\u1EDE':
			case '\u1EE0':
			case '\u1EE2':
			case '\u020E': {
				result[i] = 'O';
				break;
			}
			case '\u00DA':
			case '\u00D9':
			case '\u1EE6':
			case '\u0168':
			case '\u1EE4':
			case '\u01AF':
			case '\u1EE8':
			case '\u1EEA':
			case '\u1EEC':
			case '\u1EEE':
			case '\u1EF0': {
				result[i] = 'U';
				break;
			}
			case '\u00DD':
			case '\u1EF2':
			case '\u1EF6':
			case '\u1EF8':
			case '\u1EF4': {
				result[i] = 'Y';
				break;
			}

			case '\u0110':
			case '\u00D0':
			case '\u0089': {
				result[i] = 'D';
				break;
			}
			default:
				result[i] = arrChar[i];
			}
		}
		return new String(result);
	}

	public static Object convertNullToEmpty(Object value) {
		return value == null ? "" : value;
	}

	public static boolean safeEqual(Object obj1, Object obj2) {
		return ((obj1 != null) && (obj2 != null) && obj2.toString().equals(obj1.toString()));
	}

	// thiendn1: format cho don vi tien te khi in hoa don
	public static Object convertCommaToDot(Object value) {
		if (!(value instanceof Number)) {
			return value;
		}
		DecimalFormat formatter = new DecimalFormat("###,###");
		DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
		symbols.setDecimalSeparator(',');
		symbols.setGroupingSeparator('.');
		formatter.setDecimalFormatSymbols(symbols);
		return formatter.format(value);
	}

	public static String formatSerial(int serialLength, BigInteger serial) {
		int prefix = serialLength - serial.toString().length();
		String serialFormat = prefix == 0 ? "%d" : ("%0" + String.valueOf(serialLength) + "d");
		return String.format(serialFormat, serial);
	}

	public static String getExtension(String fileName) {
		String extension = "";
		int i = fileName.lastIndexOf('.');
		if (i > 0) {
			extension = fileName.substring(i + 1);
		}
		return extension;
	}
	//
	// public static String getMimeType(String fileExtension) {
	// switch (fileExtension) {
	// case "pdf":
	// return "application/pdf";
	// case "png":
	// return "image/png";
	// case "jpg":
	// return "image/jpeg";
	// case "bmp":
	// return "image/bmp";
	// case "gif":
	// return "image/gif";
	// case "jpe":
	// return "image/jpeg";
	// case "jpeg":
	// return "image/jpeg";
	// default:
	// return "";
	// }
	// }

	public static boolean checkPhone(String input) {
		boolean isOk = true;
		if (isNullOrEmpty(input)) {
			return isOk;
		}
		return validateStringByPattern(input, PHONE_PATTERN);
	}

	/**
	 * ham compare 2 object Model, chi dung voi cac thuoc tinh kieu nguyen thuy
	 * (primitive type)
	 *
	 * @param oldObj
	 * @param newObj
	 * @return
	 */
	public static boolean compareTwoObj(Object oldObj, Object newObj) {
		try {
			if ((oldObj == null && newObj != null) || (oldObj != null && newObj == null)) {
				return false;
			}
			if (oldObj == null && newObj == null) {
				return true;
			}
			if (!safeEqual(oldObj.getClass().getName(), newObj.getClass().getName())) {
				return false;
			}
			Method[] arrMethod = oldObj.getClass().getDeclaredMethods();
			Method tempMethod = null;
			for (int i = 0; i < arrMethod.length; i++) {
				tempMethod = arrMethod[i];
				if (!tempMethod.getName().startsWith("get")) {
					continue;
				}
				Object oldBO = null;
				if (oldObj != null) {
					oldBO = tempMethod.invoke(oldObj, new Object[0]);
				}
				Object newBO = tempMethod.invoke(newObj, new Object[0]);
				String oldValue = "";
				if (oldBO != null) {
					if (oldBO instanceof java.util.Date || oldBO instanceof java.sql.Date) {
						// oldValue = DateTimeUtils.convertDateTimeToString((Date) oldBO);
						SimpleDateFormat yyyyMMdd = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
						oldValue = yyyyMMdd.format(oldBO);
					} else {
						oldValue = oldBO.toString();
					}
				}
				String newValue = "";
				if (newBO != null) {
					if (newBO instanceof java.util.Date || newBO instanceof java.sql.Date) {
						// newValue = DateTimeUtils.convertDateTimeToString((Date) newBO);
						SimpleDateFormat yyyyMMdd = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
						newValue = yyyyMMdd.format(newBO);
					} else {
						newValue = newBO.toString();
					}
				}
				if (!oldValue.equals(newValue)) {
					return true;
				}
			}
			return false;
		} catch (Exception e) {
			return false;
		}
	}

	public static String getEndPoint() {
		try {
			MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
			Set<ObjectName> objs = mbs.queryNames(new ObjectName("*:type=Connector,*"),
					Query.match(Query.attr("protocol"), Query.value("HTTP/1.1")));
			String hostname = InetAddress.getLocalHost().getHostName();
			InetAddress addresses = InetAddress.getByName(hostname);
			for (Iterator<ObjectName> i = objs.iterator(); i.hasNext();) {
				ObjectName obj = i.next();
				String port = obj.getKeyProperty("port");
				String host = addresses.getHostAddress();
				return host + ":" + port;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "";
	}

	public static String getMD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");

			byte[] messageDigest = md.digest(input.getBytes());
			BigInteger number = new BigInteger(1, messageDigest);
			String hashtext = number.toString(16);

			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}

			return hashtext;
		} catch (Exception e) {
			System.out.println("File name cannot encrypt: " + input);

			e.printStackTrace();
		}
		return "";
	}

	static private byte[] getKey(byte[] arrBTmp) throws Exception {
		byte[] arrB = new byte[8];
		for (int i = 0; i < arrBTmp.length && i < arrB.length; i++) {
			arrB[i] = arrBTmp[i];
		}
		return arrB;
	}

	public static boolean checkDigit(String str) {
		return str.matches("(\\d+)");
	}

	public static boolean checkNotSpecialCharacter(String str) {
		return str.matches("^[A-Za-z0-9]+");
	}

//	public static void initialize(Object object) throws IllegalArgumentException, IllegalAccessException {
//		Field[] fields = object.getClass().getDeclaredFields();
//
//		for (Field field : fields) {
//			String fieldName = field.getName();
//			Class<?> fieldClass = field.getType();
//
//			// skip primitives
//			if (fieldClass.isPrimitive()) {
//				System.out.println("Skipping primitive: " + fieldName);
//				continue;
//			}
//
//			// skip if not in packages
//			boolean inPackage = false;
//
//			// allow access to private fields
//			boolean isAccessible = field.isAccessible();
//			field.setAccessible(true);
//
//			Object fieldValue = field.get(object);
//			if (fieldValue == null) {
//				System.out.println("Initializing: " + fieldName);
//				try {
//					field.set(object, fieldClass.newInstance());
//				} catch (IllegalArgumentException | IllegalAccessException | InstantiationException e) {
//					System.err.println("Could not initialize " + fieldClass.getSimpleName());
//				}
//			} else {
//				System.out.println("Field is already initialized: " + fieldName);
//			}
//
//			fieldValue = field.get(object);
//
//			// reset accessible
//			field.setAccessible(isAccessible);
//
//			// recursive call for sub-objects
//			initialize(fieldValue);
//		}
//
//	}

	public static void reflect(Object obj) throws InstantiationException, IllegalAccessException {
		if (obj == null) {
			obj = Object.class.newInstance();
		}
		Class klazz = obj.getClass();
		if (klazz.isPrimitive() || obj instanceof Integer || obj instanceof Double || obj instanceof Boolean)
			return;
		else {
			try {
				for (Field field : klazz.getDeclaredFields()) {
					final Class<?> fieldType = field.getType();
					// if (fieldType.isArray() && !fieldType.getComponentType().isPrimitive()) {
					// Object f = field.get(obj);
					// Object[] fs = (Object[]) f;
					// for (Object fi : fs) {
					// reflect(fi);
					// }
					// }

					field.setAccessible(true);
					Object f = field.get(obj);
					if (f instanceof String) {
						f = transform(f);
						field.set(obj, f);
					} else {
						if (f == null) {
							f = fieldType.newInstance();
							field.set(obj, f);
						}
						reflect(f);
					}
				}
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			}
		}
	}

	private static Object transform(Object f) {
		f = "data";
		return f;
	}

//	public static String getXmlDocument(Object obj) {
//		Document doc = null;
//		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
//		dbf.setNamespaceAware(true);
//		File file = new File("abc.xml");
//		StringBuilder contentBuilder = new StringBuilder();
//		JAXB.marshal(obj, file);
//		try {
//			Stream<String> stream = Files.lines(file.toPath(), StandardCharsets.UTF_8);
//			stream.forEach(s -> contentBuilder.append(s).append("\n"));
//		} catch (FileNotFoundException ex) {
//			ex.printStackTrace();
//		} catch (IOException ex) {
//			ex.printStackTrace();
//		} finally {
//			file.deleteOnExit();
//		}
//
//		return contentBuilder.toString();
//	}

	public static String getClientIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getHeader("HTTP_X_FORWARDED");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getHeader("HTTP_X_CLUSTER_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getHeader("HTTP_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getHeader("HTTP_FORWARDED");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getHeader("HTTP_VIA");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	public static boolean checkSpecial(String str) {
		if (str == null || str.length() == 0) {
			return false;
		}
		return str.matches(SPECIAL);
	}

	public static <T> String convertObjToXML(Object object, Class<T> objClass) throws JAXBException {
		StringWriter sw = new StringWriter();
		JAXBContext jaxbContext = JAXBContext.newInstance(objClass);
		Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
		jaxbMarshaller.marshal(object, sw);
		String xmlString = sw.toString();

		return xmlString;
	}

//	public static byte[] decodeBase64(String value) {
//		if (isNullObject(value))
//			return null;
//		byte[] byteArray = Base64.decodeBase64(value.getBytes());
//
//		return byteArray;
//	}

//	public static String encodeBase64(File file) {
//		String strFile = "";
//		try {
//			byte[] bytes = loadFile(file);
//			byte[] encode = Base64.encodeBase64(bytes);
//			strFile = new String(encode);
//		} catch (IOException e) {
//			return null;
//		}
//		return strFile;
//	}

	private static byte[] loadFile(File file) throws IOException {
		InputStream is = new FileInputStream(file);

		long length = file.length();
		byte[] bytes = new byte[(int) length];

		int offset = 0;
		int numRead = 0;
		while (offset < bytes.length && (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
			offset += numRead;
		}

		if (offset < bytes.length) {
			throw new IOException("Could not completely read file " + file.getName());
		}

		is.close();
		return bytes;
	}

	public static Date convertStringToDate(String str, String dateFormat) {
		if (str == null || str.length() == 0) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		try {
			Date date = sdf.parse(str);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String convertDateToString(Date date, String dateFormat) {
		if (date == null) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		String str = sdf.format(date);
		return str;
	}

//	private static final TikaEncodingDetector encodingDetector = new TikaEncodingDetector();

//	public static boolean checkUTF8(ByteArrayInputStream is) throws IOException {
//		String encoding = "";
//		try {
//			encoding = Charset.forName(encodingDetector.guessEncoding(is)).toString();
//		} catch (IOException e) {
//			logger.error(e);
//		} finally {
//			is.close();
//		}
//		// truong hop file format la UTF8 nhung ko co ky tu tieng viet thi dang nhan
//		// format encoding la ISO-8859-1 => check them dieu kien encoding la ISO_8859_1
//		return Constants.UNICODE.UTF8.equalsIgnoreCase(encoding)
//				|| encoding.startsWith(Constants.UNICODE.ISO_8859);
//	}
	
	public static Charset detectCharset(ByteArrayInputStream is, String charsetName) throws IOException {
		Charset charset = null;
		charset = detectCharset(is, Charset.forName(charsetName));
		return charset;
	}

	private static Charset detectCharset(ByteArrayInputStream is, Charset charset) throws IOException {
		try {
//			BufferedInputStream input = new BufferedInputStream(new FileInputStream(f));

			CharsetDecoder decoder = charset.newDecoder();
			decoder.reset();

			byte[] buffer = new byte[512];
			boolean identified = false;
			while ((is.read(buffer) != -1) && (!identified)) {
				identified = identify(buffer, decoder);
			}

			

			if (identified) {
				return charset;
			} else {
				return null;
			}

		} catch (Exception e) {
			return null;
		} finally {
			is.close();
		}
	}

	private static boolean identify(byte[] bytes, CharsetDecoder decoder) {
		try {
			decoder.decode(ByteBuffer.wrap(bytes));
		} catch (CharacterCodingException e) {
			return false;
		}
		return true;
	}
	

	public static String padRight(String s, int n) {
		return String.format("%-" + n + "s", s);
	}

	public static String padLeft(String s, int n) {
		return String.format("%" + n + "s", s);
	}
	public static BigDecimal stringToBigDecimal(String number) {
		BigDecimal decimal = null;
		try {
			decimal = new BigDecimal(number);
		} catch (Exception e) {
			number = number.replaceAll("\\.", "");
			number = number.replaceAll(",", ".");
			decimal = new BigDecimal(number);
		}
		return decimal;
	}
}
