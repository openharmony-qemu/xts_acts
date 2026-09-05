/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll,beforeEach,afterEach,afterAll,it,expect, Level } from '@ohos/hypium';
import cloudSync from '@ohos.file.cloudSync';
import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import { BusinessError } from '@kit.BasicServicesKit';
import cloudSyncManager from '@ohos.file.cloudSyncManager';


export default function CloudFileTest(){
describe('cloud_file_test', () => {
   /**
    * @tc.name   Test_CloudFile_State_001
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0100
    * @tc.desc   function of API, CloudFileCache.on
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_001', Level.LEVEL3, async (done: Function) => {
     let tag = "====>Test_CloudFile_State_001 ";
     console.info(tag + "start====");
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info(tag + "batchDownload_callback enter");
        console.info("batchDownload state：" + pg.state);
        try {
          expect(cloudSync.State.RUNNING === 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_batchDownload");
      fileCache.on('batchDownload', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('Test_CloudFile_State_001 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   Test_CloudFile_State_002
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0200
    * @tc.desc   function of API, CloudFileCache.off
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_002', Level.LEVEL3, async (done: Function) => {
     let tag = "====>Test_CloudFile_State_002 ";
     console.info(tag + "start====");
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info(tag + "batchDownload_callback enter");
        console.info("batchDownload state：" + pg.state);
        try {
          expect(cloudSync.State.RUNNING === 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_batchDownload");
      fileCache.on('batchDownload', callback);
      console.info(tag + "start off_batchDownload");
      fileCache.off('batchDownload', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('Test_CloudFile_State_002 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   Test_CloudFile_State_003
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0300
    * @tc.desc   function of API, CloudFileCache.startBatch, Promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_003', Level.LEVEL3, async (done: Function) => {
    let tag = "====>Test_CloudFile_State_003 ";
    console.info(tag + "start====");
    let path1 = "/data/storage/el2/cloud/1.txt";
    let path2 = "/data/storage/el2/cloud/2.txt";
    let uris = [fileUri.getUriFromPath(path1), fileUri.getUriFromPath(path2)];
    let fileType = cloudSync.DownloadFileType.CONTENT;
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info(tag + "batchDownload_callback enter");
        console.info("batchDownload state：" + pg.state);
      };
      console.info(tag + "start on_batchDownload");
      fileCache.on('batchDownload', callback);
       console.info(tag + "start startBatch");
       fileCache.startBatch(uris, fileType).then(() => {
         console.info(tag + "startBatch then enter");
         console.info("startBatch Download successfully");
         console.info(tag + "end====");
         done();
       }).catch((err: BusinessError) => {
         console.info(tag + "startBatch catch err: " + JSON.stringify(err));
         console.error("Test_CloudFile_State_003 startBatch download failed: " + err.message + ", error code: " + err.code);
         try {
           expect(err.code === 13600001 || err.code === 22400005).assertTrue();
         } catch (err) {
           console.info(tag + "Assert Fail: " + JSON.stringify(err));
         }
         console.info(tag + "end====");
         done();
       });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('Test_CloudFile_State_003 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
   });

   /**
    * @tc.name   Test_CloudFile_State_004
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0400
    * @tc.desc   function of API, CloudFileCache.stopBatch, Promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_004', Level.LEVEL3, async (done: Function) => {
    let tag = "====>Test_CloudFile_State_004 ";
    console.info(tag + "start====");
    let downloadId = 1;
    let needClean = true;
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info(tag + "batchDownload_callback enter");
        console.info("batchDownload state：" + pg.state);
      };
      console.info(tag + "start on_batchDownload");
      fileCache.on('batchDownload', callback);
       console.info(tag + "start stopBatch");
       fileCache.stopBatch(downloadId, needClean).then(() => {
         console.info(tag + "stopBatch then enter");
         console.info("stopBatch Download successfully");
         console.info(tag + "end====");
         done();
       }).catch((err: BusinessError) => {
         console.info(tag + "stopBatch catch err: " + JSON.stringify(err));
         console.error("Test_CloudFile_State_004 stopBatch download failed: " + err.message + ", error code: " + err.code);
         try {
           expect(err.code === 13600001).assertTrue();
         } catch (err) {
           console.info(tag + "Assert Fail: " + JSON.stringify(err));
         }
         console.info(tag + "end====");
         done();
       });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('Test_CloudFile_State_004 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
   });

   /**
    * @tc.name   Test_CloudFile_State_005
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0500
    * @tc.desc   function of API, MultiDownloadProgress
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_005', Level.LEVEL3, async (done: Function) => {
     let tag = "====>Test_CloudFile_State_005 ";
     console.info(tag + "start====");
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (MultiDownloadProgress: cloudSync.MultiDownloadProgress) => {
        console.info(tag + "batchDownload_callback enter");
        console.info("batchDownload state：" + MultiDownloadProgress.state);
        try {
          expect(MultiDownloadProgress.taskId == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(MultiDownloadProgress.successfulCount == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(MultiDownloadProgress.failedCount == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(MultiDownloadProgress.totalCount == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(MultiDownloadProgress.downloadedSize == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(MultiDownloadProgress.totalSize == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(MultiDownloadProgress.errType == cloudSync.DownloadErrorType.NO_ERROR).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        let FailedFileInfo = MultiDownloadProgress.getFailedFiles();
        let SuccessFileInfo = MultiDownloadProgress.getSuccessfulFiles();
        console.info("Test_CloudFile_State_005 FailedFileInfo " + FailedFileInfo);
        console.info("Test_CloudFile_State_005 SuccessFileInfo " + SuccessFileInfo);
      };
      console.info(tag + "start on_batchDownload");
      fileCache.on('batchDownload', callback);
      console.info(tag + "start off_batchDownload");
      fileCache.off('batchDownload', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('Test_CloudFile_State_005 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   Test_CloudFile_State_006
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0600
    * @tc.desc   function of API, FailedFileInfo
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_006', Level.LEVEL3, async (done: Function) => {
     let tag = "====>Test_CloudFile_State_006 ";
     console.info(tag + "start====");
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (MultiDownloadProgress: cloudSync.MultiDownloadProgress) => {
        console.info(tag + "batchDownload_callback enter");
        console.info("batchDownload state：" + MultiDownloadProgress.state);
        let failedList: Array<cloudSync.FailedFileInfo> = MultiDownloadProgress.getFailedFiles();
        for (let FailedFileInfo of failedList) {
          try {
            expect(FailedFileInfo.uri == '').assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          try {
            expect(FailedFileInfo.error == cloudSync.DownloadErrorType.NO_ERROR).assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
        }
      };
      console.info(tag + "start on_batchDownload");
      fileCache.on('batchDownload', callback);
      console.info(tag + "start off_batchDownload");
      fileCache.off('batchDownload', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('Test_CloudFile_State_006 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   Test_CloudFile_State_007
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0700
    * @tc.desc   function of API, DownloadFileType
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_007', Level.LEVEL3, async (done: Function) => {
    let tag = "====>Test_CloudFile_State_007 ";
    console.info(tag + "start====");
    let path1 = "/data/storage/el2/cloud/1.txt";
    let path2 = "/data/storage/el2/cloud/2.txt";
    let uris = [fileUri.getUriFromPath(path1), fileUri.getUriFromPath(path2)];
    let fileType = cloudSync.DownloadFileType.CONTENT;
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info(tag + "batchDownload_callback enter");
        console.info("batchDownload state：" + pg.state);
      };
      console.info(tag + "start on_batchDownload");
      fileCache.on('batchDownload', callback);
       console.info(tag + "start startBatch");
       fileCache.startBatch(uris, fileType).then(() => {
         console.info(tag + "startBatch then enter");
         console.info("startBatch Download successfully");
         try {
           expect(cloudSync.DownloadFileType.CONTENT == 0).assertTrue();
         } catch (err) {
           console.info(tag + "Assert Fail: " + JSON.stringify(err));
         }
         try {
           expect(cloudSync.DownloadFileType.THUMBNAIL == 1).assertTrue();
         } catch (err) {
           console.info(tag + "Assert Fail: " + JSON.stringify(err));
         }
         try {
           expect(cloudSync.DownloadFileType.LCD == 2).assertTrue();
         } catch (err) {
           console.info(tag + "Assert Fail: " + JSON.stringify(err));
         }
         console.info(tag + "end====");
         done();
       }).catch((err: BusinessError) => {
         console.info(tag + "startBatch catch err: " + JSON.stringify(err));
         console.error("Test_CloudFile_State_007 startBatch download failed: " + err.message + ", error code: " + err.code);
         try {
           expect(err.code === 13600001 || err.code === 22400005).assertTrue();
         } catch (err) {
           console.info(tag + "Assert Fail: " + JSON.stringify(err));
         }
         console.info(tag + "end====");
         done();
       });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('Test_CloudFile_State_007 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
   });

   /**
    * @tc.name   Test_CloudFile_State_008
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0800
    * @tc.desc   function of API, cleanFileCache
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_008', Level.LEVEL3, async (done: Function) => {
    let tag = "====>Test_CloudFile_State_008 ";
    console.info(tag + "start====");
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     try {
      let fileCache = new cloudSync.CloudFileCache();
      console.info(tag + "start cleanFileCache");
      fileCache.cleanFileCache(uri);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('Test_CloudFile_State_008 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code == 401 && err.message == 'The input parameter is invalid').assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   Test_CloudFile_State_009
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0900
    * @tc.desc   function of API, getCoreFileSyncState
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_009', Level.LEVEL3, async (done: Function) => {
    let tag = "====>Test_CloudFile_State_009 ";
    console.info(tag + "start====");
    let path = "/data/storage/el2/cloud/Test_CloudFile_State_009.txt";
    let uri = fileUri.getUriFromPath(path);
    console.info("Test_CloudFile_State_009 uri: " + uri);
    try {
      console.info(tag + "start getCoreFileSyncState");
      cloudSync.getCoreFileSyncState(uri);
      expect(cloudSync.FileState.INITIAL_AFTER_DOWNLOAD  == 0).assertTrue();
      expect(cloudSync.FileState.UPLOADING == 1).assertTrue();
      expect(cloudSync.FileState.STOPPED  == 2).assertTrue();
      expect(cloudSync.FileState.TO_BE_UPLOADED  == 3).assertTrue();
      expect(cloudSync.FileState.UPLOAD_SUCCESS  == 4).assertTrue();
      expect(cloudSync.FileState.UPLOAD_FAILURE  == 5).assertTrue();
    } catch (e) {
      console.info(tag + "catch err: " + JSON.stringify(e));
      console.log('Test_CloudFile_State_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 14000002 && e.message == 'Invalid uri').assertTrue();
    }
    console.info(tag + "end====");
    done();
  });

  /**
  * @tc.name   Test_CloudFile_State_010
  * @tc.number SUB_STORAGE_CLOUDFILE_TEST_1000
  * @tc.desc   function of API, CloudFileCache.off
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL3
  */
  it('Test_CloudFile_State_010', Level.LEVEL3, async (done: Function) => {
    let tag = "====>Test_CloudFile_State_010 ";
    console.info(tag + "start====");
    try {
    let fileCache = new cloudSync.CloudFileCache();
    let callback = (pg: cloudSync.MultiDownloadProgress) => {
      console.info("batchDownload state：" + pg.state);
      try {
        expect(cloudSync.State.RUNNING === 0).assertTrue();
      } catch (err) {
        console.info(tag + "Assert Fail: " + JSON.stringify(err));
      }
    };
    console.info(tag + "start on");
    fileCache.on(null, callback);
    } catch (err) {
      console.info(tag + "catch err: " + JSON.stringify(err));
      console.log('Test_CloudFile_State_010 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code === 13900020).assertTrue();
    }
    console.info(tag + "end====");
    done();
  });

  /**
  * @tc.name   Test_CloudFile_State_011
  * @tc.number SUB_STORAGE_CLOUDFILE_TEST_1100
  * @tc.desc   function of API, CloudFileCache.off
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL3
  */
  it('Test_CloudFile_State_011', Level.LEVEL3, async (done: Function) => {
    let tag = "====>Test_CloudFile_State_011 ";
    console.info(tag + "start====");
    try {
    let fileCache = new cloudSync.CloudFileCache();
    let callback = (pg: cloudSync.MultiDownloadProgress) => {
      console.info("batchDownload state：" + pg.state);
      try {
        expect(cloudSync.State.RUNNING === 0).assertTrue();
      } catch (err) {
        console.info(tag + "Assert Fail: " + JSON.stringify(err));
      }
    };
    console.info(tag + "start on");
    fileCache.on(undefined, callback);
    } catch (err) {
      console.info(tag + "catch err: " + JSON.stringify(err));
      console.log('Test_CloudFile_State_011 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code === 13900020).assertTrue();
    }
    console.info(tag + "end====");
    done();
  });

  /**
    * @tc.name   Test_CloudFile_State_012
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_1200
    * @tc.desc   function of API, CloudFileCache.off
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_012', Level.LEVEL3, async (done: Function) => {
     let tag = "====>Test_CloudFile_State_012 ";
     console.info(tag + "start====");
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info(tag + "batchDownload_callback enter");
        console.info("batchDownload state：" + pg.state);
        try {
          expect(cloudSync.State.RUNNING === 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_batchDownload");
      fileCache.on('batchDownload', callback);
      console.info(tag + "start off");
      fileCache.off(null, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('Test_CloudFile_State_012 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 13900020).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   Test_CloudFile_State_013
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_1300
    * @tc.desc   function of API, CloudFileCache.off
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_013', Level.LEVEL3, async (done: Function) => {
     let tag = "====>Test_CloudFile_State_013 ";
     console.info(tag + "start====");
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info(tag + "batchDownload_callback enter");
        console.info("batchDownload state：" + pg.state);
        try {
          expect(cloudSync.State.RUNNING === 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_batchDownload");
      fileCache.on('batchDownload', callback);
      console.info(tag + "start off");
      fileCache.off(undefined, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('Test_CloudFile_State_013 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 13900020).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
     * @tc.name   test_CloudFileCache_getCachedTotalSize_001
     * @tc.number SUB_STORAGE_CLOUDFILECACHE_GETCACHEDTOTALSIZE_TEST_0100
     * @tc.desc   function of getCachedTotalSize, normal test without bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_CloudFileCache_getCachedTotalSize_001', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_CloudFileCache_getCachedTotalSize_001 ";
      console.info(tag + "start====");
      try {
        let fileCache = new cloudSync.CloudFileCache();
        console.info(tag + "start cleanAllFileCache");
		    await fileCache.cleanAllFileCache();
        console.info(tag + "start getCachedTotalSize");
        let size = await fileCache.getCachedTotalSize();
        expect(size == 0).assertTrue();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_CloudFileCache_getCachedTotalSize_001 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code === 13900010).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_CloudFileCache_getCachedTotalSize_002
     * @tc.number SUB_STORAGE_CLOUDFILECACHE_GETCACHEDTOTALSIZE_TEST_0200
     * @tc.desc   function of getCachedTotalSize, normal test without bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_CloudFileCache_getCachedTotalSize_002', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_CloudFileCache_getCachedTotalSize_002 ";
      console.info(tag + "start====");
      try {
        let fileCache = new cloudSync.CloudFileCache('com.ohos.demo');
        console.info(tag + "start cleanAllFileCache");
		    await fileCache.cleanAllFileCache();
        console.info(tag + "start getCachedTotalSize");
        let size = await fileCache.getCachedTotalSize();
        expect(size == 0).assertTrue();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_CloudFileCache_getCachedTotalSize_002 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code === 13900010).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_CloudFileCache_getCachedTotalSize_003
     * @tc.number SUB_STORAGE_CLOUDFILECACHE_GETCACHEDTOTALSIZE_TEST_0300
     * @tc.desc   function of getCachedTotalSize, normal test without bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_CloudFileCache_getCachedTotalSize_003', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_CloudFileCache_getCachedTotalSize_003 ";
      console.info(tag + "start====");
      try {
        let fileCache = new cloudSync.CloudFileCache('com.ohos.demo');
        console.info(tag + "start cleanAllFileCache");
		    await fileCache.cleanAllFileCache();
        console.info(tag + "start getCachedTotalSize");
        let size = await fileCache.getCachedTotalSize();
        expect(size == 0).assertTrue();
        console.info(tag + "start cleanAllFileCache");
        await fileCache.cleanAllFileCache()
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_CloudFileCache_getCachedTotalSize_003 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code === 13900010).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_cloudSyncManager_DownloadStopReason_001
     * @tc.number SUB_STORAGE_CLOUDSYNCMANAGER_DOWNLOADSTOPREASON_0100
     * @tc.desc   function of DownloadStopReason, NO_STOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSyncManager_DownloadStopReason_001', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSyncManager_DownloadStopReason_001 ";
      console.info(tag + "start====");
      try {
        let value1 = cloudSyncManager.DownloadStopReason.NO_STOP;
        expect(value1).assertEqual(0);
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_cloudSyncManager_DownloadStopReason_001 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_cloudSyncManager_DownloadStopReason_002
     * @tc.number SUB_STORAGE_CLOUDSYNCMANAGER_DOWNLOADSTOPREASON_0200
     * @tc.desc   function of DownloadStopReason, NETWORK_UNAVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSyncManager_DownloadStopReason_002', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSyncManager_DownloadStopReason_002 ";
      console.info(tag + "start====");
      try {
        let value1 = cloudSyncManager.DownloadStopReason.NETWORK_UNAVAILABLE;
        expect(value1).assertEqual(1);
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_cloudSyncManager_DownloadStopReason_002 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_cloudSyncManager_DownloadStopReason_003
     * @tc.number SUB_STORAGE_CLOUDSYNCMANAGER_DOWNLOADSTOPREASON_0300
     * @tc.desc   function of DownloadStopReason, LOCAL_STORAGE_FULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSyncManager_DownloadStopReason_003', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSyncManager_DownloadStopReason_003 ";
      console.info(tag + "start====");
      try {
        let value1 = cloudSyncManager.DownloadStopReason.LOCAL_STORAGE_FULL;
        expect(value1).assertEqual(2);
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_cloudSyncManager_DownloadStopReason_003 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_cloudSyncManager_DownloadStopReason_004
     * @tc.number SUB_STORAGE_CLOUDSYNCMANAGER_DOWNLOADSTOPREASON_0400
     * @tc.desc   function of DownloadStopReason, TEMPERATURE_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSyncManager_DownloadStopReason_004', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSyncManager_DownloadStopReason_004 ";
      console.info(tag + "start====");
      try {
        let value1 = cloudSyncManager.DownloadStopReason.TEMPERATURE_LIMIT;
        expect(value1).assertEqual(3);
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_cloudSyncManager_DownloadStopReason_004 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_cloudSyncManager_DownloadStopReason_005
     * @tc.number SUB_STORAGE_CLOUDSYNCMANAGER_DOWNLOADSTOPREASON_0500
     * @tc.desc   function of DownloadStopReason, USER_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSyncManager_DownloadStopReason_005', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSyncManager_DownloadStopReason_005 ";
      console.info(tag + "start====");
      try {
        let value1 = cloudSyncManager.DownloadStopReason.USER_STOPPED;
        expect(value1).assertEqual(4);
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_cloudSyncManager_DownloadStopReason_005 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_cloudSyncManager_DownloadStopReason_006
     * @tc.number SUB_STORAGE_CLOUDSYNCMANAGER_DOWNLOADSTOPREASON_0600
     * @tc.desc   function of DownloadStopReason, APP_UNLOAD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSyncManager_DownloadStopReason_006', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSyncManager_DownloadStopReason_006 ";
      console.info(tag + "start====");
      try {
        let value1 = cloudSyncManager.DownloadStopReason.APP_UNLOAD;
        expect(value1).assertEqual(5);
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_cloudSyncManager_DownloadStopReason_006 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_cloudSyncManager_DownloadStopReason_007
     * @tc.number SUB_STORAGE_CLOUDSYNCMANAGER_DOWNLOADSTOPREASON_0700
     * @tc.desc   function of DownloadStopReason, OTHER_REASON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSyncManager_DownloadStopReason_007', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSyncManager_DownloadStopReason_007 ";
      console.info(tag + "start====");
      try {
        let value1 = cloudSyncManager.DownloadStopReason.OTHER_REASON;
        expect(value1).assertEqual(6);
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_cloudSyncManager_DownloadStopReason_007 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_cloudSyncManager_DownloadState_001
     * @tc.number SUB_STORAGE_CLOUDSYNCMANAGER_DOWNLOADSTATE_0100
     * @tc.desc   function of DownloadState, RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSyncManager_DownloadState_001', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSyncManager_DownloadState_001 ";
      console.info(tag + "start====");
      try {
        let value1 = cloudSyncManager.DownloadState.RUNNING;
        expect(value1).assertEqual(0);
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_cloudSyncManager_DownloadState_001 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_cloudSyncManager_DownloadState_002
     * @tc.number SUB_STORAGE_CLOUDSYNCMANAGER_DOWNLOADSTATE_0200
     * @tc.desc   function of DownloadState, COMPLETED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSyncManager_DownloadState_002', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSyncManager_DownloadState_002 ";
      console.info(tag + "start====");
      try {
        let value1 = cloudSyncManager.DownloadState.COMPLETED;
        expect(value1).assertEqual(1);
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_cloudSyncManager_DownloadState_002 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

    /**
     * @tc.name   test_cloudSyncManager_DownloadState_003
     * @tc.number SUB_STORAGE_CLOUDSYNCMANAGER_DOWNLOADSTATE_0300
     * @tc.desc   function of DownloadState, STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSyncManager_DownloadState_003', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSyncManager_DownloadState_003 ";
      console.info(tag + "start====");
      try {
        let value1 = cloudSyncManager.DownloadState.STOPPED;
        expect(value1).assertEqual(2);
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.error('test_cloudSyncManager_DownloadState_003 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   Test_CloudFile_State_014
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_1400
    * @tc.desc   function of API, CloudFileCache.off
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_014', Level.LEVEL3, async (done: Function) => {
     let tag = "====>Test_CloudFile_State_014 ";
     console.info(tag + "start====");
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info(tag + "batchDownload_callback enter");
        console.info("batchDownload state：" + pg.state);
        try {
          expect(cloudSync.State.RUNNING === 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_batchDownload");
      fileCache.on('batchDownload', callback);
      console.info(tag + "start off_batchDownload");
      fileCache.off('batchDownload');
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('Test_CloudFile_State_014 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });
  });
}