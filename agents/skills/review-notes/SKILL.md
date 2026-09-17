---
name: review-notes
description: Review user notes in a spec, update acceptance criteria, and summarize changes.
---

# Command: review-notes

1. **Target:** Open `$1`.
2. **Extract:** Find all the comments with a `note:`.
3. **Refactor:** 
   - Review the notes and modify the spec.
   - Remove the raw notes section once integrated.
4. **Output:** Provide a concise bulleted diff of what changed and flag any contradictions. Doesn't print that you have removed the notes comments.
5. **Guardrail:** Do NOT write or modify application code or tests until the updated spec is approved.
