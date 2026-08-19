import router from '@system.router';

export default {
    data: {
        title: 'switch',
        switchStatus: false,
        pass: 'true ;',
        fail: 'false;'
    },
    onInit() {
        console.info('switch onInit');
    },
    onSwitchChange(e) {
        this.switchStatus = e.checked;
    },
    passClicked() {
        getApp().data.testItems.switch_toggle.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.switch_toggle.status = 'fail';
        this.back();
    },
    helpClicked() {
        getApp().data.helpData = { step: '点击开关', result: '开关状态切换', url: 'pages/ArkUI/switch/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    backClicked() {
        this.back();
    }
};
