# Prompt 3: Production Readiness Review (Diff-Grounded Audit)

> **Context Recommendation:** Run this prompt in a **fresh context or separate subagent** to reduce confirmation bias. An agent that wrote the code should not audit its own reasoning from session memory: this audit is strictly grounded in the raw git diff and executable test output.

---

```markdown
Before deployment or committing, independently audit the actual implementation in the repository.

Audit Methodology:
- Start with `git status`, `git diff`, and `git diff --cached` (or `git diff HEAD`) to inspect both unstaged and staged changes.
- Read every untracked file listed in `git status`, as `git diff` does not show them.
- If the work is already committed, diff against the base branch (`git diff origin/main...HEAD` or target branch).
- Inspect surrounding code and external caller integration points.
- Trust only the actual code, repository state, and verifiable evidence, never session memory or previous conversational claims of what was done. Use the approved plan solely as the checklist of requirements.

Inspection Checklist:
- Logical bugs, broken control flow, flawed assumptions, and missing requirement edge cases.
- Edge cases: invalid or missing data, nulls, empty collections, boundary conditions, unexpected state transitions.
- Integration points: caller contracts, API schemas, service dependencies, configuration flags, conditional branches.
- Production hygiene: concurrency safety, safe retries/idempotency, data integrity, secrets leakage, performance regressions.
- Deployment safety: environment variables, migrations, dependency changes, rollback readiness.

Verification & Remediation:
- Verify real runtime behavior, not merely compilation. Run the relevant automated tests and checks.
- Add or update tests for uncovered risks where the project has test tooling. Do not install new dependencies without asking me first.
- For every confirmed issue:
  1. Explain root cause and blast radius.
  2. Apply the smallest targeted fix. If a fix requires architectural changes or altering public contracts, stop and ask me first.
  3. Re-inspect the affected code and updated git diff.
  4. Re-run relevant verification commands to confirm the fix.

Safety Boundaries:
- Zero speculative fixes, zero unrelated cosmetic refactoring, and never discard existing user modifications.
- Never weaken assertions or delete tests to make the suite pass.
- Never print secrets, API tokens, or `.env` contents.
- Do not commit or push to remote.
- Do not declare production readiness while known critical issues remain or verification is unexecuted. Clearly separate verified results from untested behavior and residual risks.

Evidence Rules:
- A check counts as verified only if you name how a real user reaches the thing. A check that jumps to an address no user can reach does not count.
- Paste the literal command output for each check, or write BLOCKED with the reason. Never write "tests should pass".
- New tests must be shown failing first (on the old code or a stub), then passing.
- Check one nearby behavior the change could have broken, not only the requested one.
- If the project has no tests, say so and offer the smallest smoke check. Ask before adding any dependency.
- If this session was compacted, run this audit again from the real diff, not from the summary.
- End with a section named "Could not verify": what you did not run, and why.

Request manual user testing only after the review, targeted fixes, and automated verification are complete. Provide the exact reproduction scenarios and expected behavior to confirm.
```
