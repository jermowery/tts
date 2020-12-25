package com.jermowery.audio.server;

import com.google.common.io.Resources;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ApiServlet implements HttpHandler {

  private static final Logger logger =
      Logger.getLogger(ApiServlet.class.getName());
  private static final Gson GSON = new GsonBuilder().create();

  @Override
  public void handle(HttpExchange httpExchange) throws IOException {
    httpExchange.getResponseHeaders().add("Access-Control-Allow-Origin", "*");

    if (httpExchange.getRequestMethod().equalsIgnoreCase("OPTIONS")) {
      logger.info("OPTIONS request");
      httpExchange.getResponseHeaders().add("Access-Control-Allow-Methods", "POST, OPTIONS");
      httpExchange.getResponseHeaders()
          .add("Access-Control-Allow-Headers", "Content-Type,Authorization");
      httpExchange.sendResponseHeaders(204, -1);
      return;
    }

    if (!httpExchange.getRequestMethod().equals("POST")) {
      String response = "This method only supports POST";
      httpExchange.sendResponseHeaders(405, response.length());
      OutputStream outputStream = httpExchange.getResponseBody();
      outputStream.write(response.getBytes());
      outputStream.flush();
      outputStream.close();
      return;
    }

    ConvertRequest request = null;
    try (Reader reader = new InputStreamReader(httpExchange.getRequestBody())) {
      request = GSON.fromJson(reader, ConvertRequest.class);
    } catch (Exception e) {
      logger.log(Level.SEVERE, "Failed to convert request JSON to AutoValue", e);
      StringWriter sw = new StringWriter();
      PrintWriter pw = new PrintWriter(sw);
      e.printStackTrace(pw);
      String response = sw.toString();

      httpExchange.sendResponseHeaders(400, response.length());
      OutputStream outputStream = httpExchange.getResponseBody();
      outputStream.write(response.getBytes());
      outputStream.flush();
      outputStream.close();
    }
    logger.info(String.format("Request:\n%s", request));

    httpExchange.getResponseHeaders().set("Content-Type", "audio/mpeg");
    httpExchange.getResponseHeaders()
        .set("Content-Disposition", "attachment; filename=\"combined.mp3\"");
    byte[] response = Resources.toByteArray(Resources.getResource(ApiServlet.class, "test.mp3"));
    httpExchange.sendResponseHeaders(200, response.length);
    OutputStream outputStream = httpExchange.getResponseBody();
    outputStream.write(response);
    outputStream.flush();
    outputStream.close();
  }
}
