import router from '@system.router';

export default {
    onInit() {
        console.info('flex align-self onInit');
    },

    passClicked() {
        getApp().data.testItems['flex_align_self'].status = 'pass';
        this.back();
    },

    failClicked() {
        getApp().data.testItems['flex_align_self'].status = 'fail';
        this.back();
    },

    helpClicked() {
        getApp().data.helpData = {
            step: 'Observe row, column, and stretch align-self cases.',
            result: 'Each child item overrides the parent align-items value according to its align-self value.',
            url: 'pages/ArkUI/flex/align-self/index'
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
