$(document).ready(function () {
    console.log("Traduzindo....");
});


function TradutorFiles_Indicator() {
    $.ajax({
        type: "POST",
        url: "V4FrmIndicador.aspx/TradutorFiles_Indicator",
        dataType: 'json',
        async: false,
        contentType: 'application/json',
        success: function (saida) {
            document.getElementById("btnNovoDashboard").innerHTML = saida.d[0].btnNovoDashboard; 
            document.getElementById("btnGravarDashboard").innerHTML = saida.d[0].btnGravarDashboard;
            document.getElementById("btnSairDashboard").innerHTML = saida.d[0].btnSairDashboard;
            document.getElementById("mdNovoDashboard").innerHTML = saida.d[0].mdNovoDashboard;
            document.getElementById("pNovoDashboard").innerHTML = saida.d[0].pNovoDashboard;  
            document.getElementById("pills_1").innerHTML = saida.d[0].pills_1;
            document.getElementById("pills_2").innerHTML = saida.d[0].pills_2;
            document.getElementById("pills_3").innerHTML = saida.d[0].pills_3;
            document.getElementById("prbGrafico").innerHTML = saida.d[0].prbGrafico;
            document.getElementById("pNovoDashboard").innerHTML = saida.d[0].pNovoDashboard;  
            document.getElementById("prbGrid").innerHTML = saida.d[0].prbGrid;
            document.getElementById("prbMisto").innerHTML = saida.d[0].prbMisto;
            document.getElementById("lblNomePainel").innerHTML = saida.d[0].lblNomePainel;
            $("#inputNomePainel").prop('placeholder', saida.d[0].inputNomePainel);
            document.getElementById("lblGrpIndicador").innerHTML = saida.d[0].lblGrpIndicador;
            document.getElementById("lblIndicador").innerHTML = saida.d[0].lblIndicador;  
            document.getElementById("tbIndicadorNome").innerHTML = saida.d[0].tbIndicadorNome;
            document.getElementById("lblNomeCustomizado").innerHTML = saida.d[0].lblNomeCustomizado;
            $("#nomeCustomizado").prop('placeholder', saida.d[0].nomeCustomizado);
            document.getElementById("tbIndicadorNome").innerHTML = saida.d[0].tbIndicadorNome;
            document.getElementById("nomeHelp").innerHTML = saida.d[0].nomeHelp;
            document.getElementById("lblTipoGrafico").innerHTML = saida.d[0].lblTipoGrafico;
            document.getElementById("pnConfigGrafico").innerHTML = saida.d[0].pnConfigGrafico;            
            document.getElementById("livalue").innerHTML = saida.d[0].livalue;
            document.getElementById("liAcum").innerHTML = saida.d[0].liAcum;
            document.getElementById("liTable").innerHTML = saida.d[0].liTable;
            document.getElementById("liMeta").innerHTML = saida.d[0].liMeta;
            document.getElementById("btnSairTab").innerHTML = saida.d[0].btnSairTab;
            document.getElementById("btnVoltarTabs").innerHTML = saida.d[0].btnVoltarTabs;
            document.getElementById("btnContinuarTabs").innerHTML = saida.d[0].btnContinuarTabs;
            document.getElementById("btnGravar").innerHTML = saida.d[0].btnGravar;
            document.getElementById("lblLevelInitial").innerHTML = saida.d[0].lblLevelInitial;
            document.getElementById("lblMaiorMenor").innerHTML = saida.d[0].lblMaiorMenor;
            document.getElementById("lblVisualizacao").innerHTML = saida.d[0].lblVisualizacao;
            if (saida.d[1] === "PT-BR") {
                $("#dvValue").addClass('onoffswitch');
                $("#chkValue").addClass('onoffswitch-checkbox');
                $("#lblchkValue").addClass('onoffswitch-label');
                $("#innerValue").addClass('onoffswitch-inner');
                $("#swValue").addClass('onoffswitch');
                $("#dvDrill").addClass('onoffswitch');
                $("#chkDrill").addClass('onoffswitch-checkbox');
                $("#lblchkDrill").addClass('onoffswitch-label');
                $("#dvAcum").addClass('onoffswitch');
                $("#chkAcum").addClass('onoffswitch-checkbox');
                $("#lblchkAcum").addClass('onoffswitch-label');
                $("#innerAcum").addClass('onoffswitch-inner');
                $("#swAcum").addClass('onoffswitch');
                $("#dvTable").addClass('onoffswitch');
                $("#chkTable").addClass('onoffswitch-checkbox');
                $("#lblchkTable").addClass('onoffswitch-label');
                $("#innerTable").addClass('onoffswitch-inner');
                $("#swTable").addClass('onoffswitch');
                $("#dvMeta").addClass('onoffswitch');
                $("#chkMeta").addClass('onoffswitch-checkbox');
                $("#lblchkMeta").addClass('onoffswitch-label');
                $("#innerMeta").addClass('onoffswitch-inner');
                $("#swMeta").addClass('onoffswitch');
            }
            else {
                $("#dvValue").addClass('onoffswitchEn');
                $("#chkValue").addClass('onoffswitchEn-checkbox');
                $("#lblchkValue").addClass('onoffswitchEn-label');
                $("#innerValue").addClass('onoffswitchEn-inner');
                $("#swValue").addClass('onoffswitchEn');
                $("#dvAcum").addClass('onoffswitchEn');
                $("#chkAcum").addClass('onoffswitchEn-checkbox');
                $("#lblchkAcum").addClass('onoffswitchEn-label');
                $("#innerAcum").addClass('onoffswitchEn-inner');
                $("#swAcum").addClass('onoffswitchEn');
                $("#dvTable").addClass('onoffswitchEn');
                $("#chkTable").addClass('onoffswitchEn-checkbox');
                $("#lblchkTable").addClass('onoffswitchEn-label');
                $("#innerTable").addClass('onoffswitchEn-inner');
                $("#swTable").addClass('onoffswitchEn');
                $("#dvMeta").addClass('onoffswitchEn');
                $("#chkMeta").addClass('onoffswitchEn-checkbox');
                $("#lblchkMeta").addClass('onoffswitchEn-label');
                $("#innerMeta").addClass('onoffswitchEn-inner');
                $("#swMeta").addClass('onoffswitchEn');
            }
            document.getElementById("mdConfigIndicadorAlt").innerHTML = saida.d[0].mdConfigIndicadorAlt;
            document.getElementById("pills_1_alterar").innerHTML = saida.d[0].pills_1_alterar;
            document.getElementById("pills_2_alterar").innerHTML = saida.d[0].pills_2_alterar;
            document.getElementById("btnSairTabAlterar").innerHTML = saida.d[0].btnSairTabAlterar;
            document.getElementById("btnContinuar").innerHTML = saida.d[0].btnContinuar;
            document.getElementById("btnAlterar").innerHTML = saida.d[0].btnAlterar;
            document.getElementById("mdDeletePanel").innerHTML = saida.d[0].mdDeletePanel;
            document.getElementById("pDeletePanel").innerHTML = saida.d[0].pDeletePanel;
            document.getElementById("btnSairTabDeletar").innerHTML = saida.d[0].btnSairTabDeletar;
            document.getElementById("btnDeletar").innerHTML = saida.d[0].btnDeletar;
            document.getElementById("mdDeleteDashboard").innerHTML = saida.d[0].mdDeleteDashboard;
            document.getElementById("pDeleteDashboard").innerHTML = saida.d[0].pDeleteDashboard;
            document.getElementById("btnSairTabDeletarDashboard").innerHTML = saida.d[0].btnSairTabDeletarDashboard;
            document.getElementById("btnDeletarDashboard").innerHTML = saida.d[0].btnDeletarDashboard;
            document.getElementById("mdConfigIndicador").innerHTML = saida.d[0].mdConfigIndicador;
            document.getElementById("btnVoltar").innerHTML = saida.d[0].btnVoltar;
            document.getElementById("lblQualGrid").innerHTML = saida.d[0].lblQualGrid;

            window.sessionStorage.setItem("culture", saida.d[1]);
        }
    });
}
function TradutorFiles_IndicatorDetail() {
    $.ajax({
        type: "POST",
        url: "V4FrmIndicadorDetail.aspx/TradutorFiles_IndicatorDetail",
        dataType: 'json',
        async: false,
        contentType: 'application/json',
        success: function (saida) {

            document.getElementById("pnSeries").innerHTML = saida.d[0].pnSeries;
            //document.getElementById("lblCheckAll").innerHTML = saida.d[0].lblCheckAll;
            document.getElementById("pnGraphConfig").innerHTML = saida.d[0].pnGraphConfig;
            document.getElementById("btnFiltrar").innerHTML = saida.d[0].btnFiltrar;
            document.getElementById("btnFiltrarGrid").innerHTML = saida.d[0].btnFiltrarGrid;
            document.getElementById("liDetails").innerHTML = saida.d[0].liDetails;
            document.getElementById("liValue").innerHTML = saida.d[0].liValue;
            document.getElementById("liAcum").innerHTML = saida.d[0].liAcum;
            document.getElementById("liTable").innerHTML = saida.d[0].liTable;
            document.getElementById("liMeta").innerHTML = saida.d[0].liMeta;
            document.getElementById("pnLegendGraficos").innerHTML = saida.d[0].pnLegendGraficos;
            document.getElementById("pnTipoGrafico").innerHTML = saida.d[0].pnTipoGrafico;
            document.getElementById("pnTipoVisualizacao").innerHTML = saida.d[0].pnTipoVisualizacao;
            document.getElementById("graficoInicial").innerHTML = "<i class='fas fa-home'></i>&nbsp" + saida.d[0].graficoInicial;
            document.getElementById("btnVoltarDrill").innerHTML = "<i class='fas fa-arrow-left'></i>&nbsp" + saida.d[0].btnVoltarDrill;
            document.getElementById("btnAvancarDrill").innerHTML = "<i class='fas fa-arrow-right'></i>&nbsp" + saida.d[0].btnAvancarDrill;

            if (saida.d[1] === "PT-BR") {
                $("#dvValue").addClass('onoffswitchConfig');
                $("#chkValue").addClass('onoffswitchConfig-checkbox');
                $("#lblchkValue").addClass('onoffswitchConfig-label');
                $("#innerValue").addClass('onoffswitchConfig-inner');
                $("#swValue").addClass('onoffswitchConfig');
                $("#dvAcum").addClass('onoffswitchConfig');
                $("#chkAcum").addClass('onoffswitchConfig-checkbox');
                $("#lblchkAcum").addClass('onoffswitchConfig-label');
                $("#innerAcum").addClass('onoffswitchConfig-inner');
                $("#swAcum").addClass('onoffswitchConfig');
                $("#dvTable").addClass('onoffswitchConfig');
                $("#chkTable").addClass('onoffswitchliDrillConfig-checkbox');
                $("#lblchkTable").addClass('onoffswitchConfig-label');
                $("#innerTable").addClass('onoffswitchConfig-inner');
                $("#swTable").addClass('onoffswitchConfig');  
                $("#dvMeta").addClass('onoffswitchConfig');
                $("#chkMeta").addClass('onoffswitchliDrillConfig-checkbox');
                $("#lblchkMeta").addClass('onoffswitchConfig-label');
                $("#innerMeta").addClass('onoffswitchConfig-inner');
                $("#swMeta").addClass('onoffswitchConfig');
            }
            else {
                $("#dvValue").addClass('onoffswitchConfigEn');
                $("#chkValue").addClass('onoffswitchConfigEn-checkbox');
                $("#lblchkValue").addClass('onoffswitchConfigEn-label');
                $("#innerValue").addClass('onoffswitchConfigEn-inner');
                $("#swValue").addClass('onoffswitchConfigEn');
                $("#dvAcum").addClass('onoffswitchConfigEn');
                $("#chkAcum").addClass('onoffswitchConfigEn-checkbox');
                $("#lblchkAcum").addClass('onoffswitchConfigEn-label');
                $("#innerAcum").addClass('onoffswitchConfigEn-inner');
                $("#swAcum").addClass('onoffswitchConfigEn');
                $("#dvTable").addClass('onoffswitchConfigEn');
                $("#chkTable").addClass('onoffswitchConfigEn-checkbox');
                $("#lblchkTable").addClass('onoffswitchConfigEn-label');
                $("#innerTable").addClass('onoffswitchConfigEn-inner');
                $("#swTable").addClass('onoffswitchConfigEn');     
                $("#dvMeta").addClass('onoffswitchConfigEn');
                $("#chkMeta").addClass('onoffswitchliDrillConfigEn-checkbox');
                $("#lblchkMeta").addClass('onoffswitchConfigEn-label');
                $("#innerMeta").addClass('onoffswitchConfigEn-inner');
                $("#swMeta").addClass('onoffswitchConfigEn');
            }
            window.sessionStorage.setItem("culture", saida.d[1]);
        }
    });
}