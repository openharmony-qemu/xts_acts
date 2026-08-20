import {showPage} from '../../../common/js/swiper';
import router from '@system.router';

export default {
    data: {
        index: 0,
    },
    showPage: showPage,

    helpClicked() {
        getApp().data.helpData = { step: '在方框内上下滑动', result: '方框中的页面随滑动切换', url: 'pages/ArkUI/swiper/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems.swiper.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.swiper.status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
