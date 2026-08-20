import router from '@system.router';

export default {
    data: {
        title: 'text',
        pass: 'true ;',
        fail: 'false;'
    },
    onInit() {
        console.info('text onInit');
    },
    passClicked() {
        getApp().data.testItems.text_largeColor.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.text_largeColor.status = 'fail';
        this.back();
    },
    helpClicked() {
        getApp().data.helpData = {
            step: '观察不同字号和颜色的文字渲染',
            result: '大/中/小字号正确显示，红色文字显示为红色',
            url: 'pages/ArkUI/text/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    backClicked() {
        this.back();
    }
};
