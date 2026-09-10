---
name: daily-email-summary
description: Fetch the last 24 hours of email and send a summary email back to the user. Use when the user invokes /daily-email-summary or asks to summarize today's/recent emails.
---

Using the email connector available in this session (for Gmail: search_threads, get_thread, get_message, send_message), find all emails received in the last 24 hours (from now, going back one day) in the inbox.

For each email, note the sender, subject, and a one to two sentence summary of the content. Group the summary by sender or topic where it makes sense, and call out anything that looks like it needs a reply or action from the user (e.g. OTPs, security alerts, interview requests, deadlines), with a suggested next step. Keep the whole summary concise and scannable — use short bullet points, not long paragraphs.

Exclude any thread that is itself a previous "Daily Email Summary" email sent by this skill.

Then send this summary as a new email to {{OWNER_EMAIL}} with subject "Daily Email Summary - <today's date>". Do not reply to or modify any of the original emails — only read them and send the one summary email.

If no email connector is available, say so and stop.
