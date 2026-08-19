import router from '@system.router';
import file from '@system.file';

export default {
    data: {
        resultText: '',
        statusMsg: '',
    },

    checkFile() {
        console.info('checkFile');
        try {
            this.fileWrite();
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems.api_file.errorDetail = 'checkFile error: ' + e;
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
                obj.statusMsg = 'success';
                console.log('write call success');
                obj.index++;
                obj.fileRead();
            },
            fail: function(data, code) {
                obj.resultText = 'writeText fail\n';
                obj.statusMsg = 'fail code: ' + code;
                console.log('write call fail');
                getApp().data.testItems.api_file.errorDetail = 'writeText fail: code=' + code + ', data=' + data;
                obj.fileRead();
            },
            complete: function() {
                console.log('write call complete');
            }
        });
    },

    fileRead() {
        let obj = this;
        file.readText({
            uri: 'internal://app/testfile1',
            success: function(data) {
                console.log('read call success');
                obj.resultText += 'readText success\n';
                obj.fileWriteArray();
            },
            fail: function(data, code) {
                console.log('read call fail');
                getApp().data.testItems.api_file.errorDetail = 'readText fail: code=' + code + ', data=' + data;
                obj.resultText += 'readText fail\n';
                obj.fileWriteArray();
            },
            complete: function() {
                console.log('read call complete');
            }
        });
    },

    fileWriteArray() {
        let obj = this;
        file.writeArrayBuffer({
            uri: 'internal://app/testfile3',
            buffer: new Uint8Array(8),
            success: function(data) {
                console.log('write call success');
                obj.resultText += 'writeArrayBuffer success\n';
                obj.fileReadArray();
            },
            fail: function(data, code) {
                console.log('write call fail');
                getApp().data.testItems.api_file.errorDetail = 'writeArrayBuffer fail: code=' + code + ', data=' + data;
                obj.resultText += 'writeArrayBuffer fail\n';
                obj.fileReadArray();
            },
            complete: function() {
                console.log('write call complete');
            }
        });
    },

    fileReadArray() {
        let obj = this;
        file.readArrayBuffer({
            uri: 'internal://app/testfile3',
            success: function(data) {
                console.log('read call success' + data.buffer);
                obj.resultText += 'readArrayBuffer success\n';
                obj.fileMkdir();
            },
            fail: function(data, code) {
                console.log('read call fail');
                getApp().data.testItems.api_file.errorDetail = 'readArrayBuffer fail: code=' + code + ', data=' + data;
                obj.resultText += 'readArrayBuffer fail\n';
                obj.fileMkdir();
            },
            complete: function() {
                console.log('read call complete');
            }
        });
    },

    fileMkdir() {
        let obj = this;
        file.mkdir({
            uri: 'internal://app/testDirectory',
            success: function(data) {
                console.log('mkdir call success');
                obj.resultText += 'mkdir success\n';
                obj.fileRmdir();
            },
            fail: function(data, code) {
                console.log('mkdir call fail');
                getApp().data.testItems.api_file.errorDetail = 'mkdir fail: code=' + code + ', data=' + data;
                obj.resultText += 'mkdir fail\n';
                obj.fileRmdir();
            },
            complete: function() {
                console.log('mkdir call complete');
            }
        });
    },

    fileRmdir() {
        let obj = this;
        file.rmdir({
            uri: 'internal://app/testDirectory',
            recursive: true,
            success: function(data) {
                console.log('rmdir call success');
                obj.resultText += 'rmdir success\n';
                obj.fileList();
            },
            fail: function(data, code) {
                console.log('rmdir call fail');
                getApp().data.testItems.api_file.errorDetail = 'rmdir fail: code=' + code + ', data=' + data;
                obj.resultText += 'rmdir fail\n';
                obj.fileList();
            },
            complete: function() {
                console.log('rmdir call complete');
            }
        });
    },

    fileList() {
        let obj = this;
        file.list({
            uri: 'internal://app',
            success: function(data) {
                console.log('list call success ' + JSON.stringify(data.fileList));
                obj.resultText += 'list success\n';
                obj.fileGet();
            },
            fail: function(data, code) {
                console.log('list call fail');
                getApp().data.testItems.api_file.errorDetail = 'list fail: code=' + code + ', data=' + data;
                obj.resultText += 'list fail\n';
                obj.fileGet();
            },
            complete: function() {
                console.log('list call complete');
            }
        });
    },

    fileGet() {
        let obj = this;
        file.get({
            uri: 'internal://app/testfile1',
            success: function(data) {
                console.log('get call success ' + JSON.stringify(data));
                obj.content = JSON.stringify(data);
                obj.resultText += 'get success\n';
                obj.fileMove();
            },
            fail: function(data, code) {
                console.log('get call fail');
                getApp().data.testItems.api_file.errorDetail = 'get fail: code=' + code + ', data=' + data;
                obj.resultText += 'get fail\n';
                obj.fileMove();
            },
            complete: function() {
                console.log('get call complete');
            }
        });
    },

    fileMove() {
        let obj = this;
        file.move({
            srcUri: 'internal://app/testfile1',
            dstUri: 'internal://app/testfile2',
            success: function(uri) {
                console.log('move call success :' + uri);
                obj.resultText += 'move success\n';
                obj.fileCopy();
            },
            fail: function(data, code) {
                console.log('move call fail');
                getApp().data.testItems.api_file.errorDetail = 'move fail: code=' + code + ', data=' + data;
                obj.resultText += 'move fail\n';
                obj.fileCopy();
            },
            complete: function() {
                console.log('move call complete');
            }
        });
    },

    fileCopy() {
        let obj = this;
        file.copy({
            srcUri: 'internal://app/testfile2',
            dstUri: 'internal://app/testfile4',
            success: function(uri) {
                console.log('copy call success :' + uri);
                obj.resultText += 'copy success\n';
                obj.fileDel();
            },
            fail: function(data, code) {
                console.log('copy call fail');
                getApp().data.testItems.api_file.errorDetail = 'copy fail: code=' + code + ', data=' + data;
                obj.resultText += 'copy fail\n';
                obj.fileDel();
            },
            complete: function() {
                console.log('copy call complete');
            }
        });
    },

    fileDel() {
        let obj = this;
        file.delete({
            uri: 'internal://app/testfile2',
            success: function(data) {
                console.log('del call success');
                obj.resultText += 'delete success\n';
                obj.fileAccess();
            },
            fail: function(data, code) {
                console.log('del call fail');
                getApp().data.testItems.api_file.errorDetail = 'delete fail: code=' + code + ', data=' + data;
                obj.resultText += 'delete fail\n';
                obj.fileAccess();
            },
            complete: function() {
                console.log('del call complete');
            }
        });
    },

    fileAccess() {
        let obj = this;
        file.access({
            uri: 'internal://app/testfile4',
            success: function(data) {
                console.log('del src file exist.');
                obj.resultText += 'access success\n';
                obj.statusMsg = 'success';
            },
            fail: function(data, code) {
                console.log('del src file not exist.');
                getApp().data.testItems.api_file.errorDetail = 'access fail: code=' + code + ', data=' + data;
                obj.resultText += 'access fail\n';
                obj.statusMsg = 'fail code: ' + code;
            },
            complete: function() {
                console.log('del src access call complete.');
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
        getApp().data.testItems.api_file.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.api_file.status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
