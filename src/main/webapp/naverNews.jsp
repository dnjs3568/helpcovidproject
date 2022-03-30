<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="navernews.NaverCrawler"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>


<%NaverCrawler crawler = new NaverCrawler();
	StringBuffer sb;
	String clientId = "l47MThKEHraBMEX1lX7M";// 애플리케이션 클라이언트 아이디값"; 
	String clientSecret = "BnPnPWajBS";// 애플리케이션 클라이언트 시크릿값";\
	String text = URLEncoder.encode("코로나", "UTF-8");
	int display = 100; // 검색결과갯수. 최대100개 
	String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text + "&display=" + display;
	
	String res = crawler.search(clientId, clientSecret, apiURL);
	String[] fields = { "title", "link", "description" };
	Map<String, Object> result = crawler.getResult(res, fields);
	//if(result.size()>0)
		//System.out.println("total : "+result.get("total"));
	List<Map<String, Object>> items = (List<Map<String, Object>>) result.get("result");
	//JSONObject json = new JSONObject((JSONObject)items);
	for(
	Map<String, Object> item:items){
		System.out.println("====================================================");
		for (String field : fields){
			//System.out.println(field + ": " + item.get(field));
	

		}
	}
	
	%>

	<%
	//int display = 5; // 검색결과갯수. 최대100개 
	try {
	//	String text = URLEncoder.encode("코로나", "UTF-8");
		//String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text + "&display=" + display;
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();

		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		} else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
		}
		sb = new StringBuffer();
		String line;
		while ((line = br.readLine()) != null) {
	%><%=line%>
	
	<%
	sb.append(line + "\n");
	;
	}

	br.close();
	con.disconnect();
	} catch (Exception e) {
	System.out.println(e);
	}
	%>