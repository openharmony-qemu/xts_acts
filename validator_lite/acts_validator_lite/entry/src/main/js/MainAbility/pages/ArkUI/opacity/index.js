import router from '@system.router';

export default {
    data: {
    },

    helpClicked() {
        getApp().data.helpData = { step: '观察三张图片透明度', result: '第一张不透明，第二张半透明，第三张更透明', url: 'pages/ArkUI/opacity/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems.opacity.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.opacity.status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
