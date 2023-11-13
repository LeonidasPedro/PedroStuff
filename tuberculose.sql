create or replace view observatrio.vw_tuberculose
            (id, codigo, nuano, idmunic2, municipio, cod, meso, micro, csgestantnum, csgestant, csracanum, csraca,
             csescolnnum, tratamento, tratamentonum, forma, agravaids, agravalcoo, agravdiabe, agravdoenc, agravoutra,
             agravoutde, agravtabac, agravdroga, formanum, tratsupat, situaence, situaencenum, popliber, poprua,
             popsaude, popimig, benefgov, antretro, sexos, sexonum, fxet, fxetnum)
as
SELECT DISTINCT tuberculose.id,
                tuberculose.codigo,
                tuberculose.nuano,
                tuberculose.idmunic2,
                l.municipio,
                l.cod,
                l.meso,
                l.micro,
                tuberculose.csgestantnum,
                ge.csgestant,
                tuberculose.csracanum,
                ra.csraca,
                tuberculose.csescolnnum,
                t.tratamento,
                tuberculose.tratamentonum,
                f.forma,
                ag.agravaids,
                ag.agravalcoo,
                ag.agravdiabe,
                ag.agravdoenc,
                ag.agravoutra,
                ag.agravoutde,
                ag.agravtabac,
                ag.agravdroga,
                tuberculose.formanum,
                tuberculose.tratsupat,
                se.situaence,
                tuberculose.situaencenum,
                p.popliber,
                p.poprua,
                p.popsaude,
                p.popimig,
                p.benefgov,
                p.antretro,
                s.sexos,
                tuberculose.sexonum,
                fe.fxet,
                tuberculose.fxetnum
FROM observatrio.tuberculose
         LEFT JOIN observatrio.tuberculosefaixaetaria fe ON fe.fxetnum = tuberculose.fxetnum
         LEFT JOIN observatrio.sexos s ON s.id = tuberculose.sexonum
         LEFT JOIN observatrio.tuberculosepopulacao p ON p.codigo = tuberculose.codigo
         LEFT JOIN observatrio.tuberculoseencerramento se ON se.situaencenum = tuberculose.situaencenum
         LEFT JOIN observatrio.tuberculoseforma f ON f.formanum = tuberculose.formanum
         LEFT JOIN observatrio.tuberculosetratamento t ON t.tratamentonum = tuberculose.tratamentonum
         LEFT JOIN observatrio.tuberculoseescolaridade e ON e.csescolnnum = tuberculose.csescolnnum
         LEFT JOIN observatrio.tuberculoseraca ra ON ra.csracanum = tuberculose.csracanum
         LEFT JOIN observatrio.tuberculosegestante ge ON ge.csgestantnum = tuberculose.csgestantnum
         LEFT JOIN observatrio.tuberculoselocalidades l ON l.idmunic2 = tuberculose.idmunic2
         LEFT JOIN observatrio.tuberculoseagravantes ag ON ag.codigo = tuberculose.codigo;

alter table observatrio.vw_tuberculose
    owner to postgres;

