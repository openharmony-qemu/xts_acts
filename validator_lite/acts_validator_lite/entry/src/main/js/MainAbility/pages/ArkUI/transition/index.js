import router from '@system.router';

export default {
    data: {
        animationName: 'animationTest',
        animationName2: 'animation2',
    },

    helpClicked() {
        getApp().data.helpData = { step: '观察界面变化', result: '界面上元素平移后还原', url: 'pages/ArkUI/transition/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['transition'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['transition'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
