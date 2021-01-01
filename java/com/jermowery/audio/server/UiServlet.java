package com.jermowery.audio.server;

import com.google.common.io.Resources;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UiServlet implements HttpHandler {

  private static final Logger logger =
      Logger.getLogger(UiServlet.class.getName());

  @Override
  public void handle(HttpExchange httpExchange) throws IOException {
    httpExchange.getResponseHeaders().add("Access-Control-Allow-Origin", "*");

    if (!httpExchange.getRequestMethod().equalsIgnoreCase("GET")) {
      String response = "This method only supports GET";
      httpExchange.sendResponseHeaders(405, response.length());
      OutputStream outputStream = httpExchange.getResponseBody();
      outputStream.write(response.getBytes());
      outputStream.flush();
      outputStream.close();
      return;
    }

    String path = httpExchange.getRequestURI().getPath();
    if (path.isEmpty() || path.equals("/")) {
      path = "/index.html";
    }

    try {
      URL resource = Resources.getResource(String.format("ui/tts/dist/tts%s", path));
      byte[] response = Resources.toByteArray(resource);
      String mimeType = "";
      if (path.endsWith(".js")) {
        mimeType = "text/javascript";
      } else if (path.endsWith(".css")) {
        mimeType = "text/css";
      } else if (path.endsWith(".ico")) {
        mimeType = "image/vnd.microsoft.icon";
      } else if (path.endsWith(".html")) {
        mimeType = "text/html";
      }

      httpExchange.getResponseHeaders().set("Content-Type", mimeType);
      httpExchange.sendResponseHeaders(200, response.length);
      OutputStream outputStream = httpExchange.getResponseBody();
      outputStream.write(response);
      outputStream.flush();
      outputStream.close();
    } catch (IOException e) {
      logger.log(Level.SEVERE, "Failed to find resource", e);
      StringWriter sw = new StringWriter();
      PrintWriter pw = new PrintWriter(sw);
      e.printStackTrace(pw);
      String response = sw.toString();

      httpExchange.sendResponseHeaders(500, response.length());
      OutputStream outputStream = httpExchange.getResponseBody();
      outputStream.write(response.getBytes());
      outputStream.flush();
      outputStream.close();
    }
  }
}
