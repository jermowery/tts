package com.jermowery.audio.server;

import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ApiServer {

  private final static Logger logger =
      Logger.getLogger(ApiServer.class.getName());

  public static void main(String[] args) throws IOException {
    InetAddress ip;
    try (final DatagramSocket socket = new DatagramSocket()) {
      socket.connect(InetAddress.getByName("8.8.8.8"), 10002);
      ip = socket.getLocalAddress();
    } catch (Exception e) {
      logger.log(Level.SEVERE, "Could not get IP address quitting.", e);
      return;
    }
    HttpServer server = HttpServer.create(new InetSocketAddress(ip, 8001), 0);
    ThreadPoolExecutor threadPoolExecutor = (ThreadPoolExecutor) Executors.newFixedThreadPool(100);
    server.createContext("/api", new ApiServlet());
    server.createContext("/", new UiServlet());
    server.createContext("/*", new UiServlet());
    server.setExecutor(threadPoolExecutor);
    server.start();
    logger.info(String.format("ApiServer started at http:/%s", server.getAddress()));
  }
}
