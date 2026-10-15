import router from '@system.router';

export default {
    data: {
        title: 'flex aspect-ratio',
        aspectRatio: '1',
        aspectLabel: '1:1',
        expectText: 'Expected blue box: width 80px, height 80px'
    },

    onInit() {
        console.info('flex aspect-ratio onInit');
    },

    setAspectOne() {
        this.aspectRatio = '1';
        this.aspectLabel = '1:1';
        this.expectText = 'Expected blue box: width 80px, height 80px';
    },

    setAspectTwo() {
        this.aspectRatio = '2';
        this.aspectLabel = '2:1';
        this.expectText = 'Expected blue box: width 80px, height 40px';
    },

    setAspectHalf() {
        this.aspectRatio = '0.5';
        this.aspectLabel = '1:2';
        this.expectText = 'Expected blue box: width 80px, height 160px';
    },

    passClicked() {
        getApp().data.testItems['flex_aspect_ratio'].status = 'pass';
        this.back();
    },

    failClicked() {
        getApp().data.testItems['flex_aspect_ratio'].status = 'fail';
        this.back();
    },

    helpClicked() {
        getApp().data.helpData = {
            step: 'Tap 1:1, 2:1, and 1:2 buttons. Observe the blue box whose width is fixed at 80px.',
            result: 'The blue box height changes to 80px, 40px, and 160px according to aspect-ratio.',
            url: 'pages/ArkUI/flex/aspect-ratio/index'
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
