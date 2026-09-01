import { commonFunc } from '../../../../common/js/event';
import router from '@system.router';

export default {
  data: {
    color: '#5265ef',
    flag: false,
    pointX: 0,
    pointY: 0,
    timeStamp: 0,
  },
  longPressEvent(e) {
    commonFunc(this, e);
  },

    helpClicked() {
        getApp().data.helpData = { step: '长按彩色区域', result: 'x、y、timeStamp、颜色随长按事件变化', url: 'pages/ArkUI/event/longpress/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['event_longpress'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['event_longpress'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
