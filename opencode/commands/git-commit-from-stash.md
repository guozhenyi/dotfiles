---
description: 根据暂存区内容生成中文 commit msg 并提交
agent: build
#model: opencode/deepseek-v4-flash-free
---

查看已暂存的文件变更，参考如下命令：
git status --short
git diff --cached --stat
git diff --cached

请根据已暂存的文件变更，选择合适的前缀并生成中文 commit message，然后直接执行 git commit。

要求：
1. 从以下 Conventional Commits 前缀中选择最合适的一个：feat, fix, style, refactor, perf, test, docs, chore, ci, build, revert
2. commit message 用中文编写
3. 格式为：<前缀>: <中文描述>
4. 如果变更较多，在正文中用要点列出，要点只写核心变更，略去实现细节（如"用 / 替换 join"）
5. 标题已涵盖的内容不要在要点中重复；无足轻重的细节（如"移除多余 import"）无需列出；标题能说清时，要点可省略
8. 使用多个 -m 会导致每个 -m 之间产生空行，要点应合并到同一个 -m 中用换行分隔
9. 直接执行 git commit 命令提交，不要只给我建议