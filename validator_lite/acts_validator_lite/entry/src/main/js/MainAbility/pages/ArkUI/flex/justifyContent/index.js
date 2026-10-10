// justify-content validator page logic
import router from '@system.router';

export default {
  helpClicked() {
    getApp().data.helpData = { step: '观察 001/002 各变体排列',
      result: '001 row 下 6 种主轴对齐（靠左/靠右/居中/两端/环绕/均分）；002 column 下同样 6 种',
      url: 'pages/ArkUI/flex/justifyContent/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },
  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },
  passClicked() {
    getApp().data.testItems['flex_justify_content'].status = 'pass';
    this.back();
  },
  failClicked() {
    getApp().data.testItems['flex_justify_content'].status = 'fail';
    this.back();
  },
  backClicked() {
    this.back();
  }
}
