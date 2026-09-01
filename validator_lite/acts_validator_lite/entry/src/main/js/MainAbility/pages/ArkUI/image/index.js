import router from '@system.router';

export default {
    data: {
        title: 'image',
        pass: 'true ;',
        fail: 'false;'
    },
    onInit() {
    },
    passClicked() {
        getApp().data.testItems['image_display'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['image_display'].status = 'fail';
        this.back();
    },
    helpClicked() {
        getApp().data.helpData = { step: '观察图片渲染', result: '图片正常显示无变形', url: 'pages/ArkUI/image/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    backClicked() {
        this.back();
    }
};
