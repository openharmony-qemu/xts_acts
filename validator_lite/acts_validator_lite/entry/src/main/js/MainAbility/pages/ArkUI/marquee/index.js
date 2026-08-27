import router from '@system.router';

export default {
  data: {
    text: 'Hello JS, we are friends. This is a marquee test.',
    speed: 1,
    flag: true,
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
        getApp().data.testItems['marquee'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['marquee'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
