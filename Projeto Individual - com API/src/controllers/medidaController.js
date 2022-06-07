var medidaModel = require("../models/medidaModel");

function buscarUltimasMedidas(req, res) {

    const limite_linhas = 7;

    var idAquario = req.params.idvotacao;
    
    console.log(`Recuperando as ultimas medidas`);

    medidaModel.buscarUltimasMedidas(idAquario, limite_linhas).then(function (resultado) {
        if (resultado.length > 0) {
            let total = 0;
            for (let i = 0; i < resultado.length; i++) {
                const element = resultado[i]
                console.log("item: ", element)
                total += Number(element.Qtd_de_Votos)
            }

            console.log("total\n\n\n", total);

            for (let i = 0; i < resultado.length; i++) {
                const element = resultado[i]
                let porcentagem = (Number(element.Qtd_de_Votos) / total) * 100
                element.porcentagem = porcentagem.toFixed(2)
            }

            console.log("resultado\n\n\n", resultado);

            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarMedidasEmTempoReal(req, res) {

    var idAquario = req.params.idvotacao;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMedidasEmTempoReal(idAquario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal

}