import router from '@system.router';

export default {
    data: {
        arcVal: 10,
        horizontalVal: 10,
    },

    onInit() {
        console.info('onInit');
    },

    onDestroy() {
        console.info('onDestroy');
    },

    changeHorizontal(e) {
        console.log('click e ' + JSON.stringify(e));
        this.horizontalVal += 10;
    },

    changeArc(e) {
        console.log('click e ' + JSON.stringify(e));
        this.arcVal += 10;
    },

    helpClicked() {
        getApp().data.helpData = { step: '点击线下进度条或弧形进度条', result: '进度条向前增加', url: 'pages/ArkUI/progress/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems.progress_bar.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.progress_bar.status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
