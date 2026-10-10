import router from '@system.router';

export default {
    data: {
        title: 'flex overflow',
        overflowModeH: 'visible',
        overflowModeV: 'visible'
    },
    onInit() {
        console.info('flex overflow onInit');
    },
    passClicked() {
        getApp().data.testItems['flex_overflow'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['flex_overflow'].status = 'fail';
        this.back();
    },
    helpClicked() {
        getApp().data.helpData = {
            step: '分别切换横向/纵向演示区的 overflow 为 visible / hidden，观察超出容器内容的显示变化',
            result: 'visible 时超出部分完整可见，hidden 时超出部分被容器边界裁剪',
            url: 'pages/ArkUI/flex/flex-overflow/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    backClicked() {
        this.back();
    },
    setOverflowH(val) {
        this.overflowModeH = val;
    },
    setOverflowV(val) {
        this.overflowModeV = val;
    },
    setOverflowHVisible() {
        this.setOverflowH('visible');
    },
    setOverflowHHidden() {
        this.setOverflowH('hidden');
    },
    setOverflowVVisible() {
        this.setOverflowV('visible');
    },
    setOverflowVHidden() {
        this.setOverflowV('hidden');
    }
};
