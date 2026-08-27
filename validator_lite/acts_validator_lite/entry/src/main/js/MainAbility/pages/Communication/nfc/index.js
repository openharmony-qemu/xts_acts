import router from '@system.router';
import cardEmulation from '@ohos.nfc.cardEmulation';

export default {
    data: {
        hceService: null,
        value: '',
        statusMsg: '',
    },

    onInit() {
    },

    onDestroy() {
        try {
            if (this.hceService) {
                this.hceService.stopHCE();
            }
        } catch (e) {
            console.error('stopHCE error: ' + e);
        }
    },

    nfcOperate() {
        this.value = '';
        try {
            this.hceService = new cardEmulation.HceService();
            this.hceService.startHCE([
                'F0010203040506', 'A0000000041010'
            ]);
            this.hceService.on('hceCmd', (res) => {
                this.value = 'success';
                this.statusMsg = 'success';
                this.hceService.sendResponse([0x00, 0xa4, 0x04, 0x00, 0x0e, 0x32, 0x50, 0x41, 0x59,
                    0x2e, 0x53, 0x59, 0x53, 0x2e, 0x44, 0x44, 0x46, 0x30, 0x31, 0x00]);
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems['api_nfc'].errorDetail = 'nfcOperate error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    helpClicked() {
        getApp().data.helpData = { step: '点击读卡按钮', result: '显示读卡：success', url: 'pages/Communication/nfc/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/index/index' });
    },
    passClicked() {
        getApp().data.testItems['api_nfc'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['api_nfc'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
