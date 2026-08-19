import { swipeFunc } from '../../../../common/js/event';
import router from '@system.router';

export default {
  data: {
    color: '#5265ef',
    flag: false,
    pointX: 0,
    pointY: 0,
    direction: '',
    distance: 0,
    timeStamp: 0,
  },
  swipe(e) {
      console.log('touch end start');
      swipeFunc(this, e);
      console.log('touch end stop');
    },

    helpClicked() {
        getApp().data.helpData = { step: '在彩色区域滑动', result: '方向、距离、timeStamp、颜色随滑动变化', url: 'pages/ArkUI/event/swipe/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems.event_swipe.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.event_swipe.status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
