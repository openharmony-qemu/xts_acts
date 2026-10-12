// SVG路径页逻辑
// 注意：Lite 端无 this.setData，数据更新一律用直接赋值 this.key = value
// 本应用路由：replace + uri
import router from '@system.router';

export default {
  data: {},

  helpClicked() {
    getApp().data.helpData = { step: '观察SVG路径的绘制效果', result: 'polyline折线、C/S曲线、L折线、A圆弧、Z闭合、自相交填充、少角路径均按预期完整显示', url: 'pages/ArkUI/svgPath/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },
  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },
  passClicked() {
    getApp().data.testItems['svgPath'].status = 'pass';
    this.back();
  },
  failClicked() {
    getApp().data.testItems['svgPath'].status = 'fail';
    this.back();
  },
  backClicked() {
    this.back();
  }
}
