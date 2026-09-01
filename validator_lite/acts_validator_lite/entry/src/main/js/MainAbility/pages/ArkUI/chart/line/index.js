import router from '@system.router';

export default {
    data: {
        lineData: [
            {
                strokeColor: '#0081ff',
                fillColor: '#cce5ff',
                data: [763, 550, 551, 554, 731, 654, 525, 696, 595, 628, 791, 505, 613, 575, 475, 553, 491, 680, 657, 716],
                gradient: false,
            }
        ],
        lineOps: {
            xAxis: {
                min: 0,
                max: 20,
                display: false,
            },
            yAxis: {
                min: 0,
                max: 1000,
                display: false,
            },
            series: {
                lineStyle: {
                    width: '5px',
                    smooth: true,
                },
                headPoint: {
                    shape: 'circle',
                    size: 10,
                    strokeWidth: 5,
                    fillColor: '#ffffff',
                    strokeColor: '#007aff',
                    display: true,
                },
                loop: {
                    margin: 2,
                    gradient: true,
                }
            }
        },
    },

    onInit() {
    },

    addData() {
        this.$refs.linechart.append({
            serial: 0,
            data: [Math.floor(Math.random() * 400) + 400]
        });
    },

    onDestroy() {

    },

    helpClicked() {
        getApp().data.helpData = { step: '点击Add data按钮', result: '折线图随之变化', url: 'pages/ArkUI/chart/line/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['chart_line'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['chart_line'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
