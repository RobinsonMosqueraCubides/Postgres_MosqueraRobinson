CREATE VIEW vista_departamentos_municipios AS
SELECT 
    d.nombre AS departamento,
    m.nombre AS municipio,
    d.codigo_departamento,
    m.codigo_municipio,
    CONCAT(d.codigo_departamento, m.codigo_municipio) AS codigo_municipio_completo
FROM 
    departamentos d
JOIN 
    municipios m
ON 
    m.codigo_departamento = d.codigo_departamento;
