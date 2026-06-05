---
description: 审查暂存区代码，报告问题但不修改
agent: plan
#model: opencode/deepseek-v4-flash-free
---

请审查以下暂存区中的代码变更：
!`git diff --cached --stat`
!`git diff --cached`

请进行代码审查，重点关注：
1. 潜在的 bug 或逻辑错误
2. 性能问题
3. 安全漏洞
4. 代码风格和规范问题
5. 可维护性问题

要求：
- 只报告问题，不要直接修改代码
- 每个问题列出所在文件和行号
- 给出改进建议，但不要帮我改
