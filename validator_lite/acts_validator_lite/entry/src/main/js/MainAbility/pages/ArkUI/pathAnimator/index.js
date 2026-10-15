// 路径动画页逻辑
// 注意：Lite 端无 this.setData，数据更新一律用直接赋值 this.key = value
// 本应用路由：replace + uri
import router from '@system.router';

export default {
  data: {
    // 各用例动画播放状态：true=挂载动画块（挂载即启动），false=挂载静态起始态块
    playing1: false,
    playing2: false,
    playing3: false,
    playing4: false
  },

  // 各用例开始/结束切换
  toggle1() {
    this.playing1 = !this.playing1;
  },
  toggle2() {
    this.playing2 = !this.playing2;
  },
  toggle3() {
    this.playing3 = !this.playing3;
  },
  toggle4() {
    this.playing4 = !this.playing4;
  },

  helpClicked() {
    getApp().data.helpData = { step: '点击各用例的开始按钮，观察块沿路径运动', result: '块按预期路径运动并回到原位', url: 'pages/ArkUI/pathAnimator/index' };
    router.replace({ uri: 'pages/common/help/index' });
  },
  back() {
    router.replace({ uri: 'pages/ArkUI/common/index/index' });
  },
  passClicked() {
    getApp().data.testItems['pathAnimator'].status = 'pass';
    this.back();
  },
  failClicked() {
    getApp().data.testItems['pathAnimator'].status = 'fail';
    this.back();
  },
  backClicked() {
    this.back();
  }
}
