# Trackmarks

Trackmarks is a Javascript library that tracks the bookmarklets run on a page. As an example, you could use it to log an event in your analytics when someone uses Instapaper on your blog post.

## Supported services

* Delicious
* Facebook
* Instapaper
* Read it Later
* Readability
* Tumblr
* Twitter

## Usage

    new Trackmarks(function(name, data) {
      alert(name + " bookmarklet used!");
    });