// SVG动画页逻辑
// 注意：Lite 端无 this.setData，数据更新一律用直接赋值 this.key = value
// 本应用路由：replace + uri
import router from '@system.router';

export default {
  data: {
    // 各用例独立播放状态：true=挂载动画版SVG（挂载即启动），false=挂载静态帧SVG
    play1: false,
    play2: false,
    play3: false,
    play4: false
  },

  // 001 播放/停止切换
  togglePlay1() {
    this.play1 = !this.play1;
  },
  // 002 播放/停止切换
  togglePlay2() {
    this.play2 = !this.play2;
  },
  // 003 播放/停止切换
  togglePlay3() {
    this.play3 = !this.play3;
  },
  // 004 播放/停止切换
  togglePlay4() {
    this.play4 = !this.play4;
  },

  helpClicked() {
    getApp().data.helpData = { step: '点击播放按钮，观察SVG动画效果，再点击停止', result: '透明度/旋转/缩放/平移四类基础动画按预期循环播放，停止后显示静态帧', url: 'pages/ArkUI/svgAnimate/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },
  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },
  passClicked() {
    getApp().data.testItems['svgAnimate'].status = 'pass';
    this.back();
  },
  failClicked() {
    getApp().data.testItems['svgAnimate'].status = 'fail';
    this.back();
  },
  backClicked() {
    this.back();
  }
}
