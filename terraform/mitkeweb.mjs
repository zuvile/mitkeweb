export default {
  async fetch(request, env, ctx) {
    return new Response("200", {
      headers: { "content-type": "text/plain" },
    });
  },
};
