import router from '@system.router';
import storage from '@system.storage';

export default {
  data: {
    resultText: '',
    statusMsg: '',
    hasError: false,
  },
  checkStorage() {
    this.resultText = '';
    this.statusMsg = 'testing...';
    this.hasError = false;
    try {
      this.storageSet();
    } catch (e) {
      console.error('error: ' + e);
      this.hasError = true;
      getApp().data.testItems['api_storage'].errorDetail = 'checkStorage error: ' + e;
      this.statusMsg = 'error: ' + e;
    }
  },

  storageSet() {
    let obj = this;
    storage.set({
      key: 'Storage1',
      value: 'Info1',
      success: function() {
        obj.resultText += 'set success\n';
        obj.statusMsg = 'set success, getting...';
        obj.storageGet();
      },
      fail: function(data, code) {
        obj.hasError = true;
        getApp().data.testItems['api_storage'].errorDetail = 'storageSet fail: code=' + code + ', data=' + data;
        obj.resultText += 'set fail\n';
        obj.statusMsg = 'set fail, getting...';
        obj.storageGet();
      },
      complete: function() {
      }
    });
  },

  storageGet() {
    let obj = this;
    storage.get({
      key: 'Storage1',
      success: function(data) {
        obj.resultText += 'get success\n';
        obj.statusMsg = 'get success, deleting...';
        obj.storageDelete();
      },
      fail: function(data, code) {
        obj.hasError = true;
        getApp().data.testItems['api_storage'].errorDetail = 'storageGet fail: code=' + code + ', data=' + data;
        obj.resultText += 'get fail\n';
        obj.statusMsg = 'get fail, deleting...';
        obj.storageDelete();
      },
      complete: function() {
      }
    });
  },
  storageDelete() {
    let obj = this;
    storage.delete({
      key: 'Storage1',
      success: function(data) {
        obj.resultText += 'delete success\n';
        obj.statusMsg = 'delete success, setting2...';
        obj.storageSet2();
      },
      fail: function(data, code) {
        obj.hasError = true;
        getApp().data.testItems['api_storage'].errorDetail = 'storageDelete fail: code=' + code + ', data=' + data;
        obj.resultText += 'delete fail\n';
        obj.statusMsg = 'delete fail, setting2...';
        obj.storageSet2();
      },
      complete: function() {
      }
    });
  },

  storageSet2() {
    let obj = this;
    storage.set({
      key: 'Storage2',
      value: 'Info2',
      success: function() {
        obj.resultText += 'set2 success\n';
        obj.statusMsg = 'set2 success, clearing...';
        obj.storageClear();
      },
      fail: function(data, code) {
        obj.hasError = true;
        getApp().data.testItems['api_storage'].errorDetail = 'storageSet2 fail: code=' + code + ', data=' + data;
        obj.resultText += 'set2 fail\n';
        obj.statusMsg = 'set2 fail, clearing...';
        obj.storageClear();
      },
      complete: function() {
      }
    });
  },

  storageClear() {
    let obj = this;
    storage.clear({
      success: function(data) {
        obj.resultText += 'clear success\n';
        obj.statusMsg = obj.hasError ? 'all done: fail' : 'all done: success';
      },
      fail: function(data, code) {
        obj.hasError = true;
        getApp().data.testItems['api_storage'].errorDetail = 'storageClear fail: code=' + code + ', data=' + data;
        obj.resultText += 'clear fail\n';
        obj.statusMsg = 'all done: clear fail';
      },
      complete: function() {
      }
    });
  },

  onDestroy() {
    try {
      this.storageClear();
    } catch (e) {
      console.error('onDestroy storageClear error: ' + e);
    }
  },

    helpClicked() {
        getApp().data.helpData = { step: '点击测试storage按钮', result: '屏幕上显示各接口的测试结果', url: 'pages/DistributedData/storage/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/index/index' });
    },
    passClicked() {
        getApp().data.testItems['api_storage'].status = this.hasError ? 'fail' : 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['api_storage'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
