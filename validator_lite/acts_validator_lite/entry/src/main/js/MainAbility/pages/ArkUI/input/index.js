import router from '@system.router';

export default {
    data: {
        clickMsg: '',
    },

    imgBtnClick() {
        this.clickMsg = 'Button clicked!';
    },

    helpClicked() {
        getApp().data.helpData = { step: '复选框可反复勾选/取消，单选框点击选中，图片按钮点击后显示 Button clicked!', result: '复选框状态切换正常，单选框选中，图片按钮点击有反馈', url: 'pages/ArkUI/input/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['input'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['input'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
