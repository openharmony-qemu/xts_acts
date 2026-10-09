import router from '@system.router';

export default {
    onInit() {
        console.info('flex item sizing onInit');
    },

    passClicked() {
        getApp().data.testItems['flex_item_sizing'].status = 'pass';
        this.back();
    },

    failClicked() {
        getApp().data.testItems['flex_item_sizing'].status = 'fail';
        this.back();
    },

    helpClicked() {
        getApp().data.helpData = {
            step: 'Observe flex-grow, flex-shrink, and flex-basis cases from top to bottom.',
            result: 'The items grow, shrink, overflow, or use flex-basis according to each case description.',
            url: 'pages/ArkUI/flex/item-sizing/index'
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
