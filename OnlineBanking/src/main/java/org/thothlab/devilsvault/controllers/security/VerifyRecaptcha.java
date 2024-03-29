package org.thothlab.devilsvault.controllers.security;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;

import org.apache.log4j.Logger;

public class VerifyRecaptcha {
	private final static Logger LOGGER = Logger.getLogger(VerifyRecaptcha.class.getName());
	public static final String url = "https://www.google.com/recaptcha/api/siteverify";
	public static final String secret = "6LfkT3IUAAAAAPjCBabYObEA5FuI-xi8jqaRFXjb";
	private final static String USER_AGENT = "Mozilla/5.0";

	public static boolean verify(String gRecaptchaResponse) throws IOException {
		LOGGER.info("Entered into "+Thread.currentThread().getName());
		if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
			return false;
		}
		
		try{
		URL obj = new URL(url);
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

		// add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

		String postParams = "secret=" + secret + "&response="
				+ gRecaptchaResponse;
		LOGGER.info("postParams="+postParams);
		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(postParams);
		wr.flush();
		wr.close();

		BufferedReader in = new BufferedReader(new InputStreamReader(
				con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		// print result
		//System.out.println(response.toString());
		
		//parse JSON response and return 'success' value
		JsonReader jsonReader = Json.createReader(new StringReader(response.toString()));
		JsonObject jsonObject = jsonReader.readObject();
		jsonReader.close();
		
		return jsonObject.getBoolean("success");
		}catch(Exception e){
			LOGGER.info("Execption in "+Thread.currentThread().getName()+""+Thread.currentThread().getStackTrace());
			e.printStackTrace();
			return false;
		}
	}
}