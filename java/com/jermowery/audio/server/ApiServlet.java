package com.jermowery.audio.server;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import java.io.IOException;
import java.io.OutputStream;

public class ApiServlet implements HttpHandler {

  @Override
  public void handle(HttpExchange httpExchange) throws IOException {
    if (!httpExchange.getRequestMethod().equals("GET")) {
      return;
    }
    String empty = "{}";
    httpExchange.getResponseHeaders().set("Content-Type", "application/json");
    httpExchange.sendResponseHeaders(200, empty.length());
    OutputStream outputStream = httpExchange.getResponseBody();
    outputStream.write(empty.getBytes());
    outputStream.flush();
    outputStream.close();
  }
}
