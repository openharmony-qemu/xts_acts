import router from '@system.router';

export default {
    data: {
        title: 'flex margin-left',
        marginLeftMode1: 'none',
        marginLeftValue1: '0px',
        marginLeftMode2: 'none',
        marginLeftValue2: '0px'
    },
    onInit() {
        console.info('flex margin-left onInit');
    },
    passClicked() {
        getApp().data.testItems['flex_margin_left'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['flex_margin_left'].status = 'fail';
        this.back();
    },
    helpClicked() {
        getApp().data.helpData = {
            step: '点击 button1 的 无/auto、button2 的 20%/50px/100px，观察 B 子项在 flex 行内的位置变化',
            result: 'auto 时 B 被推到行尾；百分比/固定值时 B 的左外边距为对应值；无 时 A、B 相邻',
            url: 'pages/ArkUI/flex/flex-margin-left/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    backClicked() {
        this.back();
    },
    setMarginLeft1(val) {
        this.marginLeftMode1 = val;
        if (val === 'none') {
            this.marginLeftValue1 = '0px';
        } else {
            this.marginLeftValue1 = val;
        }
    },
    setMarginLeft2(val) {
        this.marginLeftMode2 = val;
        if (val === 'none') {
            this.marginLeftValue2 = '0px';
        } else {
            this.marginLeftValue2 = val;
        }
    },
    setMarginLeftNone1() {
        this.setMarginLeft1('none');
    },
    setMarginLeftAuto1() {
        this.setMarginLeft1('auto');
    },
    setMarginLeft20p2() {
        this.setMarginLeft2('20%');
    },
    setMarginLeft50px2() {
        this.setMarginLeft2('50px');
    },
    setMarginLeft100px2() {
        this.setMarginLeft2('100px');
    }
};
