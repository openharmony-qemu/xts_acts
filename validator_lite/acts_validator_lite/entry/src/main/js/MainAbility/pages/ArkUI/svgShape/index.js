// SVG基础形状页逻辑
// 注意：Lite 端无 this.setData，数据更新一律用直接赋值 this.key = value
// 本应用路由：replace + uri
import router from '@system.router';

export default {
  data: {},

  helpClicked() {
    getApp().data.helpData = { step: '观察SVG基础形状的显示效果', result: '矩形/椭圆/直线/多边形/圆角矩形/三角形均按预期完整显示', url: 'pages/ArkUI/svgShape/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },
  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },
  passClicked() {
    getApp().data.testItems['svgShape'].status = 'pass';
    this.back();
  },
  failClicked() {
    getApp().data.testItems['svgShape'].status = 'fail';
    this.back();
  },
  backClicked() {
    this.back();
  }
}
