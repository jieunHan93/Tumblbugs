package com.tumblbugs.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
public class ExcelWrite {
    /**
     * WriteOption 에서 가져온다.
     */
    private static String downloadPath = null;
    private static Sheet sheet;
    private static int rowIndex;
     
    /**
     * 엑셀 파일을 작성한다.
     * @param WriteOption
     * @return Excel 파일의 File 객체
     */
    public static File write(WriteOption writeOption) {
    	// excel 파일 생성
    	SXSSFWorkbook wb = new SXSSFWorkbook();
        sheet = wb.createSheet(writeOption.getSheetName());
         
        setTitle(writeOption.getTitles());
        setContents(writeOption.getContents());
         
        FileOutputStream fos = null;
        try {
            downloadPath = writeOption.getFilePath();
            if ( downloadPath == null ) {
                throw new RuntimeException("Excel 파일이 만들어질 경로가 누락되었습니다. WriteOption 의 filePath를 셋팅하세요. 예 > D:\\uploadFiles\\");
            }
             
            fos = new FileOutputStream(downloadPath + writeOption.getFileName());
            wb.write(fos);
        } catch (IOException e) {
            throw new RuntimeException(e.getMessage(), e);
        }
        finally {
            if(fos != null) {
                try {
                    fos.flush();
                    fos.close();
                } catch (IOException e) {}
            }
             
            rowIndex = 0;
        }
        return getFile(writeOption.getFileName());
    }
     
    private static void setTitle(List<String> values) {
         
        Row row = null;
        Cell cell = null;
         
        int cellIndex = 0;
         
        if( values != null && values.size() > 0 ) {
            row = sheet.createRow(rowIndex++);
            for(String value : values) {
                cell = row.createCell(cellIndex++);
                cell.setCellValue(value);
            }
        }
         
    }
     
    private static void setContents(List<String[]> values) {
         
        Row row = null;
        Cell cell = null;
         
        int cellIndex = 0;
         
        if( values != null && values.size() > 0 ) {
             
            for(String[] arr : values) {
                row = sheet.createRow(rowIndex++);
                cellIndex = 0;
                for(String value : arr) {
                    cell = row.createCell(cellIndex++);
                    cell.setCellValue(value);
                }
            }
        }
         
    }
     
    private static File getFile(String fileName) {
        return new File(downloadPath + fileName);
    }
     
    private void example() {
        WriteOption wo = new WriteOption();
        wo.setSheetName("Test");
        wo.setFileName("test.xlsx");
        wo.setFilePath("d:\\");
        List<String> titles = new ArrayList<String>();
        titles.add("Title1");
        titles.add("Title2");
        titles.add("Title3");
        wo.setTitles(titles);
         
        List<String[]> contents = new ArrayList<String[]>();
        contents.add(new String[]{"1", "2", "3"});
        contents.add(new String[]{"11", "22", "33"});
        contents.add(new String[]{"111", "222", "333"});
        wo.setContents(contents);
         
        File excelFile = ExcelWrite.write(wo);
    }
     
}
