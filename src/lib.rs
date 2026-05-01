use serde::Serialize;
use worker::*;

#[derive(Serialize)]
struct HealthResponse<'a> {
    status: &'a str,
    service: &'a str,
}

#[event(start)]
fn start() {
    console_error_panic_hook::set_once();
}

#[event(fetch)]
async fn main(req: Request, _env: Env, _ctx: Context) -> Result<Response> {
    match (req.method(), req.path().as_str()) {
        (Method::Get, "/") => html_response(index_html()),
        (Method::Get, "/api/health") => health_response(),
        _ => Response::error("Not Found", 404),
    }
}

fn health_response() -> Result<Response> {
    let body = HealthResponse {
        status: "ok",
        service: "algosul-blog",
    };

    Response::from_json(&body)
}

fn html_response(body: &str) -> Result<Response> {
    let headers = Headers::new();
    headers.set("content-type", "text/html; charset=utf-8")?;

    Ok(Response::from_body(ResponseBody::Body(body.into()))?.with_headers(headers))
}

fn index_html() -> &'static str {
    r#"<!doctype html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Algosul</title>
    <style>
      :root {
        color-scheme: light dark;
        font-family: Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
        background: #f7f3ea;
        color: #1c1f24;
      }

      body {
        min-height: 100vh;
        margin: 0;
        display: grid;
        place-items: center;
      }

      main {
        width: min(720px, calc(100% - 32px));
      }

      h1 {
        margin: 0 0 16px;
        font-size: clamp(2.5rem, 8vw, 5rem);
        line-height: 0.95;
      }

      p {
        max-width: 48rem;
        margin: 0;
        font-size: 1.125rem;
        line-height: 1.7;
        color: #47505c;
      }

      a {
        color: #0f766e;
      }
    </style>
  </head>
  <body>
    <main>
      <h1>Algosul</h1>
      <p>这是一个运行在 Cloudflare Workers 上的 Rust 后端网站。API 健康检查位于 <a href="/api/health">/api/health</a>。</p>
    </main>
  </body>
</html>"#
}
