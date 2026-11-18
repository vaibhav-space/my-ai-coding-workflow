# Prompt 1: Planning

Use this prompt before touching any code. It forces the coding agent to thoroughly inspect the repository, map requirements to acceptance criteria, and define verification strategies before writing an implementation.

---

```markdown
Write a detailed implementation plan as an interactive Artifact page (HTML), not a markdown file. Do not start implementation. Stop once the page is published and wait for my approval.

Scope & Inspection:
- State the target project/service and the exact files you expect to touch or create.
- Size the task from the files it touches (3 or fewer, all named in the task, is small), not from how it feels.
- If the repo has a gotchas file (for example `gotchas.md`), read it first.
- Inspect the existing codebase first and verify facts. Never invent APIs, dependencies, or runtime assumptions.
- Map every requirement directly to a concrete task and a testable acceptance criterion.

Risk Analysis & Architecture:
- List all applicable edge cases, failure modes, race conditions, security risks, and potential regressions.
- Choose the simplest robust solution that solves the problem (YAGNI). Preserve existing behavior and avoid unnecessary abstractions.
- Define explicit validation, error handling, retries, and rollback/recovery where applicable.

Verification Strategy:
- Define exactly how each criterion will be verified: automated tests where the project has test tooling, otherwise exact manual reproduction steps or CLI commands.
- Do not add new test dependencies without asking me first.
- If the project has no tests, say so and offer the smallest smoke check. Ask before adding any dependency.
- Explicitly list all unresolved assumptions, limitations, and remaining risks.

Adapt to the task. Do not over-engineer simple requests or claim every possible failure is eliminated.

Presentation (the page must make it obvious what is going to happen):
- Use ~/.claude/plan-template.html as the layout reference: same sections and style, new content.
- Open with a short summary and stats: step count, new vs changed files, total time.
- Show a file table (New / Changed) with a filter, so I see the whole diff at a glance.
- Draw the key flow as a diagram (login flow, data flow, request pipeline, whichever applies).
- Give every step: a diff-style block (+ new, ! changed) saying exactly what changes, a time estimate, and one tickable check. A sticky progress bar counts ticked steps and time left.
- Add a to-scale timeline, a choices section (picked / later / rejected, with cost), and a risks table with severity and an undo plan.
- Plain language, short lines, no real code. Label every assumption as my call so I can change it.
- Keep it comment-friendly: stable headings, one idea per block.
- The page is hosted by the tool. If the plan contains secrets or client data, ask me before publishing.
- If there is no Artifact tool, or no template file, write the same sections as a markdown document and stop once it is saved.
```
