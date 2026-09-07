import router from '@system.router';

export default {
  data: {
    text: 'Hello JS, we are friends. This is a marquee test.',
    speed: 1,
    flag: true,
    mPassColor: '#555555', mFailColor: '#555555',
  },
  changeSpeed() {
    if (this.flag) {
      this.speed = 5;
      this.flag = false;
    } else {
      this.speed = 50;
      this.flag = true;
    }
  },

    helpClicked() {
        getApp().data.helpData = { step: '点击红色的跑马灯', result: '红色跑马灯速度发生变化', url: 'pages/ArkUI/marquee/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        if (getApp().data.testItems['marquee'].status === 'pass') { getApp().data.testItems['marquee'].status = 'null'; this.mPassColor = '#555555'; this.mFailColor = '#555555'; } else { getApp().data.testItems['marquee'].status = 'pass'; this.mPassColor = '#4caf50'; this.mFailColor = '#555555'; }
    },
    failClicked() {
        if (getApp().data.testItems['marquee'].status === 'fail') { getApp().data.testItems['marquee'].status = 'null'; this.mFailColor = '#555555'; this.mPassColor = '#555555'; } else { getApp().data.testItems['marquee'].status = 'fail'; this.mFailColor = '#f44336'; this.mPassColor = '#555555'; }
    },
    backClicked() {
        this.back();
    }
};
