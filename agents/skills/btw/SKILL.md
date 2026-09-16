---
name: btw
description: Answer a quick side question ("by the way" question) asked in the middle of a session. The question may or may not relate to the current work. The answer is chat-only - purely conversational, never using tools, never reading or writing files, never executing commands. Intended to be invoked explicitly through the btw skill command.
disable-model-invocation: true
---

# BTW — Side Question

The user is pausing the ongoing work to ask a quick question — a "by the way" moment. It may be related to the current task or completely orthogonal. Treat it as a conversation, not a task.

## How to answer

1. **Answer directly in chat.** Give a clear, concise conversational answer. If the question is short, the answer should be short. If it needs depth (an explanation, a comparison, a worked example), give it — in prose or with inline code snippets — but still as a chat reply.

2. **Do not use any tools.** For the duration of this exchange you are in conversation mode:
   - Do **not** read files.
   - Do **not** write or edit any files (no code changes, no documents, no notes, no scratch files).
   - Do **not** execute any commands (no shell, no scripts, no builds, no git).
   - Do **not** run web searches or fetch resources.
   Answer from what you already know and from context already in the session. If you don't know something and cannot answer without external information, say so honestly and suggest how the user could find out.

3. **Do not act on the answer.** Never follow an answer with an implementation: no edits, no plans to edit, no "want me to apply this?". The user decides what, if anything, to do next. If the question reveals a better approach for the ongoing work, you may mention that observation briefly — as a suggestion in chat, nothing more.

4. **Do not derail the session.** Don't restate the ongoing work, don't summarize, don't ask follow-up questions unless a genuine ambiguity blocks answering. After answering, stop. The user will resume the main task (or not) at their pace.

5. **Respect scope.** The question sets the scope. Don't expand it into research, refactoring proposals, or unsolicited extra advice beyond a brief relevant note.

## Edge cases

- **The question can only be answered by reading a file or running a command** (e.g. "btw, what does this function return?"). State that answering it properly would require tool use, give your best answer from context/knowledge, and ask the user to explicitly request the check (outside of a btw question) if they want the verified answer. Never just go ahead and read/exec.
- **The question is ambiguous.** Ask one clarifying question in chat instead of guessing at length.
- **The question requests destructive or irreversible actions.** This skill forbids acting anyway; just answer about the topic.
