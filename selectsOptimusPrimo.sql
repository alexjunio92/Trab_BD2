-- *** SqlDbx Personal Edition ***
-- !!! Not licensed for commercial use beyound 90 days evaluation period !!!
-- For version limitations please check ht#projetar  publicações do feed de um usuário
EXPLAIN SELECT id_publicacao 
FROM 
	publicacao p JOIN usuario_seguidor s ON (p.id_usuario = s.id_usuario_segue) 
	JOIN usuario u ON (s.id_usuario = u.ID)
WHERE u.ID = 1
ORDER BY p.`Timestamp` DESC;

EXPLAIN SELECT p.id_publicacao
FROM usuario_seguidor s, usuario u, publicacao p
WHERE 
s.id_usuario_segue = p.id_usuario and
u.ID = s.id_usuario and
u.ID = 1
ORDER BY p.`Timestamp` DESC;
################################################################################
#projetar stories por usuário
EXPLAIN SELECT id_story 
FROM 
	stories p JOIN usuario_seguidor s ON (p.id_usuario = s.id_usuario_segue) 
	JOIN usuario u ON (s.id_usuario = u.ID)
WHERE u.ID = 1
AND now() - p.`timestamp` < 86400000
ORDER BY p.`Timestamp` DESC;

EXPLAIN SELECT s.id_story
FROM usuario_seguidor us, usuario u, stories s
WHERE
us.id_usuario_segue = s.id_usuario AND
u.ID = us.id_usuario AND
u.ID = 1 AND
now() - s.`timestamp` < 86400000;
################################################################################
#projetar nome de usuários que um determinado usuário segue
EXPLAIN SELECT u.NomeUsuario
FROM usuario u JOIN usuario_seguidor s ON s.id_usuario_segue = u.ID
WHERE s.id_usuario = 1;

EXPLAIN SELECT u.NomeUsuario
FROM usuario_seguidor s, usuario u
WHERE 
s.id_usuario_segue = u.ID and
s.id_usuario = 1;

################################################################################
#projetar historico de um usuário
EXPLAIN SELECT h.`timestamp`,h.interacao
FROM usuario u JOIN historico h ON h.id_usuario = u.ID
WHERE u.ID = 64;

EXPLAIN SELECT h.`timestamp`,h.interacao
FROM usuario u, historico h
WHERE 
h.id_usuario = u.ID and
u.ID = 64;

#projetar nome de colecao de um usuário
EXPLAIN SELECT c.Nome
FROM usuario u JOIN colecao c ON u.ID = c.id_usuario
WHERE u.ID = 49;

EXPLAIN SELECT c.Nome
FROM usuario u ,colecao c
WHERE 
u.ID = c.id_usuario and
u.ID = 49;