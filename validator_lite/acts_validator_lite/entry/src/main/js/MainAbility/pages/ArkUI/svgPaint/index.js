// SVG填充与描边页逻辑
// 注意：Lite 端无 this.setData，数据更新一律用直接赋值 this.key = value
// 本应用路由：replace + uri
import router from '@system.router';

export default {
  data: {},

  helpClicked() {
    getApp().data.helpData = { step: '观察SVG渐变填充与描边的显示效果', result: '水平/垂直/对角/五色渐变平滑过渡，纯色均匀填充，描边宽度/颜色/虚线/线端/圆环均按预期显示', url: 'pages/ArkUI/svgPaint/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },
  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },
  passClicked() {
    getApp().data.testItems['svgPaint'].status = 'pass';
    this.back();
  },
  failClicked() {
    getApp().data.testItems['svgPaint'].status = 'fail';
    this.back();
  },
  backClicked() {
    this.back();
  }
}
