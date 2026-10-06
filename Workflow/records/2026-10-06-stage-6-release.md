# Stage 6 — First stable release readiness

## Metadata and authorization

- Lesson: L09 — Porovnání kandidátních modelů.
- Academic year: 2026-27.
- Date: 2026-10-06.
- Reviewer and release approver: Ondřej Mottl.
- Approved release scope: written materials, the complete 55-slide presentation, tree data, source QMD files, licensing and data provenance. The unfinished exercise is explicitly omitted from this release.
- Release-fix branch: `release/l09-v1.0.0`, based on merged `main` at `c6c2d096ba81762ffd080e4bbc1d56b89bcda77b` (presentation PR #3).
- The author approved the release-fix branch/commit/push/PR/merge sequence and making L09 public with GitHub Actions Pages enabled before releasing.

## Review and validation

- Written materials received final human approval in PR #2. Presentation PR #3 includes the approved story map and knowledge-state ledger, independent review outcomes, generated-image provenance, and final human approval of the 55-slide deck on 2026-10-06.
- Earlier independent complete-deck reviews and the image integration review passed. Subsequent author polish and the animation/fallback slides were rendered, visually inspected and human-approved; a separate independent review of those subsequent changes is not recorded.
- The committed presentation PDF has 55 pages and `Presentation/presentation.html` is identical to `docs/index.html`. This release uses the reviewed committed outputs; no new teaching-content render is needed for the manifest/README fix.
- The canonical website packager validated the release allowlist and built the proposed bundle with nine selected files. The unfinished `Exercises/cviceni.R` template is preserved in the source repository but excluded with `exercises: []`; the README no longer advertises it as ready.
- Credential-free PollsLive validation passed locally and on merged `main`. Synchronized PollsLive rendering remains unverified; live scheduler activation is a separate workstream.
- The dataset has 63 non-personal tree observations. Its data README records `lgrdata` 0.1.1, the original measurement attribution, CC0 terms and the CSV checksum. The manifest includes data provenance and `LICENSE.md`, which preserves the CC BY 4.0 educational-content / MIT software split and third-party exclusions.
- Repository-history audit covered 13 commits and 131 distinct historical blobs, including source text, extracted PDF text and the raster-asset inventory. No credential-pattern hits or sensitive-file candidates were found. Email matches are public third-party package metadata and a RevealJS search-plugin author attribution; no student records or private assessments were found. Large binary files are the reviewed teaching outputs and generated illustrations/animation.
- The former preview failure was caused by absent Pages configuration. L09 is now public, Pages uses GitHub Actions, and `github-pages` deployment policies permit exactly the `main` branch and `L09-v*` tags.
- Public documentation sends students to the HUB and stable `/L09/current/` materials, distinguishing them from `main` and `preview`.

## Release target and distribution

- Tag: `L09-v1.0.0-20261006`, to be created on the merged release-fix commit.
- Expected asset: `web-materials-L09-v1.0.0-20261006.zip`.
- Stable written materials: `https://cuni-natur-biostatistics.github.io/L09/current/learning/` and `learning/skripta.pdf`.
- Stable presentation: `https://cuni-natur-biostatistics.github.io/L09/current/presentation/` and `presentation/presentation.pdf`.
- Immutable snapshot: `https://cuni-natur-biostatistics.github.io/L09/releases/L09-v1.0.0-20261006/`.
- The existing tag-triggered workflow creates the release bundle, assembles and verifies lesson Pages, then notifies the HUB when its existing GitHub App configuration permits it. Release creation, deployed lesson routes and HUB propagation must be checked separately after the tag is pushed.

## Decision

- [x] Approved written and presentation outputs are committed.
- [x] Exercise explicitly omitted pending its own authoring/review workstream.
- [x] Release allowlist, licensing, provenance and public-source visibility checked.
- [x] GitHub Actions Pages and deployment policies configured.
- [x] Ready to create the first stable release after the focused release-fix PR is merged.
- Remaining limits: synchronized PollsLive behavior and scheduler activation are outside this release; practical exercises will arrive in a separate reviewed release. Publication results are recorded by the GitHub release and its associated Actions runs.
