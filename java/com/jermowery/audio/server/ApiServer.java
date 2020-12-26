package com.jermowery.audio.server;

import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.logging.Logger;

public class ApiServer {

  private final static Logger logger =
      Logger.getLogger(ApiServer.class.getName());

  public static void main(String[] args) throws IOException {
    HttpServer server = HttpServer.create(new InetSocketAddress("localhost", 8001), 0);
    ThreadPoolExecutor threadPoolExecutor = (ThreadPoolExecutor) Executors.newFixedThreadPool(100);
    server.createContext("/api", new ApiServlet());
    server.setExecutor(threadPoolExecutor);
    server.start();
    logger.info("Server started at http://localhost:8001");
  }
}
