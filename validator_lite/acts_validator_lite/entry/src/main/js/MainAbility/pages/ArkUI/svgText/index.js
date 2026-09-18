// SVG文本页逻辑
// 注意：Lite 端无 this.setData，数据更新一律用直接赋值 this.key = value
// 本应用路由：replace + uri
import router from '@system.router';

export default {
  data: {},

  helpClicked() {
    getApp().data.helpData = { step: '观察SVG文本的显示效果', result: '不同字号与颜色的文字完整清晰显示，无截断或渲染错误', url: 'pages/ArkUI/svgText/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },
  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },
  passClicked() {
    getApp().data.testItems['svgText'].status = 'pass';
    this.back();
  },
  failClicked() {
    getApp().data.testItems['svgText'].status = 'fail';
    this.back();
  },
  backClicked() {
    this.back();
  }
}
