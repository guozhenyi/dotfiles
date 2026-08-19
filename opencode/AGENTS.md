<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->

## 浏览器自动化 (Playwright CLI)

调用 `playwright-cli` 操作浏览器时，**默认加 `--headed`**（`playwright-cli open --headed <url>` 等），带浏览器窗口便于人机协同观察操作过程。除非任务明确要求无窗口（如纯后台脚本），不要默认 headless。

## GitHub 访问代理

当无法访问 GitHub 时，按以下顺序检查代理：

1. 检查 `http://127.0.0.1:7897` 是否开启
2. 检查 `http://127.0.0.1:33331/commands/pac` 是否开启

若任一代理可用，临时通过该代理访问 GitHub。

**注意**：`7897` 实际为 SOCKS5 代理（`33331/commands/pac` 返回的 PAC 文件内容为 `PROXY 127.0.0.1:7897; SOCKS5 127.0.0.1:7897; DIRECT`），`webfetch` 等基于 HTTP CONNECT 的工具无法直接使用，需通过 SOCKS5 访问，例如：

```bash
curl --socks5-hostname 127.0.0.1:7897 https://github.com/vuejs/core
```
