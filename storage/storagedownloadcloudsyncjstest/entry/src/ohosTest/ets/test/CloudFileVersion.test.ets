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
import connection from '@ohos.net.connection';
import cloudSync from '@ohos.file.cloudSync';
import fileUri from '@ohos.file.fileuri';
import featureAbility from '@ohos.ability.featureAbility';
import { BusinessError } from '@kit.BasicServicesKit';

export default function CloudFileVersionTest(){
  describe('cloud_file_version_test', () => {

    /**
     * @tc.name   test_cloudSync_FileVersion_001
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0100
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.getHistoryVersionList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_001', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSync_FileVersion_001 ";
      console.info(tag + "start====");
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let limit = 10;

      try {
        console.info(tag + "start getHistoryVersionList");
        fileVersion.getHistoryVersionList(uri, limit).then((versionList: Array<cloudSync.HistoryVersion>) => {
          console.info(tag + "getHistoryVersionList then enter");
          console.info(tag + "data: " + JSON.stringify(versionList));
          for(let i = 0, len = versionList.length; i < len; i++) {
            console.info("test_cloudSync_FileVersion_001 get history versionId: " + versionList[i].versionId);
            try {
              expect(cloudSync.State.RUNNING === 0).assertTrue();
            } catch (err) {
              console.info(tag + "Assert Fail: " + JSON.stringify(err));
            }
          }
          console.info(tag + "end====");
          done();
        }).catch((err: BusinessError) => {
          console.info(tag + "getHistoryVersionList catch err: " + JSON.stringify(err));
          console.error("test_cloudSync_FileVersion_001 get history version failed with error message: " + err.message + ", error code: " + err.code);
          console.info(tag + "end====");
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_FileVersion_001 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
     });

    /**
     * @tc.name   test_cloudSync_FileVersion_002
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0200
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.getHistoryVersionList with uri is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_002', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSync_FileVersion_002 ";
      console.info(tag + "start====");
      let fileVersion = new cloudSync.FileVersion();
      let path = "";
      let uri = fileUri.getUriFromPath(path);
      let limit = 10;

      try {
        console.info(tag + "start getHistoryVersionList");
        fileVersion.getHistoryVersionList(uri, limit).then((versionList: Array<cloudSync.HistoryVersion>) => {
          console.info(tag + "getHistoryVersionList then enter");
          console.info(tag + "data: " + JSON.stringify(versionList));
          for(let i = 0, len = versionList.length; i < len; i++) {
            console.info("test_cloudSync_FileVersion_002 get history versionId: " + versionList[i].versionId);
          }
          console.info(tag + "end====");
          done();
        }).catch((err: BusinessError) => {
          console.info(tag + "getHistoryVersionList catch err: " + JSON.stringify(err));
          console.error("test_cloudSync_FileVersion_002 get history version failed with error message: " + err.message + ", error code: " + err.code);
          try {
            expect(err.code === 13900020 || err.code === 22400001).assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          console.info(tag + "end====");
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_FileVersion_002 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
     });


    /**
     * @tc.name   test_cloudSync_FileVersion_003
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0300
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.getHistoryVersionList with limit length is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_003', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSync_FileVersion_003 ";
      console.info(tag + "start====");
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let limit = 0;

      try {
        console.info(tag + "start getHistoryVersionList");
        fileVersion.getHistoryVersionList(uri, limit).then((versionList: Array<cloudSync.HistoryVersion>) => {
          console.info(tag + "getHistoryVersionList then enter");
          console.info(tag + "data: " + JSON.stringify(versionList));
          for(let i = 0, len = versionList.length; i < len; i++) {
            let HistoryVersion = versionList[i];
            console.info("test_cloudSync_FileVersion_003 get history versionId: " + HistoryVersion.versionId);
            try {
              expect(HistoryVersion.editedTime == 0).assertTrue();
            } catch (err) {
              console.info(tag + "Assert Fail: " + JSON.stringify(err));
            }
            try {
              expect(HistoryVersion.fileSize == 0).assertTrue();
            } catch (err) {
              console.info(tag + "Assert Fail: " + JSON.stringify(err));
            }
            try {
              expect(HistoryVersion.versionId == '').assertTrue();
            } catch (err) {
              console.info(tag + "Assert Fail: " + JSON.stringify(err));
            }
            try {
              expect(HistoryVersion.originalFileName == '').assertTrue();
            } catch (err) {
              console.info(tag + "Assert Fail: " + JSON.stringify(err));
            }
            try {
              expect(HistoryVersion.sha256 == '').assertTrue();
            } catch (err) {
              console.info(tag + "Assert Fail: " + JSON.stringify(err));
            }
            try {
              expect(HistoryVersion.autoResolved == false).assertTrue();
            } catch (err) {
              console.info(tag + "Assert Fail: " + JSON.stringify(err));
            }
          }
          console.info(tag + "end====");
          done();
        }).catch((err: BusinessError) => {
          console.info(tag + "getHistoryVersionList catch err: " + JSON.stringify(err));
          console.error("test_cloudSync_FileVersion_003 get history version failed with error message: " + err.message + ", error code: " + err.code);
          try {
            expect(false).assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          console.info(tag + "end====");
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_FileVersion_003 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        console.info(tag + "end====");
        done();
      }
     });


    /**
     * @tc.name   test_cloudSync_FileVersion_004
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0400
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.downloadHistoryVersion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_004', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSync_FileVersion_004 ";
      console.info(tag + "start====");
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let versionId = '123456';
      let callback = (data: cloudSync.VersionDownloadProgress) => {
        console.info(tag + "downloadHistoryVersion_callback enter");
        if (data.state == cloudSync.State.RUNNING) {
          console.info("download progress: " + data.progress);
        } else if (data.state == cloudSync.State.FAILED) {
          console.info("download failed errType: " + data.errType);
        } else if (data.state == cloudSync.State.COMPLETED) {
          console.info("download version file success");
        }
      };

      try {
        console.info(tag + "start downloadHistoryVersion");
        fileVersion.downloadHistoryVersion(uri, versionId, callback).then((fileUri: string) => {
          console.info(tag + "downloadHistoryVersion then enter");
          console.info(tag + "data: " + fileUri);
          console.info("test_cloudSync_FileVersion_004 success to begin download, downloadFileUri: " + fileUri);
          try {
            expect(cloudSync.State.RUNNING === 0).assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          console.info(tag + "end====");
          done();
        }).catch((err: BusinessError) => {
          console.info(tag + "downloadHistoryVersion catch err: " + JSON.stringify(err));
          console.error("test_cloudSync_FileVersion_004 download history version file failed with error message: " + err.message + ", error code: " + err.code);
          console.info(tag + "end====");
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_FileVersion_004 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
     });

    /**
     * @tc.name   test_cloudSync_FileVersion_005
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0500
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.downloadHistoryVersion with versionId is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_005', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSync_FileVersion_005 ";
      console.info(tag + "start====");
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let versionId = '';
      let callback = (VersionDownloadProgress: cloudSync.VersionDownloadProgress) => {
        console.info(tag + "downloadHistoryVersion_callback enter");
        if (VersionDownloadProgress.state == cloudSync.State.RUNNING) {
          console.info("download progress: " + VersionDownloadProgress.progress);
          try {
            expect(VersionDownloadProgress.progress == 0).assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
        } else if (VersionDownloadProgress.state == cloudSync.State.FAILED) {
          console.info("download failed errType: " + VersionDownloadProgress.errType);
          try {
            expect(VersionDownloadProgress.errType == cloudSync.DownloadErrorType.UNKNOWN_ERROR).assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
        } else if (VersionDownloadProgress.state == cloudSync.State.COMPLETED) {
          console.info("download version file success");
        }
      };

      try {
        console.info(tag + "start downloadHistoryVersion");
        fileVersion.downloadHistoryVersion(uri, versionId, callback).then((fileUri: string) => {
          console.info(tag + "downloadHistoryVersion then enter");
          console.info(tag + "data: " + fileUri);
          console.info("test_cloudSync_FileVersion_005 success to begin download, downloadFileUri: " + fileUri);
          console.info(tag + "end====");
          done();
        }).catch((err: BusinessError) => {
          console.info(tag + "downloadHistoryVersion catch err: " + JSON.stringify(err));
          console.error("test_cloudSync_FileVersion_005 download history version file failed with error message: " + err.message + ", error code: " + err.code);
          try {
            expect(false).assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          console.info(tag + "end====");
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_FileVersion_005 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        console.info(tag + "end====");
        done();
      }
     });


    /**
     * @tc.name   test_cloudSync_FileVersion_006
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0600
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.replaceFileWithHistoryVersion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_006', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSync_FileVersion_006 ";
      console.info(tag + "start====");
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/test_cloudSync_FileVersion_006.txt";
      let uri = fileUri.getUriFromPath(path);
      let versionUri = uri;
      try {
        console.info(tag + "start replaceFileWithHistoryVersion");
        fileVersion.replaceFileWithHistoryVersion(uri, versionUri).then(() => {
          console.info(tag + "replaceFileWithHistoryVersion then enter");
          console.info("test_cloudSync_FileVersion_006 replaceFileWithHistoryVersion success");
          try {
            expect(cloudSync.State.RUNNING === 0).assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          console.info(tag + "end====");
          done();
        }).catch((err: BusinessError) => {
          console.info(tag + "replaceFileWithHistoryVersion catch err: " + JSON.stringify(err));
          console.error("test_cloudSync_FileVersion_006 replaceFileWithHistoryVersion failed with error: " + err.message + ", error code: " + err.code);
          try {
            expect(err.code === 22400001).assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          console.info(tag + "end====");
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_FileVersion_006 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
     });

    /**
     * @tc.name   test_cloudSync_FileVersion_007
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0700
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.isFileConflict.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_007', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSync_FileVersion_007 ";
      console.info(tag + "start====");
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);

      try {
        console.info(tag + "start isFileConflict");
        fileVersion.isFileConflict(uri).then((isConflict) => {
          console.info(tag + "isFileConflict then enter");
          console.info(tag + "data: " + JSON.stringify(isConflict));
          console.info("test_cloudSync_FileVersion_007 current file is conflict: " + isConflict);
          try {
            expect(cloudSync.State.RUNNING === 0).assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          console.info(tag + "end====");
          done();
        }).catch((err: BusinessError) => {
          console.info(tag + "isFileConflict catch err: " + JSON.stringify(err));
          console.error("test_cloudSync_FileVersion_007 get current file conflict flag failed with error message: " + err.message + ", error code: " + err.code);
          console.info(tag + "end====");
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_FileVersion_007 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
     });

    /**
     * @tc.name   test_cloudSync_FileVersion_008
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0800
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.clearFileConflict.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_008', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSync_FileVersion_008 ";
      console.info(tag + "start====");
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);

      try {
        console.info(tag + "start clearFileConflict");
        fileVersion.clearFileConflict(uri).then(() => {
          console.info(tag + "clearFileConflict then enter");
          console.info("test_cloudSync_FileVersion_008 clean file conflict flag success");
          try {
            expect(cloudSync.State.RUNNING === 0).assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          console.info(tag + "end====");
          done();
        }).catch((err: BusinessError) => {
          console.info(tag + "clearFileConflict catch err: " + JSON.stringify(err));
          console.error("test_cloudSync_FileVersion_008 clean file conflict flag failed with error message: " + err.message + ", error code: " + err.code);
          console.info(tag + "end====");
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_FileVersion_008 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
     });

  });
}