## Shell 环境 (Windows)
- **首选**：始终优先使用 PowerShell 7 (`pwsh`) 执行命令。
- **降级**：若遇到兼容性问题（如旧模块、COM 对象等），可回退到 Windows PowerShell 5.1 (`powershell.exe`)，但必须在输出中说明原因。

<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->

## 浏览器自动化 (Playwright CLI)

- **默认模式**：调用 `playwright-cli` 时始终加 `--headed`（如 `playwright-cli open --headed <url>`），便于人机协同观察。
- **例外**：仅当任务明确要求纯后台运行时，才使用 headless 模式。

## 文件与代码规范

### 换行符规则
- **已有文件**：严格保留原有换行符格式（LF / CRLF / CR），禁止擅自转换。
- **新建文件**：统一使用 `LF`。

### Python 格式化
- **工具**：统一使用全局安装的 `ruff`。
- **自检**：执行前必须先检查 `ruff` 是否可用；若未安装，主动执行 `pip install ruff` 后再继续。

## GitHub 访问代理

当无法访问 GitHub 时，按以下顺序检查代理：

1. 检查 `http://127.0.0.1:7897` 是否开启
2. 检查 `http://127.0.0.1:33331/commands/pac` 是否开启

若任一代理可用，临时通过该代理访问 GitHub。

**注意**：`7897` 实际为 SOCKS5 代理（`33331/commands/pac` 返回的 PAC 文件内容为 `PROXY 127.0.0.1:7897; SOCKS5 127.0.0.1:7897; DIRECT`），`webfetch` 等基于 HTTP CONNECT 的工具无法直接使用，需通过 SOCKS5 访问，例如：

```bash
curl --socks5-hostname 127.0.0.1:7897 https://github.com/vuejs/core
```
