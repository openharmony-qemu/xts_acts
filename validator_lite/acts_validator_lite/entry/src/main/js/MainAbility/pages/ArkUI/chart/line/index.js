import router from '@system.router';

export default {
    data: {
        lineData: [
            { strokeColor: '#0081ff', fillColor: '#cce5ff', data: [763, 550, 551, 554, 731, 654, 525, 696, 595, 628, 791, 505, 613, 575, 475, 553, 491, 680, 657, 716], gradient: false }
        ],
        lineOps: {
            xAxis: { min: 0, max: 20, display: false },
            yAxis: { min: 0, max: 1000, display: false },
            series: { lineStyle: { width: '5px', smooth: true }, headPoint: { shape: 'circle', size: 10, strokeWidth: 5, fillColor: '#ffffff', strokeColor: '#007aff', display: true }, loop: { margin: 2, gradient: true } }
        },
        cPassColor: '#555555', cFailColor: '#555555'
    },
    addData() { this.$refs.linechart.append({ serial: 0, data: [Math.floor(Math.random() * 400) + 400] }); },
    passC() { if (getApp().data.testItems['chart_line'].status === 'pass') { getApp().data.testItems['chart_line'].status = 'null'; this.cPassColor = '#555555'; this.cFailColor = '#555555'; } else { getApp().data.testItems['chart_line'].status = 'pass'; this.cPassColor = '#4caf50'; this.cFailColor = '#555555'; } },
    failC() { if (getApp().data.testItems['chart_line'].status === 'fail') { getApp().data.testItems['chart_line'].status = 'null'; this.cFailColor = '#555555'; this.cPassColor = '#555555'; } else { getApp().data.testItems['chart_line'].status = 'fail'; this.cFailColor = '#f44336'; this.cPassColor = '#555555'; } },
    helpClicked() {
        getApp().data.helpData = { step: '点 Add data 按钮', result: '折线图随之变化', url: 'pages/ArkUI/chart/line/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() { router.replace({ uri: 'pages/ArkUI/common/index/index' }); },
    backClicked() { this.back(); }
};
