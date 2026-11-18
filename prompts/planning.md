# Prompt 1: Planning

Use this prompt before touching any code. It forces the coding agent to thoroughly inspect the repository, map requirements to acceptance criteria, and define verification strategies before writing an implementation.

---

```markdown
Write a detailed implementation plan as a markdown document. Do not start implementation. Stop once the plan is saved and wait for my approval.

Scope & Inspection:
- State the target project/service and the exact files you expect to touch or create.
- Inspect the existing codebase first and verify facts. Never invent APIs, dependencies, or runtime assumptions.
- Map every requirement directly to a concrete task and a testable acceptance criterion.

Risk Analysis & Architecture:
- List all applicable edge cases, failure modes, race conditions, security risks, and potential regressions.
- Choose the simplest robust solution that solves the problem (YAGNI). Preserve existing behavior and avoid unnecessary abstractions.
- Define explicit validation, error handling, retries, and rollback/recovery where applicable.

Verification Strategy:
- Define exactly how each criterion will be verified: automated tests where the project has test tooling, otherwise exact manual reproduction steps or CLI commands.
- Do not add new test dependencies without asking me first.
- Explicitly list all unresolved assumptions, limitations, and remaining risks.

Adapt to the task. Do not over-engineer simple requests or claim every possible failure is eliminated.
```
