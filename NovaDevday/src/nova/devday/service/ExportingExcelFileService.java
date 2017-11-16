package nova.devday.service;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.aspose.cells.BackgroundType;
import com.aspose.cells.BorderType;
import com.aspose.cells.Cell;
import com.aspose.cells.CellBorderType;
import com.aspose.cells.Cells;
import com.aspose.cells.Color;
import com.aspose.cells.FileFormatType;
import com.aspose.cells.Font;
import com.aspose.cells.Style;
import com.aspose.cells.StyleFlag;
import com.aspose.cells.Workbook;
import com.aspose.cells.Worksheet;
import com.nova.devday.CandidateInfo;

import ch.ivyteam.ivy.ThirdPartyLicenses;
import ch.ivyteam.ivy.environment.Ivy;

public class ExportingExcelFileService {
	private static final String XLSX_EXTENSION = "xlsx";
	private static final String EXCEL_REPORT_DOWNLOAD_FILE_NAME = "Candidates";
	private static final String EXCEL_FONT = "Calibri";
	private static final int FIRST_SHEET_INDEX = 0;
	private static final int FIRST_COMLUMN_INDEX = 0;
	private static final int FIRST_ROW_INDEX = 0;
	private static final int EXCEL_FONT_SIZE = 11;
	private static final double EXCEL_CELLS_HEIGHT = 15f;
	private static final int EXCEL_COLUMN_WIDTH = 42;
	private static final int ARGB_GRAY_COLOR = 220;

	private ExportingExcelFileService() {

	}

	public static File buildExcelFile(List<CandidateInfo> dataList) throws Exception {
		loadAsposeCellsLicense();

		Workbook workbook = new Workbook();
		Worksheet worksheet = workbook.getWorksheets().get(FIRST_SHEET_INDEX);

		setupDefaultSetting(workbook);
		addTitle(worksheet);
		importValueFromDataList(dataList, worksheet);

		File reportFile = createEmptyDestExcelFile();
		workbook.save(reportFile.getAbsolutePath(), FileFormatType.XLSX);
		return reportFile;
	}

	private static void importValueFromDataList(List<CandidateInfo> dataList, Worksheet worksheet) {
		int rowIndex = 1;

		for (CandidateInfo data : dataList) {
			ArrayList<Object> importListForOneRow = new ArrayList<>();
			// The order is important
			importListForOneRow.add("-");
			importListForOneRow.add(data.getMinimumExpectedSalary());
			importListForOneRow.add(data.getYearsOfExperience());
			importListForOneRow.add("-");
			importListForOneRow.add(data.getProfileLink());
			worksheet.getCells().importArrayList(importListForOneRow, rowIndex, FIRST_COMLUMN_INDEX, false);
			rowIndex++;
		}
	}

	private static void setupDefaultSetting(Workbook workbook) {
		Style style = workbook.createStyle();
		style.getFont().setName(EXCEL_FONT);
		style.getFont().setSize(EXCEL_FONT_SIZE);
		StyleFlag flag = new StyleFlag();
		flag.setFontName(true);
		flag.setFontSize(true);
		Cells cells = workbook.getWorksheets().get(FIRST_SHEET_INDEX).getCells();
		cells.applyStyle(style, flag);
		cells.setStandardHeight(EXCEL_CELLS_HEIGHT);
	}

	private static void addTitle(Worksheet worksheet) {
		ArrayList<String> titleList = new ArrayList<>(
				Arrays.asList("Current Position", "Expected Salary", "Experience", 
						"Working Place", "Profile Link"));
		int columnIndex = 0;

		for (String title : titleList) {
			Cell cell = worksheet.getCells().get(FIRST_ROW_INDEX, columnIndex);
			Style style = cell.getStyle();
			style.setBorder(BorderType.BOTTOM_BORDER, CellBorderType.THIN, Color.getBlack());
			style.setBackgroundColor(Color.getGray());
			style.setForegroundColor(Color.fromArgb(ARGB_GRAY_COLOR, ARGB_GRAY_COLOR, ARGB_GRAY_COLOR));
			style.setPattern(BackgroundType.SOLID);

			Font font = style.getFont();
			font.setBold(true);
			cell.setStyle(style);
			cell.setValue(title);
			worksheet.getCells().setColumnWidth(columnIndex, EXCEL_COLUMN_WIDTH);
			columnIndex++;
		}
	}

	private static void loadAsposeCellsLicense() {
		try {
			com.aspose.cells.License license = new com.aspose.cells.License();
			InputStream inputStream = ThirdPartyLicenses.getDocumentFactoryLicense();
			license.setLicense(inputStream);
			inputStream.close();
		} catch (Exception ex) {
			Ivy.log().error(ex.getMessage(), ex);
		}
	}

	private static File createEmptyDestExcelFile() {
		String destPath = Ivy.wf().getApplication().getSessionFileArea().getAbsolutePath() + File.separator
				+ "NovaDevDay";
		String destExcelFileWithExtension = EXCEL_REPORT_DOWNLOAD_FILE_NAME + "." + XLSX_EXTENSION;
		File f = new File(destPath);
		f.mkdirs();
		return new File(f, destExcelFileWithExtension);
	}
}