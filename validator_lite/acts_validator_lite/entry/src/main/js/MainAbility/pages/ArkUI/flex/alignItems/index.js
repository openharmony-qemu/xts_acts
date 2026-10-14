// align-items validator page logic
import router from '@system.router';

export default {
  helpClicked() {
    getApp().data.helpData = { step: '观察 001/002 各变体排列',
      result: '001 row 下 4 种交叉轴对齐（顶部/底部/居中/拉满）；002 column 下同样 4 种（左/右/居中/拉满）',
      url: 'pages/ArkUI/flex/alignItems/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },
  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },
  passClicked() {
    getApp().data.testItems['flex_align_items'].status = 'pass';
    this.back();
  },
  failClicked() {
    getApp().data.testItems['flex_align_items'].status = 'fail';
    this.back();
  },
  backClicked() {
    this.back();
  }
}
