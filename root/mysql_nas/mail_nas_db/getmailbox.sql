SELECT message_id, subject, sender, receiver, content, send_time
FROM messages
INNER JOIN mailboxes ON messages.receiver = mailboxes.email_address
WHERE mailboxes.user = 'user';
