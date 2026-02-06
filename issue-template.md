### GitHub Adapter for Mission Control

We need to use GitHub Issues as source of truth (repo: cyberstorm-nisto/nisto-backlog) instead of MC local DB.

Tasks:
1) Read-only sync: MC tasks board shows issues from nisto-backlog, mapping labels->status.
2) Writes: Create/update task writes to GH issue (title/body/labels/assignee/comments).
3) Comments/activity: MC actions append comments to GH issue.
4) Deliverables/reviews: structured comment (checklist) for deliverables + review statuses.
5) Config: repo name + label→status mapping env/config.
6) Minimal local state: sessions/planning state cached; tasks canonical in GH.

Status mapping (initial):
- planning, inbox, assigned, in_progress, testing, review, done, blocked
(Implement as labels; default column if none set.)

We'll add Jira adapter later; not in scope yet.
