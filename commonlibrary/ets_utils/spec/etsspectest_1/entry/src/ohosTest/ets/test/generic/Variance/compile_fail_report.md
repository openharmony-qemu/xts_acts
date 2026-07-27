# Compile Fail Report - M09 Variance

## Current Submission

This package currently submits positive runnable test points only.

## Compile-Fail / Boundary Status

| GTP ID | Expected Case | Status |
|---|---|---|
| GTP-VA-001 | `out T` syntax acceptance or rejection | Deferred as boundary |
| GTP-VA-002 | `in T` syntax acceptance or rejection | Deferred as boundary |
| GTP-VA-003 | `in out T` syntax acceptance or rejection | Deferred as boundary |
| GTP-VA-005 | Covariance reverse assignment rejected | Deferred |
| GTP-VA-007 | Contravariance reverse assignment rejected | Deferred |
| GTP-VA-008 | Invariance rejects both directions | Deferred |
| GTP-VA-009 | `out T` used in input position rejected | Deferred |
| GTP-VA-010 | `in T` used in output position rejected | Deferred |

## Toolchain Observation

DevEco/ArkTS reported parse errors for inline variance markers such as `interface Consumer<in T>` and `interface InvariantHolder<in out T>`. To keep this submission runnable, those markers are not present in the positive suite.

## Build Record

| Item | Value |
|---|---|
| Toolchain version | Pending full record |
| Compile command | Pending |
| Compile date | Pending |
| Actual diagnostics | Inline variance markers rejected by current DevEco parser; exact version/diagnostics pending |
