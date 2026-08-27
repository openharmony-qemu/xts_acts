import router from '@system.router';

export default {
    data: {
        barData: [
            {
                fillColor: '#f07826',
                data: [763, 550, 551, 554, 731, 654, 525, 696, 595, 628],
            },
            {
                fillColor: '#cce5ff',
                data: [535, 776, 615, 444, 694, 785, 677, 609, 562, 410],
            },
            {
                fillColor: '#ff88bb',
                data: [673, 500, 574, 483, 702, 583, 437, 506, 693, 657],
            },
        ],
        barOps: {
            xAxis: {
                min: 0,
                max: 20,
                display: false,
                axisTick: 10
            },
            yAxis: {
                min: 0,
                max: 1000,
                display: false,
            },
        },
    },

    onInit() {
    },

    onDestroy() {

    },

    helpClicked() {
        getApp().data.helpData = { step: '观察柱状图', result: '柱状图正常显示多组数据', url: 'pages/ArkUI/chart/bar/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['chart_bar_complex'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['chart_bar_complex'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
