CREATE materialized VIEW view AS
SELECT c.id,
    c.chat_name,
    count(m.message_text) AS tot_messages,
    m."timestamp" AS last_message_created_at,
    m.user_id AS last_message_user_name,
    m.message_text AS last_message_content
   FROM (chatroom c
     LEFT JOIN message m ON ((c.id = m.chatroom_id)))
  GROUP BY DISTINCT c.id, m."timestamp", m.user_id, m.message_text
  ORDER BY m."timestamp" DESC
 LIMIT 1;