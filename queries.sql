#projetar  publicações do feed de um usuário
SELECT id_publicacao 
FROM 
	publicacao p JOIN usuario_seguidor s ON (p.id_usuario = s.id_usuario_segue) 
	JOIN usuario u ON (s.id_usuario = u.ID)
WHERE u.ID = 1
ORDER BY p.`Timestamp` desc

#projetar stories por usuário
SELECT id_story 
FROM 
	stories p JOIN usuario_seguidor s ON (p.id_usuario = s.id_usuario_segue) 
	JOIN usuario u ON (s.id_usuario = u.ID)
WHERE u.ID = 1
AND now() - p.`timestamp` < 86400000
ORDER BY p.`Timestamp` desc


#projetar nome de usuários que um determinado usuário segue
SELECT u.NomeUsuario
FROM usuario u JOIN usuario_seguidor s ON s.id_usuario_segue = u.ID
WHERE s.id_usuario = 1

#projetar historico de um usuário
SELECT h.`timestamp`,h.interacao
FROM usuario u JOIN historico h ON h.id_usuario = u.ID
WHERE u.ID = 64


#projetar nome de colecao de um usuário
SELECT c.Nome
FROM usuario u JOIN colecao c ON u.ID = c.id_usuario
WHERE u.ID = 49