create or replace view observatrio.vw_mortalidadeinfantil(id, territorialidades, ano, obitos, nascidosvivos, mortalidade) as
SELECT a.id::character varying  AS id,
       a.territorialidades,
       a.ano::character varying AS ano,
       a.obitos,
       a.nascidosvivos,
       a.mortalidade
FROM observatrio.mortalidadeinfantil a;

alter table observatrio.vw_mortalidadeinfantil
    owner to postgres;

