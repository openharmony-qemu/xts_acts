// gradient List 方向渐变页逻辑
import router from '@system.router';

export default {
  helpClicked() {
    getApp().data.helpData = { step: '观察 List 渐变效果', result: 'List 渐变显示正常', url: 'pages/ArkUI/gradient_list/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },

  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },

  passClicked() {
    getApp().data.testItems['gradient_list'].status = 'pass';
    this.back();
  },

  failClicked() {
    getApp().data.testItems['gradient_list'].status = 'fail';
    this.back();
  },

  backClicked() {
    this.back();
  }
}
