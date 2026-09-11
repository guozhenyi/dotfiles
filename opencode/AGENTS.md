<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->

## 浏览器自动化 (Playwright CLI)

调用 `playwright-cli` 操作浏览器时，**默认加 `--headed`**（`playwright-cli open --headed <url>` 等），带浏览器窗口便于人机协同观察操作过程。除非任务明确要求无窗口（如纯后台脚本），不要默认 headless。

## 全局代码与文件规范

### Python 格式化规范
- **格式化工具**：所有 Python 代码必须统一使用全局安装的 `ruff` 进行格式化。
- **环境自检与安装**：在执行格式化操作前，AI 必须先检查系统是否已全局安装 `ruff`。如果未安装，需主动执行 `pip install ruff` 进行全局安装，确保工具可用后再继续后续任务。

### 文件编辑规范
- **保留原有换行符**：在读取、修改或重写任何文件时，必须严格保留文件原有的换行符格式（如 LF、CRLF 或 CR）。禁止在编辑过程中擅自更改、统一或转换换行符，以确保与项目原有版本控制（如 Git）的换行策略保持一致，避免产生不必要的差异。

## GitHub 访问代理

当无法访问 GitHub 时，按以下顺序检查代理：

1. 检查 `http://127.0.0.1:7897` 是否开启
2. 检查 `http://127.0.0.1:33331/commands/pac` 是否开启

若任一代理可用，临时通过该代理访问 GitHub。

**注意**：`7897` 实际为 SOCKS5 代理（`33331/commands/pac` 返回的 PAC 文件内容为 `PROXY 127.0.0.1:7897; SOCKS5 127.0.0.1:7897; DIRECT`），`webfetch` 等基于 HTTP CONNECT 的工具无法直接使用，需通过 SOCKS5 访问，例如：

```bash
curl --socks5-hostname 127.0.0.1:7897 https://github.com/vuejs/core
```
