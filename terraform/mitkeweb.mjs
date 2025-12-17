export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    if (url.hostname.startsWith("www.")) {
      url.hostname = url.hostname.substring(4);
      return Response.redirect(url.toString(), 301);
    }
    return new Response("200", {
      headers: { "content-type": "text/plain" },
    });
  },
};
