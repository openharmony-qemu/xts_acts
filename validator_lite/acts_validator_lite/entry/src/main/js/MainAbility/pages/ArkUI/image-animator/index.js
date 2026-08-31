import { imageFrames as frames } from '../../../common/js/general';
import router from '@system.router';

export default {
  data: {
    frames,
    state: null,
  },

  onShow() {
    let animator = this.$refs.animator;
    this.state = animator.getState();
  },
  handleStart() {
    let animator = this.$refs.animator;
    animator.start();
    this.state = animator.getState();
  },
  handlePause() {
    let animator = this.$refs.animator;
    animator.pause();
    this.state = animator.getState();
  },
  handleResume() {
    let animator = this.$refs.animator;
    animator.resume();
    this.state = animator.getState();
  },
  handleStop() {
    let animator = this.$refs.animator;
    animator.stop();
    this.state = animator.getState();
  },
  logStop() {
  },

    helpClicked() {
        getApp().data.helpData = { step: '点击播放、暂停、恢复、停止按钮', result: '动画随操作播放或停止', url: 'pages/ArkUI/image-animator/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['image_animator'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['image_animator'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
