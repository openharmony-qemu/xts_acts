// gradient 角度渐变页逻辑
import router from '@system.router';

export default {
  helpClicked() {
    getApp().data.helpData = { step: '观察各角度渐变效果', result: '各角度渐变显示正常', url: 'pages/ArkUI/gradient_angle/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },

  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },

  passClicked() {
    getApp().data.testItems['gradient_angle'].status = 'pass';
    this.back();
  },

  failClicked() {
    getApp().data.testItems['gradient_angle'].status = 'fail';
    this.back();
  },

  backClicked() {
    this.back();
  }
}
