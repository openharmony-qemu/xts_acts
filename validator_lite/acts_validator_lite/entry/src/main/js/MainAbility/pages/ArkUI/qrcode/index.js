import router from '@system.router';

export default {
    data: {
        qrColor: '#87ceeb',
        qrBackgroundColor: '#f0ffff',
        qrValue: 'value',
    },
    clickAction() {
    },
    swipeAction() {
    },

    changeColor() {
        if (this.qrColor === '#87ceeb') {
            this.qrColor = '#fa8072';
        } else {
            this.qrColor = '#87ceeb';
        }
    },
    changeBackgroundColor() {
        if (this.qrBackgroundColor === '#f0ffff') {
            this.qrBackgroundColor = '#fff000';
        } else {
            this.qrBackgroundColor = '#f0ffff';
        }
    },
    changeValue() {
        if (this.qrValue !== 'value') {
            this.qrValue = 'value';
        } else {
            this.qrValue += 'qrcode';
        }
    },

    helpClicked() {
        getApp().data.helpData = { step: '点击值、颜色、背景色按钮', result: '二维码会随之变化', url: 'pages/ArkUI/qrcode/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['qrcode'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['qrcode'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
