#dia 2 Query1
#não foi encontrado a sintaxe para EXCEPT, dessa forma foi utilizado o <>
SELECT
	p.id_publicacao, 
	count(pc.id_publicacao);
FROM 
	publicacao p 
	JOIN curtida l ON l.id_publicacao = p.id_publicacao
	JOIN publicacao_comentario pc ON p.id_publicacao = pc.id_publicacao
	JOIN comentario c ON c.idcomentario = pc.id_comentario 
WHERE
	l.id_usuario <> p.id_usuario AND
	c.id_usuario <> p.id_usuario
GROUP BY 
	p.id_publicacao

#dia 2 Query2
	SELECT
		u.NomeUsuario, count(p.id_publicacao), count(c.id_usuario)
	FROM
		usuario u 
		JOIN publicacao p ON p.id_usuario = u.ID
		JOIN curtida c ON c.id_publicacao = p.id_publicacao
	GROUP BY 
		u.ID
	HAVING
		count(c.id_publicacao)>0;
		
#dia2 Query3
#não foi encontrado a sintaxe para EXCEPT, dessa forma foi utilizado o <>
SELECT
   	u.NomeUsuario
FROM
	publicacao p
	JOIN curtida l ON p.id_publicacao = l.id_publicacao
	JOIN usuario u ON u.ID = l.id_usuario	  
WHERE
	l.id_usuario <> p.id_usuario
GROUP BY
	l.id_usuario
ORDER BY count(l.id_usuario) DESC
LIMIT 20
