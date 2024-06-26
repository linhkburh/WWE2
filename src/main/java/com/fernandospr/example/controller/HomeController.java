package com.fernandospr.example.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.util.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import net.sf.jxls.transformer.XLSTransformer;

@Controller
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<String> lstStaff = new ArrayList<>();
		lstStaff.add("Hậu Phạm");
		lstStaff.add("Nhàn");
		lstStaff.add("Hà Mint(NA)");
		lstStaff.add("Vinh Khoa");
		lstStaff.add("Lương Mai");
		lstStaff.add("Nguyễn Trang");
		lstStaff.add("Thúy Lê");
		lstStaff.add("Vũ Hương");
		lstStaff.add("Thăng Nhật");
		lstStaff.add("Ngát Mint");
		lstStaff.add("Phương Thúy");
		lstStaff.add("Nguyện");
		lstStaff.add("Trang Bi");
		lstStaff.add("Nhung Sakura");
		lstStaff.add("Nguyễn Thủy");
		model.addAttribute("lstStaff", lstStaff);
		return "flower";
	}
	@RequestMapping(value = "/flower", method = RequestMethod.GET)
	public String flower(Locale locale, Model model) {
		List<String> lstStaff = new ArrayList<>();
		lstStaff.add("Hậu Phạm");
		lstStaff.add("Nhàn");
		lstStaff.add("Hà Mint(NA)");
		lstStaff.add("Vinh Khoa");
		lstStaff.add("Lương Mai");
		lstStaff.add("Nguyễn Trang");
		lstStaff.add("Thúy Lê");
		lstStaff.add("Vũ Hương");
		lstStaff.add("Thăng Nhật");
		lstStaff.add("Ngát Mint");
		lstStaff.add("Phương Thúy");
		lstStaff.add("Nguyện");
		lstStaff.add("Trang Bi");
		lstStaff.add("Nhung Sakura");
		lstStaff.add("Nguyễn Thủy");
		model.addAttribute("lstStaff", lstStaff);
		return "flower";
	}
	@RequestMapping(value = "/downloadExcel", method = RequestMethod.POST)
	public void downloadExcel(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Map<String, Object> beans =  new HashMap<String, Object>();
		String dateData = request.getParameter("dateData");
		String[] staffData = request.getParameterValues("staffData");
		List<String> allDayOfM = getAllDatesInMonth(dateData);
		LocalDate date = LocalDate.parse(dateData);
		String time = "T"+String.valueOf(date.getMonthValue())+"/"+String.valueOf(date.getYear());
		ClassLoader classLoader = getClass().getClassLoader();
		InputStream tempFile = classLoader.getResourceAsStream("/templates/Temp_Thao.xlsx");
		beans.put("dayOfMonth", allDayOfM);
		beans.put("time", time);
		Workbook book = new XLSTransformer().transformXLS(tempFile, beans);
		processExcel(book,staffData);
		tempFile.close();
		// Download file
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename*=utf-8''" +time+ ".xlsx");
		ServletOutputStream out = response.getOutputStream();
		book.write(out);
		out.close();
	}

	private List<String> getAllDatesInMonth(String dateString) {
		List<String> allDatesInMonth = new ArrayList<>();
		LocalDate date = LocalDate.parse(dateString);
		LocalDate firstDayOfMonth = date.withDayOfMonth(1);
		LocalDate lastDayOfMonth = date.withDayOfMonth(date.lengthOfMonth());
		for (LocalDate d = firstDayOfMonth; !d.isAfter(lastDayOfMonth); d = d.plusDays(1)) {
			allDatesInMonth.add(String.valueOf(d.getDayOfMonth()) + "/" + String.valueOf(d.getMonthValue()));
		}
		return allDatesInMonth;
	}

	private void processExcel(Workbook book, String[] staffData) {
		Sheet sheetTemp = book.getSheet("SheetTemp");
		for (int i = 0; i < staffData.length; i++) {
				if(!staffData[i].equals("")) {
				Sheet clonedSheet = book.cloneSheet(book.getSheetIndex(sheetTemp));
				CellRangeAddress mergedRegion = new CellRangeAddress(0, 0, 1, 8);
				clonedSheet.addMergedRegion(mergedRegion);
				clonedSheet.getRow(0).getCell(1).setCellValue(staffData[i]);
				book.setSheetName(book.getSheetIndex(clonedSheet), (i+1)+"."+staffData[i]);
			}
		}
		book.removeSheetAt(book.getSheetIndex(sheetTemp));
	}
	@RequestMapping(value = "/getImg", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImg(HttpServletRequest request) throws IOException {
		ClassLoader classLoader = getClass().getClassLoader();
		InputStream inputStream1 = classLoader.getResourceAsStream("/templates/thaolike.jpg");
		byte[] inputImageBytes1 = IOUtils.toByteArray(inputStream1);
		return ResponseEntity.ok().contentLength(inputImageBytes1.length).contentType(MediaType.IMAGE_PNG).body(inputImageBytes1);
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void test(HttpServletRequest request) {
		ClassLoader classLoader = getClass().getClassLoader();
		InputStream inputStream1 = classLoader.getResourceAsStream("/templates/thaolike.jpg");
	}
	
	@RequestMapping(value = "/workWithFb", method = RequestMethod.GET)
	public String fbApi(Locale locale, Model model) {
		
		return "workFb";
	}
}
