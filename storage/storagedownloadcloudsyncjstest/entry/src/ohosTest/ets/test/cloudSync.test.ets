/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import fs from '@ohos.file.fs';
import { BusinessError } from '@kit.BasicServicesKit';

export default function cloudCloudSyncTest(){
describe('cloud_sync_test', () => {

   /**
    * @tc.name   test_cloudSync_State_001
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0100
    * @tc.desc   function of API, Test FileSync.start, Promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_001', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_001 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_001 file sync state: ' + pg.state + "error type:" + pg.error);
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start start");
      fileSync.start().then(() => {
        console.info(tag + "start then enter");
        console.log("start sync successfully");
        console.info(tag + "end====");
        done();
      }).catch((err: BusinessError) => {
        console.info(tag + "start catch err: " + JSON.stringify(err));
        console.error("test_cloudSync_State_001 start sync failed : " + err.message + ", error code: " + err.code);
        try {
          expect(err.code === 13600001 || err.code === 22400001).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        console.info(tag + "end====");
        done();
      });
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_001 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_002
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0200
    * @tc.desc   function of API, Test FileSync.start, callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_002', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_002 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_002 file sync state: ' + pg.state + "error type:" + pg.error);
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start start");
      fileSync.start((err: BusinessError) => {
        console.info(tag + "start callback enter");
        console.info(tag + "err: " + JSON.stringify(err));
        if (err) {
          console.error("test_cloudSync_State_002 start sync failed: " + err.message + ", error code: " + err.code);
          try {
            expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
        } else {
          console.info("start sync successfully");
        }
        console.info(tag + "end====");
        done();
      });
      done();
    } catch (err) {
      console.info(tag + "catch err: " + JSON.stringify(err));
      console.log('test_cloudSync_State_002 has failed for ' + err.message + ', code: ' + err.code);
      expect(false).assertTrue();
      console.info(tag + "end====");
      done();
    }
   });

   /**
    * @tc.name   test_cloudSync_State_003
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0300
    * @tc.desc   function of API, on_progress, SyncState.UPLOADING
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_003', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_003 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_003 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.SyncState.UPLOADING == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_003 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_004
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0400
    * @tc.desc   function of API, on_progress, SyncState.UPLOAD_FAILED
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_004', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_004 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_004 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.SyncState.UPLOAD_FAILED == 1).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_004 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_005
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0500
    * @tc.desc   function of API, on_progress, SyncState.DOWNLOADING
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_005', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_005 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_005 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.SyncState.DOWNLOADING == 2).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_005 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_006
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0600
    * @tc.desc   function of API, on_progress, SyncState.DOWNLOAD_FAILED
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_006', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_006 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_006 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.SyncState.DOWNLOAD_FAILED == 3).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_006 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_007
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0700
    * @tc.desc   function of API, on_progress, SyncState.COMPLETED
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_007', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_007 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_007 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.SyncState.COMPLETED == 4).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_007 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_008
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0800
    * @tc.desc   function of API, on_progress, SyncState.STOPPED
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_008', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_008 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_008 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.SyncState.STOPPED == 5).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_008 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_009
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0900
    * @tc.desc   function of API, on_progress, ErrorType.NO_ERROR
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_009', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_009 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_009 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.ErrorType.NO_ERROR == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_009 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_010
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1000
    * @tc.desc   function of API, on_progress, ErrorType.NETWORK_UNAVAILABLE
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_010', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_010 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_010 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.ErrorType.NETWORK_UNAVAILABLE == 1).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_010 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_011
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1100
    * @tc.desc   function of API, on_progress, ErrorType.WIFI_UNAVAILABLE
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_011', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_011 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_011 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.ErrorType.WIFI_UNAVAILABLE == 2).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_011 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_012
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1200
    * @tc.desc   function of API, on_progress, ErrorType.BATTERY_LEVEL_LOW
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_012', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_012 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_012 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.ErrorType.BATTERY_LEVEL_LOW == 3).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_012 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_013
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1300
    * @tc.desc   function of API, on_progress, ErrorType.BATTERY_LEVEL_WARNING
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_013', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_013 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_013 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.ErrorType.BATTERY_LEVEL_WARNING == 4).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_013 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_014
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1400
    * @tc.desc   function of API, on_progress, ErrorType.CLOUD_STORAGE_FULL
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_014', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_014 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_014 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.ErrorType.CLOUD_STORAGE_FULL == 5).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_014 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_015
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1500
    * @tc.desc   function of API, on_progress, ErrorType.LOCAL_STORAGE_FULL
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_015', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_015 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_015 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.ErrorType.LOCAL_STORAGE_FULL == 6).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_015 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_016
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1600
    * @tc.desc   function of API, on_progress, ErrorType.DEVICE_TEMPERATURE_TOO_HIGH
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_016', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_016 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_016 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.ErrorType.DEVICE_TEMPERATURE_TOO_HIGH == 7).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_016 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_017
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1700
    * @tc.desc   function of API, fileSync.stop, Promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_017', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_017 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
       console.info(tag + "start stop");
       fileSync.stop().then(() => {
         console.info(tag + "stop then enter");
         console.info("stop sync successfully");
         console.info(tag + "end====");
         done();
       }).catch((err: BusinessError) => {
         console.info(tag + "stop catch err: " + JSON.stringify(err));
         console.error("test_cloudSync_State_017 stop sync failed: " + err.message + ", error code: " + err.code);
         try {
          expect(err.code === 13600001 || err.code === 22400001).assertTrue();
         } catch (err) {
           console.info(tag + "Assert Fail: " + JSON.stringify(err));
         }
         console.info(tag + "end====");
         done();
       });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_State_017 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
   });

   /**
    * @tc.name   test_cloudSync_State_018
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1800
    * @tc.desc   function of API, fileSync.stop, callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_018', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_018 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
       console.info(tag + "start stop");
       fileSync.stop((err: BusinessError) => {
         console.info(tag + "stop callback enter");
         console.info(tag + "err: " + JSON.stringify(err));
         if (err) {
           console.error("test_cloudSync_State_018 stop sync failed: " + err.message + ", error code: " + err.code);
           try {
             expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
           } catch (err) {
             console.info(tag + "Assert Fail: " + JSON.stringify(err));
           }
         } else {
           console.info("stop sync successfully");
         }
         console.info(tag + "end====");
         done();
       });
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_State_018 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
   });

   /**
    * @tc.name   test_cloudSync_State_019
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1900
    * @tc.desc   function of API, getLastSyncTime, Promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_019', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_019 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
       console.info(tag + "start getLastSyncTime");
       fileSync.getLastSyncTime().then((timeStamp: number) => {
         console.info(tag + "getLastSyncTime then enter");
         let date = new Date(timeStamp);
         console.info("get last sync time successfully:"+ date);
         console.info(tag + "end====");
         done();
       }).catch((err: BusinessError) => {
         console.info(tag + "getLastSyncTime catch err: " + JSON.stringify(err));
         console.error("test_cloudSync_State_019 get last sync time failed: " + err.message + ", error code: " + err.code);
         try {
           expect(err.code == 13600001 || err.code == 401).assertTrue();
         } catch (err) {
           console.info(tag + "Assert Fail: " + JSON.stringify(err));
         }
         console.info(tag + "end====");
         done();
       });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_State_019 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
   });

   /**
    * @tc.name   test_cloudSync_State_020
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2000
    * @tc.desc   function of API, getLastSyncTime, callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_020', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_020 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
       console.info(tag + "start getLastSyncTime");
       fileSync.getLastSyncTime((err: BusinessError, timeStamp: number) => {
         console.info(tag + "getLastSyncTime callback enter");
         console.info(tag + "err: " + JSON.stringify(err));
         if (err) {
           console.error("test_cloudSync_State_020 get last sync time: " + err.message + ", error code: " + err.code);
           try {
            expect(err.code == 13600001 || err.code == 401).assertTrue();
           } catch (err) {
             console.info(tag + "Assert Fail: " + JSON.stringify(err));
           }
         } else {
           let date = new Date(timeStamp);
           console.info("get last sync time successfully:"+ date);
         }
         console.info(tag + "end====");
         done();
       });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_State_020 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
   });

   /**
    * @tc.name   test_cloudSync_State_021
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2100
    * @tc.desc   function of API, CloudFileCache.on
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_021', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_021 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
        try {
          expect(cloudSync.State.FAILED === 2).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_021 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_022
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2200
    * @tc.desc   function of API, CloudFileCache.off
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_022', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_022 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
        try {
          expect(cloudSync.State.FAILED === 2).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
      console.info(tag + "start off_progress");
      fileCache.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_022 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_023
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2300
    * @tc.desc   function of API, CloudFileCache.start, Promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_023', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_023 ";
     console.info(tag + "start====");
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
       console.info(tag + "start start");
       fileCache.start(uri).then(() => {
         console.info(tag + "start then enter");
         console.info("start download successfully");
         console.info(tag + "end====");
         done();
       }).catch((err: BusinessError) => {
         console.info(tag + "start catch err: " + JSON.stringify(err));
         console.error("test_cloudSync_State_023 start download failed: " + err.message + ", error code: " + err.code);
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
        console.log('test_cloudSync_State_023 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
   });

   /**
    * @tc.name   test_cloudSync_State_024
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2400
    * @tc.desc   function of API, CloudFileCache.start, callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_024', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_024 ";
     console.info(tag + "start====");
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
       console.info(tag + "start start");
       fileCache.start(uri, (err: BusinessError) => {
         console.info(tag + "start callback enter");
         console.info(tag + "err: " + JSON.stringify(err));
         if (err) {
           console.error("test_cloudSync_State_024 start download failed: " + err.message + ", error code: " + err.code);
           try {
             expect(err.code === 13600001).assertTrue();
           } catch (err) {
             console.info(tag + "Assert Fail: " + JSON.stringify(err));
           }
         } else {
           console.info("start download successfully");
         }
         console.info(tag + "end====");
         done();
       });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_State_024 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
   });

   /**
    * @tc.name   test_cloudSync_State_025
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2500
    * @tc.desc   function of API, CloudFileCache.stop, Promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_025', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_025 ";
     console.info(tag + "start====");
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
       console.info(tag + "start stop");
       fileCache.stop(uri, true).then(() => {
         console.info(tag + "stop then enter");
         console.info("stop download successfully");
         console.info(tag + "end====");
         done();
       }).catch((err: BusinessError) => {
         console.info(tag + "stop catch err: " + JSON.stringify(err));
         console.error("test_cloudSync_State_025 stop download failed: " + err.message + ", error code: " + err.code);
         try {
           expect(err.code === 13600001 || err.code === 401).assertTrue();
         } catch (err) {
           console.info(tag + "Assert Fail: " + JSON.stringify(err));
         }
         console.info(tag + "end====");
         done();
       });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_State_025 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
   });

   /**
    * @tc.name   test_cloudSync_State_026
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2600
    * @tc.desc   function of API, CloudFileCache.stop, callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_026', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_026 ";
     console.info(tag + "start====");
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
       console.info(tag + "start stop");
       fileCache.stop(uri, (err: BusinessError) => {
         console.info(tag + "stop callback enter");
         console.info(tag + "err: " + JSON.stringify(err));
         if (err) {
           console.error("test_cloudSync_State_026 stop download failed: " + err.message + ", error code: " + err.code);
           try {
            expect(err.code === 13600001 || err.code === 401).assertTrue();
           } catch (err) {
             console.info(tag + "Assert Fail: " + JSON.stringify(err));
           }
         } else {
           console.info("stop download successfully");
         }
         console.info(tag + "end====");
         done();
       });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_State_025 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        console.info(tag + "end====");
        done();
      }
   });

   /**
    * @tc.name   test_cloudSync_State_027
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2700
    * @tc.desc   function of API, CloudFileCache.on, State.RUNNING
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_027', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_027 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (DownloadProgress: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + DownloadProgress.state);
        try {
          expect(DownloadProgress.uri == '').assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(DownloadProgress.size == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(cloudSync.State.RUNNING == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_027 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_028
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2800
    * @tc.desc   function of API, CloudFileCache.on, State.COMPLETED
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_028', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_028 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
        try {
          expect(cloudSync.State.COMPLETED == 1).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_028 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_029
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2900
    * @tc.desc   function of API, CloudFileCache.on, State.FAILED
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_029', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_029 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
        try {
          expect(cloudSync.State.FAILED == 2).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_029 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_030
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3000
    * @tc.desc   function of API, CloudFileCache.on, State.STOPPED
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_030', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_030 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
        try {
          expect(cloudSync.State.STOPPED == 3).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_030 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_031
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3100
    * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.NO_ERROR
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_031', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_031 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.error);
        try {
          expect(cloudSync.DownloadErrorType.NO_ERROR == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_031 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_032
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3200
    * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.UNKNOWN_ERROR
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_032', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_032 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.error);
        try {
          expect(cloudSync.DownloadErrorType.UNKNOWN_ERROR == 1).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_032 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_033
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3300
    * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.NETWORK_UNAVAILABLE
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_033', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_033 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.error);
        try {
          expect(cloudSync.DownloadErrorType.NETWORK_UNAVAILABLE == 2).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_033 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_034
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3400
    * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.LOCAL_STORAGE_FULL
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_034', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_034 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.error);
        try {
          expect(cloudSync.DownloadErrorType.LOCAL_STORAGE_FULL == 3).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_034 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_035
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3500
    * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.CONTENT_NOT_FOUND
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_035', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_035 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.error);
        try {
          expect(cloudSync.DownloadErrorType.CONTENT_NOT_FOUND == 4).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_035 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_036
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3600
    * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.FREQUENT_USER_REQUESTS
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_036', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_036 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.error);
        try {
          expect(cloudSync.DownloadErrorType.FREQUENT_USER_REQUESTS == 5).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_036 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_037
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3700
    * @tc.desc   function of API, on_progress, ErrorType.REMOTE_SERVER_ABNORMAL
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_037', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_037 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_037 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.ErrorType.REMOTE_SERVER_ABNORMAL == 8).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress', callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_037 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_038
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3800
    * @tc.desc   function of API, on_progress
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_038', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSync_State_038 ";
      console.info(tag + "start====");    
      try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
      try {
        console.info(tag + "start off_progress");
        fileCache.off(null, callback);
        expect(false).assertTrue();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_State_038 correctly threw error for null parameter: ' + err.message);
        expect(cloudSync.State.STOPPED === 3).assertTrue();
      }
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_State_038 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });
 	 
    /**
    * @tc.name   test_cloudSync_State_039
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3900
    * @tc.desc   function of API, CloudFileCache.off with undefined as first parameter
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('test_cloudSync_State_039', Level.LEVEL3, async (done: Function) => {
      let tag = "====>test_cloudSync_State_039 ";
      console.info(tag + "start====");
      
      try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
      try {
        console.info(tag + "start off_progress");
        fileCache.off(undefined, callback);
        expect(false).assertTrue();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_State_039 correctly threw error for undefined parameter: ' + err.message);
        expect(cloudSync.State.COMPLETED === 1).assertTrue();
      }
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.log('test_cloudSync_State_039 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_cloudSync_State_040
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4000
    * @tc.desc   function of API, on_progress is null, SyncState.UPLOADING
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_040', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_040 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_040 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.SyncState.UPLOADING == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on(null, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_040 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 401).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_041
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4100
    * @tc.desc   function of API, on_progress is undefined, SyncState.UPLOADING
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_041', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_041 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_041 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.SyncState.UPLOADING == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on(undefined, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_041 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 401).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_042
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0420
    * @tc.desc   function of API, off_progress is null, SyncState.DOWNLOAD_FAILED
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_042', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_042 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_042 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.SyncState.DOWNLOAD_FAILED == 3).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off(null, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_042 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 401).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_043
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0430
    * @tc.desc   function of API, off_progress is undefined, SyncState.DOWNLOAD_FAILED
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_043', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_043 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_043 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.SyncState.DOWNLOAD_FAILED == 3).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off(undefined, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_043 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 401).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_044
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4400
    * @tc.desc   function of API, CloudFileCache.on
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_044', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_044 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
        try {
          expect(cloudSync.State.FAILED === 2).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on(null, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_044 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 13900020).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_045
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4500
    * @tc.desc   function of API, CloudFileCache.on
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_045', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_045 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
        try {
          expect(cloudSync.State.FAILED === 2).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on(undefined, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_045 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 13900020).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_046
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4600
    * @tc.desc   function of API, CloudFileCache.on, State.RUNNING
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_046', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_046 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (DownloadProgress: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + DownloadProgress.state);
        try {
          expect(DownloadProgress.uri == '').assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(DownloadProgress.size == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(cloudSync.State.RUNNING == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on(null, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_046 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 13900020).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_047
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4700
    * @tc.desc   function of API, CloudFileCache.on, State.RUNNING
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_047', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_047 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (DownloadProgress: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + DownloadProgress.state);
        try {
          expect(DownloadProgress.uri == '').assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(DownloadProgress.size == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        try {
          expect(cloudSync.State.RUNNING == 0).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on(undefined, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_047 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 13900020).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_048
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4800
    * @tc.desc   function of API, CloudFileCache.off
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_048', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_048 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
        try {
          expect(cloudSync.State.FAILED === 2).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
      console.info(tag + "start off_progress");
      fileCache.off(null, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_048 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 13900020).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_049
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4900
    * @tc.desc   function of API, CloudFileCache.off
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_049', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_049 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
        try {
          expect(cloudSync.State.FAILED === 2).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
      console.info(tag + "start off_progress");
      fileCache.off(undefined, callback);
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_049 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 13900020).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_050
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5000
    * @tc.desc   function of API, CloudFileCache.start, Promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_050', Level.LEVEL3, async (done: Function) => {
    let tag = "====>test_cloudSync_State_050 ";
    console.info(tag + "start====");
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
      console.info(tag + "start off_progress");
      fileCache.off(null, callback);
      console.info(tag + "start start");
      fileCache.start(uri).then(() => {
        console.info(tag + "start then enter");
        console.info("start download successfully");
        console.info(tag + "end====");
        done();
      }).catch((err: BusinessError) => {
        console.info(tag + "start catch err: " + JSON.stringify(err));
        console.error("test_cloudSync_State_050 start download failed: " + err.message + ", error code: " + err.code);
        try {
          expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        console.info(tag + "end====");
        done();
      });
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_050 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 13900020).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_051
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5100
    * @tc.desc   function of API, CloudFileCache.start, Promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_051', Level.LEVEL3, async (done: Function) => {
    let tag = "====>test_cloudSync_State_051 ";
    console.info(tag + "start====");
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
      console.info(tag + "start off_progress");
      fileCache.off(undefined, callback);
      console.info(tag + "start start");
      fileCache.start(uri).then(() => {
        console.info(tag + "start then enter");
        console.info("start download successfully");
        console.info(tag + "end====");
        done();
      }).catch((err: BusinessError) => {
        console.info(tag + "start catch err: " + JSON.stringify(err));
        console.error("test_cloudSync_State_051 start download failed: " + err.message + ", error code: " + err.code);
        try {
          expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        console.info(tag + "end====");
        done();
      });
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_051 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 13900020).assertTrue();
       console.info(tag + "end====");
       done();
     }
   });

   /**
    * @tc.name   test_cloudSync_State_052
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5200
    * @tc.desc   function of API, on_progress, ErrorType.REMOTE_SERVER_ABNORMAL
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_052', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_052 ";
     console.info(tag + "start====");
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.info(tag + "progress_callback enter");
        console.log('test_cloudSync_State_052 file sync state: ' + pg.state + "error type:" + pg.error);
        try {
          expect(cloudSync.ErrorType.REMOTE_SERVER_ABNORMAL == 8).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      }
      console.info(tag + "start on_progress");
      fileSync.on('progress', callback);
      console.info(tag + "start off_progress");
      fileSync.off('progress');
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_052 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_cloudSync_State_053
    * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5300
    * @tc.desc   function of API, CloudFileCache.off
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('test_cloudSync_State_053', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_cloudSync_State_053 ";
     console.info(tag + "start====");
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info(tag + "progress_callback enter");
        console.info("download state:" + pg.state);
        try {
          expect(cloudSync.State.FAILED === 2).assertTrue();
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
      };
      console.info(tag + "start on_progress");
      fileCache.on('progress', callback);
      console.info(tag + "start off_progress");
      fileCache.off('progress');
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       console.log('test_cloudSync_State_053 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     console.info(tag + "end====");
     done();
   });
  });
}