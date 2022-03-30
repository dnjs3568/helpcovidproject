package navernews;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class NaverCrawler {
	// 베이스 URL
	final String baseUrl = "https://openapi.naver.com/v1/search/news.json?query=";

	public String search(String id, String secret, String text) {
		//String clientId = "l47MThKEHraBMEX1lX7M";
		//String secret = "BnPnPWajBS";
		//String url = URLEncoder.encode("코로나", "UTF-8");
		HttpURLConnection con = null;
		String result = "";
		try {
			URL url = new URL(baseUrl + text);
			con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", id);
			con.setRequestProperty("X-Naver-Client-Secret", secret);
			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK)
				result = readBody(con.getInputStream());
			else
				result = readBody(con.getErrorStream());
		} catch (Exception e) {
			System.out.println("연결 오류 : " + e);
		} finally {
			con.disconnect();
		}
		return result;
	}

	/** * 결과를 읽는다 * * @param body * @return */
	public String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();
			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	/** * 결과를 파싱하는 메소드 * * @param response * @param fiels * * @return */
	public Map<String, Object> getResult(String res, String[] fields) {
		Map<String, Object> rtnObj = new HashMap<>();
		try {
			JSONParser parser = new JSONParser();
			JSONObject result = (JSONObject) parser.parse(res);
			//rtnObj.put("total", (long) result.get("total"));
			JSONArray items = (JSONArray) result.get("items");
			List<Map<String, Object>> itemList = new ArrayList<>();
			for (int i = 0; i < items.size(); i++) {
				JSONObject item = (JSONObject) items.get(i);
				Map<String, Object> itemMap = new HashMap<>();
				for (String field : fields) {
					itemMap.put(field, item.get(field));
					//System.out.println("total : " + result.get("total"));
					//System.out.println("title : " + result.get(item.get(field)));
					//System.out.println("link : " + result.get("link"));
					//System.out.println("description : " + result.get("description"));
					//System.out.println(item.get(field));
				}
				
				//itemList.add(itemMap);
				itemList.add(itemMap);
			}
			rtnObj.put("result", items);
		} catch (Exception e) {
			System.out.println("getResult error -> " + "파싱 실패, " + e.getMessage());
		}
		return rtnObj; //json 파싱 결과 
		//return items;
		//session.setAttribute("itemList", itemList);
	}
	
}
