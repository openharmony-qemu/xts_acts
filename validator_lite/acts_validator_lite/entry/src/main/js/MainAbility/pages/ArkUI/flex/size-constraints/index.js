import router from '@system.router';

export default {
    onInit() {
        console.info('flex size constraints onInit');
    },

    passClicked() {
        getApp().data.testItems['flex_size_constraints'].status = 'pass';
        this.back();
    },

    failClicked() {
        getApp().data.testItems['flex_size_constraints'].status = 'fail';
        this.back();
    },

    helpClicked() {
        getApp().data.helpData = {
            step: 'Observe fixed size, min/max constraints, min-height, and aspect-ratio cases.',
            result: 'Each item respects its width, height, min/max, and aspect-ratio constraints.',
            url: 'pages/ArkUI/flex/size-constraints/index'
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
