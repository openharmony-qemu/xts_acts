// SVG变换页逻辑
// 注意：Lite 端无 this.setData，数据更新一律用直接赋值 this.key = value
// 本应用路由：replace + uri
import router from '@system.router';

export default {
  data: {
    applied1: false,
    applied2: false,
    applied3: false,
    applied4: false,
    applied5: false,
  },

  toggle(key) {
    this[key] = !this[key];
  },

  helpClicked() {
    getApp().data.helpData = { step: '点击各卡片的执行变换/恢复原位按钮，观察SVG变换效果', result: '平移/缩放/旋转/复合变换/g分组变换均按预期显示', url: 'pages/ArkUI/svgTransform/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },
  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },
  passClicked() {
    getApp().data.testItems['svgTransform'].status = 'pass';
    this.back();
  },
  failClicked() {
    getApp().data.testItems['svgTransform'].status = 'fail';
    this.back();
  },
  backClicked() {
    this.back();
  }
}
