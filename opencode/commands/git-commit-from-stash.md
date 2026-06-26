---
description: 根据暂存区内容生成中文 commit msg 并提交
agent: build
#model: opencode/deepseek-v4-flash-free
---

查看已暂存的文件变更，参考如下命令：
git status --short
git diff --cached --stat
git diff --cached

请根据上述变更，选择合适的前缀并生成中文 commit message，然后直接执行 git commit。

要求：
1. 从以下 Conventional Commits 前缀中选择最合适的一个：feat, fix, style, refactor, perf, test, docs, chore, ci, build, revert
2. commit message 用中文编写
3. 格式为：<前缀>: <中文描述>
4. 如果变更较多，在正文中用要点列出
5. 直接执行 git commit 命令提交，不要只给我建议
