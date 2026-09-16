---
name: research
description: Research any topic or feature through a standalone markdown document before any planning or implementation. Use when the user asks to research, investigate, explore, or learn about something — whether it feeds a future feature (e.g. "research Go html templates") or is purely for learning (e.g. "research how CSS containment works"). All interaction happens through the research document, never through chat discussion.
---

# Research Document

Drive research entirely through a single markdown document. No planning, no production code, no chat discussion — the document is the only medium of exchange. The topic can be anything: a capability being considered for a feature, or a subject the user simply wants to learn about.

## Phase 1 — Receive the document

The user creates the research document themselves and passes it in with `@<document-name>` (or gives its path). The agent never creates research documents on its own initiative.

When a research request comes with a document:

1. Read the document in full.
2. If it is empty or skeletal, seed it from the template below, filling in the topic and initial questions. If it already has content, adopt the user's structure as-is — never impose the template over their organization.
3. If any required section is missing (Questions, Findings, Review Log), add it at the end without disturbing the user's content.

Template for reference (use only when seeding an empty/skeletal document):

```markdown
# Research: <Topic>

Status: draft          <!-- draft | in-review | ready -->
Updated: <date>

## Objective

<Why this research exists, in 1-3 sentences. For a future feature: what it
should enable. For a learning topic: what understanding is being sought.>

## Questions

<!-- Numbered questions this research must answer. Add/remove freely. -->

1. ...

## Findings

<!-- One section per question or theme. Every claim cites a source
     (URL, file path, doc name). Mark uncertain items with (unverified). -->

### <Question or theme>

- ...

## Constraints & Risks

<Anything discovered that constrains a future design or is an important
caveat: deprecations, version requirements, security notes, performance
characteristics, common misconceptions.>

## Options Considered

<!-- If multiple approaches or viewpoints exist, list them with trade-offs.
     No recommendation is final until Status becomes ready. -->

## Open Questions

<Unresolved items, with what's needed to resolve them.>

## Review Log

<!-- Append-only. One entry per review round:
     ### Review <n> — <date>
     Commenter / requested change / outcome. -->

## Conclusion

<Empty until Status: ready. Then: a short synthesis of what was learned,
and — if this research feeds a feature — what was decided and why. For
pure learning topics this can simply summarize the takeaways.>
```

4. Then immediately do a first research pass: investigate (docs, source code in the repo, official references) and fill in Findings, Constraints & Risks, and Open Questions.
5. End by telling the user only: the document path and what remains open. Nothing else.

If the user asks to research a topic but does not provide a document, do not start researching. Reply with one line asking them to create the document and pass it with `@<document-name>`.

## Phase 2 — Review loop (document-driven)

The user edits the document and asks you to review it (e.g. "review", "updated the doc"). When that happens:

1. Read the current document in full.
2. Do additional research only where the user's edits raise new questions or corrections.
3. Respond **in the document, not in chat**:
   - Answer questions by adding to Findings (with sources).
   - Push back or flag problems under a new `### Review <n>` entry in the Review Log, referencing section names or line content.
   - Move resolved questions out of Open Questions.
   - Update `Updated:` date.
4. Your chat reply must be minimal — at most one or two lines pointing to the document (e.g. "Review 2 added to docs/research/go-templates.md — see Review Log").

## Rules

- **Never write production code** while a research document has `Status: draft` or `in-review`. Snippets inside the document are fine.
- **Never produce a plan or task list** unless the document reaches `Status: ready`, the research feeds a feature, and the user asks for one. When that happens, write the Conclusion section first.
- The user is the decision maker: their edits to the document override your findings. Never revert their changes — respond to them.
- Every factual claim in Findings needs a source. Mark anything you could not verify with `(unverified)`.
- Keep the document self-contained: someone reading only this file should understand the topic.
- Append to the Review Log; never delete or rewrite previous entries.
- For learning-only topics there is no obligation to reach `Status: ready` or a Conclusion — the document is done when the user says so.
