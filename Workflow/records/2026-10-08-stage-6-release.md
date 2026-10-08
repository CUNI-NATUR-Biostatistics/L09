# L09 v1.1.0 release record

- Date: 2026-10-08, Europe/Prague.
- Target tag: `L09-v1.1.0-20261008`.
- Initial main: `7dec7e666e681f0b35fea2ab4dc307627a20b908`; presentation and exercise PRs merged.
- Release authorized by Ondřej Mottl in the current conversation: “Please make a new Release for L09”.
- Finished-exercise human approval: Ondřej Mottl explicitly approved the finished exercise on 2026-10-08.
- Explicit exception: Ondřej Mottl selected “Approve the exercise; explicitly waive the title-image requirement for this release”. The title slide still has no lesson-derived generated title image. This known requirement is waived only for this release and remains outstanding for future releases.
- Changes: distribute the approved eight-core/twenty-optional Czech worksheet alongside the existing 63-tree CSV; publish merged PollsLive answer-balance changes; update public README to stable exercise/data routes and remove pending-draft instructions. Approved lecture sources, renders and dataset are not changed by this release preparation.
- Git publication: release-documentation changes use a dedicated `release/l09-v1.1.0` branch and PR before tagging merged `main`; separate authorization required for the named Git operations.

## Validation before tag

The merged worksheet parsed and sourced in a clean R 4.5.1 `--vanilla` session using only the distributed script and CSV. Missing-file recovery, all 28 reference solutions, six mechanically derived numeric checks, row identities, metric rankings, reference-level invariance, coefficient counts and deliberately invalid comparison scenarios passed. Prior full-script independent reviews are recorded in the exercise blueprint. No student classroom timing trial was performed; the direct-work estimate remains 70 minutes within the approved 120-minute session.

Package exact committed Git bytes rather than CRLF-converted worktree bytes. Validate the ten-file public allowlist, every checksum, ZIP integrity, and exercise/data recovery from extracted files. Exclude Workflow, private answers and reference outputs. No lecture render is needed for these metadata-only changes; the released lecture outputs are already committed and approved. Pages uses Actions, permits main and L09-v* tags, and the repository is public.

## Public verification after publication

- GitHub release: `https://github.com/CUNI-NATUR-Biostatistics/L09/releases/tag/L09-v1.1.0-20261008`.
- Stable route: `https://cuni-natur-biostatistics.github.io/L09/current/`.
- Immutable route: `https://cuni-natur-biostatistics.github.io/L09/releases/L09-v1.1.0-20261008/`.
- Exercise: stable route plus `code/cviceni.R`.
- Dataset: stable route plus `data/allometrie_stromu.csv`.
- HUB: `https://cuni-natur-biostatistics.github.io/`; verify new tag and stable exercise link independently.

Release, Pages and HUB verification remain pending until the authorized publication is performed. Do not infer public resource availability from workflow success alone. Any recovery dispatch needs its own authorization. Record the title-image exception even after successful publication.
