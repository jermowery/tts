# tts

[![Build Status](https://travis-ci.com/jermowery/tts.svg?branch=master)](https://travis-ci.com/jermowery/tts)

A server and a UI for converting Text to Speach with multiple voices.

Supports:

* Customizing the voice for an individual block of text or ssml
* Using text or SSML

To run the app do the following:

1. Run the server with:
   ```
   bazel run //java/com/jermowery/audio/server:ApiServer
   ```
2. Set the IP address of the server in app.component.ts for this.http.post
3. Do
   ```
   ng serve
   ```
