import router from '@system.router';

export default {
    data: {
        title: 'slider',
        sliderValue: 50,
        pass: 'true ;',
        fail: 'false;'
    },
    onInit() {
    },
    onSliderChange(e) {
        this.sliderValue = e.progress;
    },
    passClicked() {
        getApp().data.testItems['slider_drag'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['slider_drag'].status = 'fail';
        this.back();
    },
    helpClicked() {
        getApp().data.helpData = { step: '拖动滑块', result: '数值随拖动更新', url: 'pages/ArkUI/slider/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    backClicked() {
        this.back();
    }
};
