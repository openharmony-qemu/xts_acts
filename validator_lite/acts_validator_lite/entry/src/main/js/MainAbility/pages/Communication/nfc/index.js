import router from '@system.router';
import cardEmulation from '@ohos.nfc.cardEmulation';

export default {
    data: {
        hceService: null,
        value: '',
        statusMsg: '',
        supported: false,
        nfcTip: '',
        nPassColor: '#555555', nFailColor: '#555555'
    },
    onInit() {
        this.supported = canIUse('SystemCapability.Communication.NFC.CardEmulation');
        if (!this.supported) {
            this.nfcTip = '当前设备不支持 SystemCapability.Communication.NFC.CardEmulation，本用例跳过（勿点 pass/fail）';
            getApp().data.testItems['api_nfc'].errorDetail = 'unsupported: SystemCapability.Communication.NFC.CardEmulation';
        }
    },
    onDestroy() { try { if (this.hceService) { this.hceService.stopHCE(); } } catch (e) {} },
    nfcOperate() {
        this.value = '';
        if (!this.supported) { this.statusMsg = '当前设备不支持 SystemCapability.Communication.NFC.CardEmulation'; return; }
        try {
            this.hceService = new cardEmulation.HceService();
            this.hceService.startHCE(['F0010203040506', 'A0000000041010']);
            this.hceService.on('hceCmd', (res) => {
                this.value = 'success';
                this.statusMsg = 'success';
                this.hceService.sendResponse([0x00, 0xa4, 0x04, 0x00, 0x0e, 0x32, 0x50, 0x41, 0x59, 0x2e, 0x53, 0x59, 0x53, 0x2e, 0x44, 0x44, 0x46, 0x30, 0x31, 0x00]);
            });
        } catch (e) { this.statusMsg = 'error: ' + e; getApp().data.testItems['api_nfc'].errorDetail = 'nfcOperate error: ' + e; }
    },
    passN() { if (getApp().data.testItems['api_nfc'].status === 'pass') { getApp().data.testItems['api_nfc'].status = 'null'; this.nPassColor = '#555555'; this.nFailColor = '#555555'; } else { getApp().data.testItems['api_nfc'].status = 'pass'; this.nPassColor = '#4caf50'; this.nFailColor = '#555555'; } },
    failN() { if (getApp().data.testItems['api_nfc'].status === 'fail') { getApp().data.testItems['api_nfc'].status = 'null'; this.nFailColor = '#555555'; this.nPassColor = '#555555'; } else { getApp().data.testItems['api_nfc'].status = 'fail'; this.nFailColor = '#f44336'; this.nPassColor = '#555555'; } },
    helpClicked() {
        getApp().data.helpData = { step: '进入页面自动 canIUse 检测；不支持时跳过。支持时点读卡按钮。', result: '读卡 success → pass；报错 → fail。', url: 'pages/Communication/nfc/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() { router.replace({ uri: 'pages/index/index' }); },
    backClicked() { this.back(); }
};
