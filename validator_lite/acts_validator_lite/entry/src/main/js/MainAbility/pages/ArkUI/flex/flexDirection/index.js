// flex-direction validator page logic
import router from '@system.router';

export default {
  helpClicked() {
    getApp().data.helpData = { step: '观察 001/002 静态排列',
      result: '001 从左到右、002 从上到下',
      url: 'pages/ArkUI/flex/flexDirection/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },
  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },
  passClicked() {
    getApp().data.testItems['flex_direction'].status = 'pass';
    this.back();
  },
  failClicked() {
    getApp().data.testItems['flex_direction'].status = 'fail';
    this.back();
  },
  backClicked() {
    this.back();
  }
}
