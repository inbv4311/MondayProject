package naver.api.util;

import java.io.*;
import java.net.*;
import java.util.*;

public class GetNaverNews {
	
	private String clientId 	= "Sv8c_eAlEiBc2rhwe_ql";
	private String ClientSecret = "ry_vn16CI0";
	
	public String showNews(String keyword, int display, int start) {
		String text = null;
			try {
				text = URLEncoder.encode(keyword, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			String apiURL = "https://openapi.naver.com/v1/search/news";
			
			apiURL 		 += "?query="	+ text;
			apiURL 		 += "&display="	+ display;
			apiURL 		 += "&start="	+ start;
			apiURL 		 += "&sort=date";
			apiURL 		 += "&filter=all";
			
			Map<String, String>requestHeads = new HashMap<>();
			requestHeads.put("X-Naver-Client-Id", clientId);
			requestHeads.put("X-Naver-Client-Secret", ClientSecret);
			requestHeads.put("Content-Type", "application/json");
			
			String responseBody = get(apiURL, requestHeads);
			
		return responseBody;
	}

	private String get(String apiURL, Map<String, String> requestHeads) {
		HttpURLConnection con = connect(apiURL); 
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeads.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			
			int responseCode = con.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) { //200
				return readBody(con.getInputStream());
			} else { //error
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API요청과 응답 실패 :" + e);
		} finally {
			con.disconnect();
		}
	}

	
	private HttpURLConnection connect(String apiURL) {
		try {
			URL url = new URL(apiURL);
			return (HttpURLConnection)url.openConnection();
		} catch(MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다 :"
					+ apiURL, e);
		} catch(IOException e) {
			throw new RuntimeException("연결이 실패했습니다 :"+e);
		}
	}
	
	private String readBody(InputStream body) {
		InputStreamReader isr = new InputStreamReader(body);
		try (BufferedReader br = new BufferedReader(isr)){
			//이렇게 넣으면 br은 close하고 사라짐
			StringBuilder responseBody = new StringBuilder();
			
			String line= "";
			while( (line=br.readLine()) != null ) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch(IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패 :"+e);
		}
	}

}
