import router from '@system.router';
import file from '@system.file';

export default {
    data: {
        resultText: '',
        statusMsg: '',
        index: 0,
        hasError: false,
    },

    checkFile() {
        this.resultText = '';
        this.statusMsg = 'testing...';
        this.hasError = false;
        try {
            this.fileWrite();
        } catch (e) {
            console.error('error: ' + e);
            this.hasError = true;
            getApp().data.testItems['api_file'].errorDetail = 'checkFile error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    fileWrite() {
        let obj = this;
        file.writeText({
            uri: 'internal://app/testfile1',
            text: 'data info' + obj.index,
            success: function(data) {
                obj.resultText = 'writeText success\n';
                obj.statusMsg = 'writeText success, reading...';
                obj.index++;
                obj.fileRead();
            },
            fail: function(data, code) {
                obj.hasError = true;
                obj.resultText = 'writeText fail\n';
                obj.statusMsg = 'writeText fail, reading...';
                getApp().data.testItems['api_file'].errorDetail = 'writeText fail: code=' + code + ', data=' + data;
                obj.fileRead();
            },
            complete: function() {
            }
        });
    },

    fileRead() {
        let obj = this;
        file.readText({
            uri: 'internal://app/testfile1',
            success: function(data) {
                obj.resultText += 'readText success\n';
                obj.statusMsg = 'readText success, writing array...';
                obj.fileWriteArray();
            },
            fail: function(data, code) {
                obj.hasError = true;
                getApp().data.testItems['api_file'].errorDetail = 'readText fail: code=' + code + ', data=' + data;
                obj.resultText += 'readText fail\n';
                obj.statusMsg = 'readText fail, writing array...';
                obj.fileWriteArray();
            },
            complete: function() {
            }
        });
    },

    fileWriteArray() {
        let obj = this;
        file.writeArrayBuffer({
            uri: 'internal://app/testfile3',
            buffer: new Uint8Array(8),
            success: function(data) {
                obj.resultText += 'writeArrayBuffer success\n';
                obj.statusMsg = 'writeArrayBuffer success, reading array...';
                obj.fileReadArray();
            },
            fail: function(data, code) {
                obj.hasError = true;
                getApp().data.testItems['api_file'].errorDetail = 'writeArrayBuffer fail: code=' + code + ', data=' + data;
                obj.resultText += 'writeArrayBuffer fail\n';
                obj.statusMsg = 'writeArrayBuffer fail, reading array...';
                obj.fileReadArray();
            },
            complete: function() {
            }
        });
    },

    fileReadArray() {
        let obj = this;
        file.readArrayBuffer({
            uri: 'internal://app/testfile3',
            success: function(data) {
                obj.resultText += 'readArrayBuffer success\n';
                obj.statusMsg = 'readArrayBuffer success, mkdir...';
                obj.fileMkdir();
            },
            fail: function(data, code) {
                obj.hasError = true;
                getApp().data.testItems['api_file'].errorDetail = 'readArrayBuffer fail: code=' + code + ', data=' + data;
                obj.resultText += 'readArrayBuffer fail\n';
                obj.statusMsg = 'readArrayBuffer fail, mkdir...';
                obj.fileMkdir();
            },
            complete: function() {
            }
        });
    },

    fileMkdir() {
        let obj = this;
        file.mkdir({
            uri: 'internal://app/testDirectory',
            success: function(data) {
                obj.resultText += 'mkdir success\n';
                obj.statusMsg = 'mkdir success, rmdir...';
                obj.fileRmdir();
            },
            fail: function(data, code) {
                obj.hasError = true;
                getApp().data.testItems['api_file'].errorDetail = 'mkdir fail: code=' + code + ', data=' + data;
                obj.resultText += 'mkdir fail\n';
                obj.statusMsg = 'mkdir fail, rmdir...';
                obj.fileRmdir();
            },
            complete: function() {
            }
        });
    },

    fileRmdir() {
        let obj = this;
        file.rmdir({
            uri: 'internal://app/testDirectory',
            recursive: true,
            success: function(data) {
                obj.resultText += 'rmdir success\n';
                obj.statusMsg = 'rmdir success, list...';
                obj.fileList();
            },
            fail: function(data, code) {
                obj.hasError = true;
                getApp().data.testItems['api_file'].errorDetail = 'rmdir fail: code=' + code + ', data=' + data;
                obj.resultText += 'rmdir fail\n';
                obj.statusMsg = 'rmdir fail, list...';
                obj.fileList();
            },
            complete: function() {
            }
        });
    },

    fileList() {
        let obj = this;
        file.list({
            uri: 'internal://app',
            success: function(data) {
                obj.resultText += 'list success\n';
                obj.statusMsg = 'list success, get...';
                obj.fileGet();
            },
            fail: function(data, code) {
                obj.hasError = true;
                getApp().data.testItems['api_file'].errorDetail = 'list fail: code=' + code + ', data=' + data;
                obj.resultText += 'list fail\n';
                obj.statusMsg = 'list fail, get...';
                obj.fileGet();
            },
            complete: function() {
            }
        });
    },

    fileGet() {
        let obj = this;
        file.get({
            uri: 'internal://app/testfile1',
            success: function(data) {
                obj.content = JSON.stringify(data);
                obj.resultText += 'get success\n';
                obj.statusMsg = 'get success, move...';
                obj.fileMove();
            },
            fail: function(data, code) {
                obj.hasError = true;
                getApp().data.testItems['api_file'].errorDetail = 'get fail: code=' + code + ', data=' + data;
                obj.resultText += 'get fail\n';
                obj.statusMsg = 'get fail, move...';
                obj.fileMove();
            },
            complete: function() {
            }
        });
    },

    fileMove() {
        let obj = this;
        file.move({
            srcUri: 'internal://app/testfile1',
            dstUri: 'internal://app/testfile2',
            success: function(uri) {
                obj.resultText += 'move success\n';
                obj.statusMsg = 'move success, copy...';
                obj.fileCopy();
            },
            fail: function(data, code) {
                obj.hasError = true;
                getApp().data.testItems['api_file'].errorDetail = 'move fail: code=' + code + ', data=' + data;
                obj.resultText += 'move fail\n';
                obj.statusMsg = 'move fail, copy...';
                obj.fileCopy();
            },
            complete: function() {
            }
        });
    },

    fileCopy() {
        let obj = this;
        file.copy({
            srcUri: 'internal://app/testfile2',
            dstUri: 'internal://app/testfile4',
            success: function(uri) {
                obj.resultText += 'copy success\n';
                obj.statusMsg = 'copy success, delete...';
                obj.fileDel();
            },
            fail: function(data, code) {
                obj.hasError = true;
                getApp().data.testItems['api_file'].errorDetail = 'copy fail: code=' + code + ', data=' + data;
                obj.resultText += 'copy fail\n';
                obj.statusMsg = 'copy fail, delete...';
                obj.fileDel();
            },
            complete: function() {
            }
        });
    },

    fileDel() {
        let obj = this;
        file.delete({
            uri: 'internal://app/testfile2',
            success: function(data) {
                obj.resultText += 'delete success\n';
                obj.statusMsg = 'delete success, access...';
                obj.fileAccess();
            },
            fail: function(data, code) {
                obj.hasError = true;
                getApp().data.testItems['api_file'].errorDetail = 'delete fail: code=' + code + ', data=' + data;
                obj.resultText += 'delete fail\n';
                obj.statusMsg = 'delete fail, access...';
                obj.fileAccess();
            },
            complete: function() {
            }
        });
    },

    fileAccess() {
        let obj = this;
        file.access({
            uri: 'internal://app/testfile4',
            success: function(data) {
                obj.resultText += 'access success\n';
                obj.statusMsg = obj.hasError ? 'fail' : 'success';
            },
            fail: function(data, code) {
                obj.hasError = true;
                getApp().data.testItems['api_file'].errorDetail = 'access fail: code=' + code + ', data=' + data;
                obj.resultText += 'access fail\n';
                obj.statusMsg = 'fail code: ' + code;
            },
            complete: function() {
            }
        });
    },

    helpClicked() {
        getApp().data.helpData = { step: '点击测试file按钮', result: '屏幕上依次呈现各接口的测试结果', url: 'pages/FileManagement/file/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/index/index' });
    },
    passClicked() {
        getApp().data.testItems['api_file'].status = this.hasError ? 'fail' : 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['api_file'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
