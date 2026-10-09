import router from '@system.router';

export default {
    onInit() {
        console.info('flex align-content onInit');
    },

    passClicked() {
        getApp().data.testItems['flex_align_content'].status = 'pass';
        this.back();
    },

    failClicked() {
        getApp().data.testItems['flex_align_content'].status = 'fail';
        this.back();
    },

    helpClicked() {
        getApp().data.helpData = {
            step: 'Observe default stretch, explicit flex-start/center/flex-end/space-between/stretch, and column wrap stretch line width cases.',
            result: 'Wrapped flex lines are distributed in the cross axis according to align-content; default align-content uses stretch.',
            url: 'pages/ArkUI/flex/align-content/index'
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
