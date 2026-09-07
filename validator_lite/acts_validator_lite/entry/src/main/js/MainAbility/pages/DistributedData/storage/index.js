import router from '@system.router';
import storage from '@system.storage';

export default {
    data: {
        resultText: '', statusMsg: '', hasError: false,
        supported: false, stTip: '',
        stPassColor: '#555555', stFailColor: '#555555'
    },
    onInit() {
        this.supported = canIUse('SystemCapability.DistributedDataManager.Preferences.Core.Lite');
        if (!this.supported) {
            this.stTip = '当前设备不支持 SystemCapability.DistributedDataManager.Preferences.Core.Lite，本用例跳过（勿点 pass/fail）';
            getApp().data.testItems['api_storage'].errorDetail = 'unsupported: SystemCapability.DistributedDataManager.Preferences.Core.Lite';
        }
    },
    checkStorage() {
        if (!this.supported) { this.statusMsg = '当前设备不支持'; return; }
        this.resultText = ''; this.statusMsg = 'testing...'; this.hasError = false;
        try { this.storageSet(); } catch (e) { this.hasError = true; this.statusMsg = 'error: ' + e; getApp().data.testItems['api_storage'].errorDetail = 'error: ' + e; }
    },
    storageSet() {
        let obj = this;
        storage.set({ key: 'Storage1', value: 'Info1', success: function () { obj.resultText += 'set success\n'; obj.statusMsg = 'set ok, get...'; obj.storageGet(); }, fail: function (d, c) { obj.hasError = true; obj.resultText += 'set fail\n'; obj.statusMsg = 'set fail, get...'; getApp().data.testItems['api_storage'].errorDetail = 'set fail: code=' + c; obj.storageGet(); } });
    },
    storageGet() {
        let obj = this;
        storage.get({ key: 'Storage1', success: function (d) { obj.resultText += 'get success\n'; obj.statusMsg = 'get ok, delete...'; obj.storageDelete(); }, fail: function (d, c) { obj.hasError = true; obj.resultText += 'get fail\n'; obj.statusMsg = 'get fail, delete...'; getApp().data.testItems['api_storage'].errorDetail = 'get fail: code=' + c; obj.storageDelete(); } });
    },
    storageDelete() {
        let obj = this;
        storage.delete({ key: 'Storage1', success: function (d) { obj.resultText += 'delete success\n'; obj.statusMsg = 'delete ok, set2...'; obj.storageSet2(); }, fail: function (d, c) { obj.hasError = true; obj.resultText += 'delete fail\n'; obj.statusMsg = 'delete fail, set2...'; getApp().data.testItems['api_storage'].errorDetail = 'delete fail: code=' + c; obj.storageSet2(); } });
    },
    storageSet2() {
        let obj = this;
        storage.set({ key: 'Storage2', value: 'Info2', success: function () { obj.resultText += 'set2 success\n'; obj.statusMsg = 'set2 ok, clear...'; obj.storageClear(); }, fail: function (d, c) { obj.hasError = true; obj.resultText += 'set2 fail\n'; obj.statusMsg = 'set2 fail, clear...'; getApp().data.testItems['api_storage'].errorDetail = 'set2 fail: code=' + c; obj.storageClear(); } });
    },
    storageClear() {
        let obj = this;
        storage.clear({ success: function (d) { obj.resultText += 'clear success\n'; obj.statusMsg = obj.hasError ? 'done: fail' : 'done: success'; }, fail: function (d, c) { obj.hasError = true; obj.resultText += 'clear fail\n'; obj.statusMsg = 'done: clear fail'; getApp().data.testItems['api_storage'].errorDetail = 'clear fail: code=' + c; } });
    },
    onDestroy() { try { this.storageClear(); } catch (e) {} },
    passSt() { if (getApp().data.testItems['api_storage'].status === 'pass') { getApp().data.testItems['api_storage'].status = 'null'; this.stPassColor = '#555555'; this.stFailColor = '#555555'; } else { getApp().data.testItems['api_storage'].status = this.hasError ? 'fail' : 'pass'; this.stPassColor = '#4caf50'; this.stFailColor = '#555555'; } },
    failSt() { if (getApp().data.testItems['api_storage'].status === 'fail') { getApp().data.testItems['api_storage'].status = 'null'; this.stFailColor = '#555555'; this.stPassColor = '#555555'; } else { getApp().data.testItems['api_storage'].status = 'fail'; this.stFailColor = '#f44336'; this.stPassColor = '#555555'; } },
    helpClicked() {
        getApp().data.helpData = { step: '进入自动 canIUse 检测；不支持时跳过。支持时点测试storage，链式执行 set/get/delete/set2/clear。', result: '全部成功 → pass；任一失败 → fail。', url: 'pages/DistributedData/storage/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() { router.replace({ uri: 'pages/index/index' }); },
    backClicked() { this.back(); }
};
