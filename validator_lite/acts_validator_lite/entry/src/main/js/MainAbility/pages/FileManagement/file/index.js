import router from '@system.router';
import file from '@system.file';

export default {
    data: {
        resultText: '', statusMsg: '', index: 0, hasError: false,
        supported: false, fTip: '',
        fPassColor: '#555555', fFailColor: '#555555'
    },
    onInit() {
        this.supported = canIUse('SystemCapability.FileManagement.File.FileIO.Lite');
        if (!this.supported) {
            this.fTip = '当前设备不支持 SystemCapability.FileManagement.File.FileIO.Lite，本用例跳过（勿点 pass/fail）';
            getApp().data.testItems['api_file'].errorDetail = 'unsupported: SystemCapability.FileManagement.File.FileIO.Lite';
        }
    },
    checkFile() {
        if (!this.supported) { this.statusMsg = '当前设备不支持'; return; }
        this.resultText = ''; this.statusMsg = 'testing...'; this.hasError = false;
        try { this.fileWrite(); } catch (e) { this.hasError = true; this.statusMsg = 'error: ' + e; getApp().data.testItems['api_file'].errorDetail = 'error: ' + e; }
    },
    fileWrite() { let o = this; file.writeText({ uri: 'internal://app/testfile1', text: 'data info' + o.index, success: function (d) { o.resultText = 'writeText ok\n'; o.statusMsg = 'writeText ok, read...'; o.index++; o.fileRead(); }, fail: function (d, c) { o.hasError = true; o.resultText = 'writeText fail\n'; o.statusMsg = 'writeText fail, read...'; getApp().data.testItems['api_file'].errorDetail = 'writeText fail: code=' + c; o.fileRead(); } }); },
    fileRead() { let o = this; file.readText({ uri: 'internal://app/testfile1', success: function (d) { o.resultText += 'readText ok\n'; o.statusMsg = 'readText ok, writeArr...'; o.fileWriteArray(); }, fail: function (d, c) { o.hasError = true; o.resultText += 'readText fail\n'; o.statusMsg = 'readText fail, writeArr...'; getApp().data.testItems['api_file'].errorDetail = 'readText fail: code=' + c; o.fileWriteArray(); } }); },
    fileWriteArray() { let o = this; file.writeArrayBuffer({ uri: 'internal://app/testfile3', buffer: new Uint8Array(8), success: function (d) { o.resultText += 'writeArrayBuffer ok\n'; o.statusMsg = 'writeArr ok, readArr...'; o.fileReadArray(); }, fail: function (d, c) { o.hasError = true; o.resultText += 'writeArrayBuffer fail\n'; o.statusMsg = 'writeArr fail, readArr...'; getApp().data.testItems['api_file'].errorDetail = 'writeArrayBuffer fail: code=' + c; o.fileReadArray(); } }); },
    fileReadArray() { let o = this; file.readArrayBuffer({ uri: 'internal://app/testfile3', success: function (d) { o.resultText += 'readArrayBuffer ok\n'; o.statusMsg = 'readArr ok, mkdir...'; o.fileMkdir(); }, fail: function (d, c) { o.hasError = true; o.resultText += 'readArrayBuffer fail\n'; o.statusMsg = 'readArr fail, mkdir...'; getApp().data.testItems['api_file'].errorDetail = 'readArrayBuffer fail: code=' + c; o.fileMkdir(); } }); },
    fileMkdir() { let o = this; file.mkdir({ uri: 'internal://app/testDirectory', success: function (d) { o.resultText += 'mkdir ok\n'; o.statusMsg = 'mkdir ok, rmdir...'; o.fileRmdir(); }, fail: function (d, c) { o.hasError = true; o.resultText += 'mkdir fail\n'; o.statusMsg = 'mkdir fail, rmdir...'; getApp().data.testItems['api_file'].errorDetail = 'mkdir fail: code=' + c; o.fileRmdir(); } }); },
    fileRmdir() { let o = this; file.rmdir({ uri: 'internal://app/testDirectory', recursive: true, success: function (d) { o.resultText += 'rmdir ok\n'; o.statusMsg = 'rmdir ok, list...'; o.fileList(); }, fail: function (d, c) { o.hasError = true; o.resultText += 'rmdir fail\n'; o.statusMsg = 'rmdir fail, list...'; getApp().data.testItems['api_file'].errorDetail = 'rmdir fail: code=' + c; o.fileList(); } }); },
    fileList() { let o = this; file.list({ uri: 'internal://app', success: function (d) { o.resultText += 'list ok\n'; o.statusMsg = 'list ok, get...'; o.fileGet(); }, fail: function (d, c) { o.hasError = true; o.resultText += 'list fail\n'; o.statusMsg = 'list fail, get...'; getApp().data.testItems['api_file'].errorDetail = 'list fail: code=' + c; o.fileGet(); } }); },
    fileGet() { let o = this; file.get({ uri: 'internal://app/testfile1', success: function (d) { o.resultText += 'get ok\n'; o.statusMsg = 'get ok, move...'; o.fileMove(); }, fail: function (d, c) { o.hasError = true; o.resultText += 'get fail\n'; o.statusMsg = 'get fail, move...'; getApp().data.testItems['api_file'].errorDetail = 'get fail: code=' + c; o.fileMove(); } }); },
    fileMove() { let o = this; file.move({ srcUri: 'internal://app/testfile1', dstUri: 'internal://app/testfile2', success: function (d) { o.resultText += 'move ok\n'; o.statusMsg = 'move ok, copy...'; o.fileCopy(); }, fail: function (d, c) { o.hasError = true; o.resultText += 'move fail\n'; o.statusMsg = 'move fail, copy...'; getApp().data.testItems['api_file'].errorDetail = 'move fail: code=' + c; o.fileCopy(); } }); },
    fileCopy() { let o = this; file.copy({ srcUri: 'internal://app/testfile2', dstUri: 'internal://app/testfile4', success: function (d) { o.resultText += 'copy ok\n'; o.statusMsg = 'copy ok, delete...'; o.fileDel(); }, fail: function (d, c) { o.hasError = true; o.resultText += 'copy fail\n'; o.statusMsg = 'copy fail, delete...'; getApp().data.testItems['api_file'].errorDetail = 'copy fail: code=' + c; o.fileDel(); } }); },
    fileDel() { let o = this; file.delete({ uri: 'internal://app/testfile2', success: function (d) { o.resultText += 'delete ok\n'; o.statusMsg = 'delete ok, access...'; o.fileAccess(); }, fail: function (d, c) { o.hasError = true; o.resultText += 'delete fail\n'; o.statusMsg = 'delete fail, access...'; getApp().data.testItems['api_file'].errorDetail = 'delete fail: code=' + c; o.fileAccess(); } }); },
    fileAccess() { let o = this; file.access({ uri: 'internal://app/testfile4', success: function (d) { o.resultText += 'access ok\n'; o.statusMsg = o.hasError ? 'done: fail' : 'done: success'; }, fail: function (d, c) { o.hasError = true; o.resultText += 'access fail\n'; o.statusMsg = 'done: access fail'; getApp().data.testItems['api_file'].errorDetail = 'access fail: code=' + c; } }); },
    passF() { if (getApp().data.testItems['api_file'].status === 'pass') { getApp().data.testItems['api_file'].status = 'null'; this.fPassColor = '#555555'; this.fFailColor = '#555555'; } else { getApp().data.testItems['api_file'].status = this.hasError ? 'fail' : 'pass'; this.fPassColor = '#4caf50'; this.fFailColor = '#555555'; } },
    failF() { if (getApp().data.testItems['api_file'].status === 'fail') { getApp().data.testItems['api_file'].status = 'null'; this.fFailColor = '#555555'; this.fPassColor = '#555555'; } else { getApp().data.testItems['api_file'].status = 'fail'; this.fFailColor = '#f44336'; this.fPassColor = '#555555'; } },
    helpClicked() {
        getApp().data.helpData = { step: '进入自动 canIUse 检测；不支持时跳过。支持时点测试file，链式执行 writeText/readText/writeArrayBuffer/readArrayBuffer/mkdir/rmdir/list/get/move/copy/delete/access。', result: '全部成功 → pass；任一失败 → fail。', url: 'pages/FileManagement/file/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() { router.replace({ uri: 'pages/index/index' }); },
    backClicked() { this.back(); }
};
