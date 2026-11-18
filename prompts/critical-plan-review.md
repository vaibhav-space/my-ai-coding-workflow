# Prompt 2: Critical Plan Review (Adversarial Red-Teaming)

Use this prompt after the initial plan is drafted, ideally in a fresh context or subagent to reduce self-confirmation bias. A different model than the one that wrote the plan catches different blind spots. It commands the model to act as an independent senior engineer challenging assumptions and stress-testing the plan before any code is written.

---

```markdown
Act as an independent senior principal engineer conducting a rigorous, production-focused review of this implementation plan.

Review Directives:
- Verify complete requirement coverage, technical feasibility, dependency constraints, and compatibility with the existing system.
- Actively seek out overlooked edge cases, hidden assumptions, failure scenarios, race conditions, security risks, performance bottlenecks, and potential regressions.
- Challenge every unsupported assumption. Do not accept vague implementation steps or unverified architectural claims.
- For every identified issue, explain its concrete impact, severity, mitigation strategy, and required verification method.
- Check error handling, timeouts, safe retries, idempotency, data integrity, backward compatibility, and rollback/recovery wherever relevant.
- Verify that acceptance criteria and tests cover both normal operation and critical failure paths.
- Read the code the plan touches. Do not judge the plan from the plan text alone. If the repo has a gotchas file, check the plan against it.
- List the real findings. If you find none, show exactly what you checked instead of saying it looks solid.

YAGNI & Scope Discipline:
- Distinguish critical failure modes from low-probability hypothetical edge cases. Do not introduce speculative abstractions or over-engineer for scenarios that violate YAGNI.
- Revise the plan to resolve confirmed critical gaps. Do not approve the plan while high-severity architectural or data integrity risks remain.

Required Output:
1. Verdict (Approve / Reject / Changes Requested).
2. Prioritized findings categorized by severity (Critical, Major, Minor).
3. Corrected implementation plan incorporating necessary mitigations.
4. Remaining residual risks or explicitly unverified assumptions. Never claim zero risk without verifiable evidence.
```
