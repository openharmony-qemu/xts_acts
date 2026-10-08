// flex-wrap validator page logic
import router from '@system.router';

export default {
  helpClicked() {
    getApp().data.helpData = { step: '观察 001/002 各变体排列',
      result: '001 row：nowrap不换行且超出溢出显示/wrap两行；002 column：nowrap不换列且超出溢出显示/wrap两列',
      url: 'pages/ArkUI/flex/flexWrap/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },
  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },
  passClicked() {
    getApp().data.testItems['flex_wrap'].status = 'pass';
    this.back();
  },
  failClicked() {
    getApp().data.testItems['flex_wrap'].status = 'fail';
    this.back();
  },
  backClicked() {
    this.back();
  }
}
