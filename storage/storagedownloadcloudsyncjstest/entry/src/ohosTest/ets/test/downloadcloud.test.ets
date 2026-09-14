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

let uri_ ="file://media/image/7";
let cloudSyncDownload = new cloudSync.Download();
let isConnect:Boolean;
let gallerySync = new cloudSync.GallerySync();

async function getNetId() {
  let netId = 0;
  try {
    let netHandle = await connection.getDefaultNet();
    if(netHandle){
      console.log('getNetId info :${JSON.stringify(netHandle)}');
      netId = netHandle.netId
    }
  }catch (error){
    console.error('getNetId Error : ${JSON.stringify(error)}');
  }
  return netId;
}

async function errHandle(err:BusinessError, tag:string){
  console.error('${tag}err.code :${err.code} err.message :${err.message} isConnect : ${isConnect}');
  if (err.code != undefined) {
    switch (err.code){
      case 13600001://IPC error
        console.error('${tag} ICP error');
        break;
      case 22400002:// Network unavailable
        break;
      case 401: //The inputparameter is invalid
        console.error('${tag} The input parameter is invalid');
        break;
    }
  }else{
    console.error('${tag} catch failed.err = $ {JSON.stringify(err)}');
    expect(false).assertTrue();
  }
};

export default function cloudFileDownloadTest(){
describe('cloud_file_download_test', () => {
    beforeAll( async () => {
      console.info("beforeAllcase uri:" + uri_);
        try {
            let netId = await getNetId();
            if (netId > 100 || netId ==100){
                isConnect = false;
            }
            console.info('网络状态：${isConnect}');
            cloudSyncDownload = new cloudSync.Download();
            gallerySync = new cloudSync.GallerySync();
        }catch (err){
          console.error("beforeAll case err :" + err);
        }
    });

    beforeEach(() => {
      console.info("beforeEachcase");
    });
    afterAll( () => {
      console.info("afterAll case");
    });

   /**
    * @tc.name   test_Download_State_001
    * @tc.number SUB_STORAGE_DOWNLOAD_STATE_TEST_0100
    * @tc.desc   function of API, Test State RUNNING
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('test_Download_State_001', Level.LEVEL0, async (done: Function) => {
      let TAG = "test_Download_State_001::";
      let tag = "====>test_Download_State_001 ";
      console.info(tag + "start====");
      let RUNNING = 0;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("download_on:callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.state = " + pg.state);
            if (pg.state == RUNNING) {
              console.info("state:pg.state.RUNNING==0-云文件正在下载中");
              try {
                expect(cloudSync.State.RUNNING === 0).assertTrue();
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_Download_State_002
    * @tc.number SUB_STORAGE_DOWNLOAD_STATE_TEST_0200
    * @tc.desc   function of API, Test State FAILED
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('test_Download_State_002', Level.LEVEL0, async (done: Function) => {
      let TAG = "test_Download_State_002::";
      let tag = "====>test_Download_State_002 ";
      console.info(tag + "start====");
      let FAILED = 2;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("download_on:callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.state = " + pg.state);
            if (pg.state == FAILED) {
              console.info("state:pg.state.FAILED==2-云文件下载失败");
              try {
                expect(cloudSync.State.FAILED === 2).assertTrue();
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_Uploading_State_003
    * @tc.number SUB_STORAGE_UPLOADING_STATE_TEST_0300
    * @tc.desc   function of API, Test State Uploading
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('test_Uploading_State_003', Level.LEVEL0, async (done: Function) => {
      let TAG = "test_Uploading_State_003::";
      let tag = "====>test_Uploading_State_003 ";
      console.info(tag + "start====");
      let UPLOADING = 0;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("download_on:callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.state = " + pg.state);
            if (pg.state == UPLOADING) {
              console.info("state:pg.state.SyncState==0-上行同步中");
              try {
                expect(cloudSync.SyncState.UPLOADING === 0).assertTrue();
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_Uploading_Failed_State_004
    * @tc.number SUB_STORAGE_DOWNLOAD_STATE_TEST_0400
    * @tc.desc   function of API, Test State Uploading_Failed
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('test_Uploading_Failed_State_004', Level.LEVEL0, async (done: Function) => {
      let TAG = "test_Uploading_Failed_State_004::";
      let tag = "====>test_Uploading_Failed_State_004 ";
      console.info(tag + "start====");
      let UPLOAD_FAILED = 1;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("download_on:callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.state = " + pg.state);
            if (pg.state == UPLOAD_FAILED) {
              console.info("state:pg.state.SyncState==1-上行同步失败");
              try {
                expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

  /**
   * @tc.name   test_CloudSync_SyncState_005
   * @tc.number SUB_STORAGE_GALLERYSYNC_STATE_TEST_0500
   * @tc.desc   function of API, Test State DOWNLOAD_FAILED
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
   it('test_CloudSync_SyncState_005', Level.LEVEL0, async (done: Function) => {
     let TAG = "test_CloudSync_SyncState_005::";
     let tag = "====>test_CloudSync_SyncState_005 ";
     console.info(tag + "start====");
     let DOWNLOAD_FAILED = 3;
     try {
       console.info(tag + "start on_progress");
       gallerySync.on("progress",(pg)=>{
         console.info(tag + "progress_callback enter");
         console.info("gallerySync_on:callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.state = " + pg.state);
           if (pg.state == DOWNLOAD_FAILED) {
             console.info("state:pg.state.DOWNLOAD_FAILED ==3-云文件下行同步失败");
             try {
               expect(cloudSync.SyncState.DOWNLOAD_FAILED === 3).assertTrue();
             } catch (err) {
               console.info(tag + "Assert Fail: " + JSON.stringify(err));
             }
           }
         }
       });
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       errHandle(err,TAG);
     }
     console.info(tag + "end====");
     done();
   });

   /**
    * @tc.name   test_Downloading_State_006
    * @tc.number SUB_STORAGE_DOWNLOADING_STATE_TEST_0600
    * @tc.desc   function of API, Test State Downloading
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('test_Downloading_State_006', Level.LEVEL0, async (done: Function) => {
      let TAG = "test_Downloading_State_006::";
      let tag = "====>test_Downloading_State_006 ";
      console.info(tag + "start====");
      let DOWNLOADING = 2;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
           console.info(tag + "progress_callback enter");
           console.info("download_on:callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.state = " + pg.state);
            if (pg.state == DOWNLOADING) {
              console.info("state:pg.state.SyncState==2-下行同步中");
              try {
                expect(cloudSync.SyncState.DOWNLOADING === 2).assertTrue();
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_Download_Processed_001
    * @tc.number SUB_STORAGE_DOWNLOAD_PROCESSED_TEST_0100
    * @tc.desc   function of API, Test State processed
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('test_Download_Processed_001', Level.LEVEL0, async (done: Function) => {
      let TAG = "test_Download_Processed_001::";
      let tag = "====>test_Download_Processed_001 ";
      console.info(tag + "start====");
      let FAILED = 2;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("on:callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.state = " + pg.state);
            if (pg.state == FAILED) {
              console.info("on:callback succeed. pg.processed = " + pg.processed);
              try {
                expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_Download_Error_001
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0100
    * @tc.desc   function of API, Test DownloadErrorType NO_ERROR
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('test_Download_Error_001', Level.LEVEL0, async (done: Function) => {
      let TAG = "test_Download_Error_001::";
      let tag = "====>test_Download_Error_001 ";
      console.info(tag + "start====");
      let NO_ERROR = 0;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("download_on: callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.error = " + pg.error);
          if (pg.error == NO_ERROR) {
            console.info("error: pg.error.NO_ERROR==0-没有错误");
            try {
              expect(cloudSync.DownloadErrorType.NO_ERROR === 0).assertTrue();
            } catch (err) {
              console.info(tag + "Assert Fail: " + JSON.stringify(err));
            }
          }
        }
        });
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       errHandle(err,TAG);
     }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_Download_Error_002
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0200
    * @tc.desc   function of API, Test DownloadErrorType UNKNOWN_ERROR
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('test_Download_Error_002', Level.LEVEL0, async (done: Function) => {
      let TAG = "test_Download_Error_002::";
      let tag = "====>test_Download_Error_002 ";
      console.info(tag + "start====");
      let UNKNOWN_ERROR = 1;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("download_on: callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.error = " + pg.error);
            if (pg.error == UNKNOWN_ERROR) {
              console.info("error: pg.error.UNKNOWN_ERROR==1-未知错误");
              try {
                expect(cloudSync.DownloadErrorType.UNKNOWN_ERROR === 1).assertTrue();
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_Download_Error_003
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0300
    * @tc.desc   function of API, Test DownloadErrorType NETWORK_UNAVAILABLE
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('test_Download_Error_003', Level.LEVEL0, async (done: Function) => {
      let TAG = "test_Download_Error_003::";
      let tag = "====>test_Download_Error_003 ";
      console.info(tag + "start====");
      let NETWORK_UNAVAILABLE = 2;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("download_on: callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.error = " + pg.error);
            if (pg.error == NETWORK_UNAVAILABLE) {
              console.info("error: pg.error.NETWORK_UNAVAILABLE==2-网络不可用");
              try {
                expect(cloudSync.DownloadErrorType.NETWORK_UNAVAILABLE === 2).assertTrue();
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_Download_Error_004
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0400
    * @tc.desc   function of API, Test DownloadErrorType LOCAL_STORAGE_FULL
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('test_Download_Error_004', Level.LEVEL3, async (done: Function) => {
      let TAG = "test_Download_Error_004::";
      let tag = "====>test_Download_Error_004 ";
      console.info(tag + "start====");
      let LOCAL_STORAGE_FULL = 3;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("download_on: callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.error = " + pg.error);
            if (pg.error == LOCAL_STORAGE_FULL) {
              console.info("error: pg.error.LOCAL_STORAGE_FULL==3-本地空间不足");
              try {
                expect(cloudSync.DownloadErrorType.LOCAL_STORAGE_FULL === 3).assertTrue();
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_Download_Error_005
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0500
    * @tc.desc   function of API, Test DownloadErrorType CONTENT_NOT_FOUND
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('test_Download_Error_005', Level.LEVEL3, async (done: Function) => {
      let TAG = "test_Download_Error_005::";
      let tag = "====>test_Download_Error_005 ";
      console.info(tag + "start====");
      let CONTENT_NOT_FOUND = 4;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("download_on: callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.error = " + pg.error);
            if (pg.error == CONTENT_NOT_FOUND) {
              console.info("error: pg.error.CONTENT_NOT_FOUND==4-云端空间未找到对应文件");
              try {
                expect(cloudSync.DownloadErrorType.CONTENT_NOT_FOUND === 4).assertTrue();
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_Download_Error_006
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0600
    * @tc.desc   function of API, Test DownloadErrorType FREQUENT_USER_REQUESTS
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('test_Download_Error_006', Level.LEVEL3, async (done: Function) => {
      let TAG = "test_Download_Error_006::";
      let tag = "====>test_Download_Error_006 ";
      console.info(tag + "start====");
      let FREQUENT_USER_REQUESTS = 5;
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("download_on: callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.error = " + pg.error);
            if (pg.error == FREQUENT_USER_REQUESTS) {
              console.info("error: pg.error.CONTENT_NOT_FOUND==5-用户请求过于频繁");
              try {
                expect(cloudSync.DownloadErrorType.FREQUENT_USER_REQUESTS === 5).assertTrue();
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

   /**
    * @tc.name   test_Download_Error_007
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0700
    * @tc.desc   function of API, Test Test_error on() interfaces.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('test_Download_Error_007', Level.LEVEL3, async (done: Function) => {
      let TAG = "test_Download_Error_007::";
      let tag = "====>test_Download_Error_007 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start on_progress");
        cloudSyncDownload.on("progress",(pg)=>{
          console.info(tag + "progress_callback enter");
          console.info("on: callback succeed.");
          if(pg != undefined){
            console.info("on:callback succeed. pg.error = " + pg.error);
            try {
              expect(cloudSync.DownloadErrorType.UNKNOWN_ERROR === 1).assertTrue();
            } catch (err) {
              console.info(tag + "Assert Fail: " + JSON.stringify(err));
            }
          }
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
      }
      console.info(tag + "end====");
      done();
    });

  /**
   * @tc.name   test_CloudSync_ErrorType_008
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0800
   * @tc.desc   function of API, Test ErrorType WIFI_UNAVAILABLE
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
   it('test_CloudSync_ErrorType_008', Level.LEVEL3, async (done: Function) => {
     let TAG = "test_CloudSync_ErrorType_008::";
     let tag = "====>test_CloudSync_ErrorType_008 ";
     console.info(tag + "start====");
     let WIFI_UNAVAILABLE = 2;
     try {
       console.info(tag + "start on_progress");
       gallerySync.on("progress",(pg)=>{
         console.info(tag + "progress_callback enter");
         console.info("gallerySync_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           if (pg.error == WIFI_UNAVAILABLE) {
             console.info("error: pg.error.WIFI_UNAVAILABLE == 2-WIFI不可用");
             try {
               expect(cloudSync.ErrorType.WIFI_UNAVAILABLE === 2).assertTrue();
             } catch (err) {
               console.info(tag + "Assert Fail: " + JSON.stringify(err));
             }
           }
         }
       });
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       errHandle(err,TAG);
     }
     console.info(tag + "end====");
     done();
   });

  /**
   * @tc.name   test_CloudSync_ErrorType_009
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0900
   * @tc.desc   function of API, Test ErrorType BATTERY_LEVEL_LOW
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
   it('test_CloudSync_ErrorType_009', Level.LEVEL3, async (done: Function) => {
     let TAG = "test_CloudSync_ErrorType_009::";
     let tag = "====>test_CloudSync_ErrorType_009 ";
     console.info(tag + "start====");
     let BATTERY_LEVEL_LOW = 3;
     try {
       console.info(tag + "start on_progress");
       gallerySync.on("progress",(pg)=>{
         console.info(tag + "progress_callback enter");
         console.info("gallerySync_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           if (pg.error == BATTERY_LEVEL_LOW) {
             console.info("error: pg.error.BATTERY_LEVEL_LOW == 3-低电量（低于15%）");
             try {
               expect(cloudSync.ErrorType.BATTERY_LEVEL_LOW === 3).assertTrue();
             } catch (err) {
               console.info(tag + "Assert Fail: " + JSON.stringify(err));
             }
           }
         }
       });
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       errHandle(err,TAG);
     }
     console.info(tag + "end====");
     done();
   });


  /**
   * @tc.name   test_CloudSync_ErrorType_010
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_1000
   * @tc.desc   function of API, Test ErrorType BATTERY_LEVEL_WARNING
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
   it('test_CloudSync_ErrorType_010', Level.LEVEL3, async (done: Function) => {
     let TAG = "test_CloudSync_ErrorType_010::";
     let tag = "====>test_CloudSync_ErrorType_010 ";
     console.info(tag + "start====");
     let BATTERY_LEVEL_WARNING = 4;
     try {
       console.info(tag + "start on_progress");
       gallerySync.on("progress",(pg)=>{
         console.info(tag + "progress_callback enter");
         console.info("gallerySync_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           if (pg.error == BATTERY_LEVEL_WARNING) {
             console.info("error: pg.error.BATTERY_LEVEL_WARNING == 4-告警电量（低于10%）");
             try {
               expect(cloudSync.ErrorType.BATTERY_LEVEL_WARNING === 4).assertTrue();
             } catch (err) {
               console.info(tag + "Assert Fail: " + JSON.stringify(err));
             }
           }
         }
       });
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       errHandle(err,TAG);
     }
     console.info(tag + "end====");
     done();
   });


  /**
   * @tc.name   test_CloudSync_ErrorType_011
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_1100
   * @tc.desc   function of API, Test ErrorType CLOUD_STORAGE_FULL
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
   it('test_CloudSync_ErrorType_011', Level.LEVEL3, async (done: Function) => {
     let TAG = "test_CloudSync_ErrorType_011::";
     let tag = "====>test_CloudSync_ErrorType_011 ";
     console.info(tag + "start====");
     let CLOUD_STORAGE_FULL = 5;
     try {
       console.info(tag + "start on_progress");
       gallerySync.on("progress",(pg)=>{
         console.info(tag + "progress_callback enter");
         console.info("gallerySync_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           if (pg.error == CLOUD_STORAGE_FULL) {
             console.info("error: pg.error.CLOUD_STORAGE_FULL == 5-云端空间不足");
             try {
               expect(cloudSync.ErrorType.CLOUD_STORAGE_FULL === 5).assertTrue();
             } catch (err) {
               console.info(tag + "Assert Fail: " + JSON.stringify(err));
             }
           }
         }
       });
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       errHandle(err,TAG);
     }
     console.info(tag + "end====");
     done();
   });


  /**
   * @tc.name   test_CloudSync_ErrorType_012
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_1200
   * @tc.desc   function of API, Test ErrorType DEVICE_TEMPERATURE_TOO_HIGH
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
   it('test_CloudSync_ErrorType_012', Level.LEVEL3, async (done: Function) => {
     let TAG = "test_CloudSync_ErrorType_012::";
     let tag = "====>test_CloudSync_ErrorType_012 ";
     console.info(tag + "start====");
     let DEVICE_TEMPERATURE_TOO_HIGH = 7;
     try {
       console.info(tag + "start on_progress");
       gallerySync.on("progress",(pg)=>{
         console.info(tag + "progress_callback enter");
         console.info("gallerySync_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           if (pg.error == DEVICE_TEMPERATURE_TOO_HIGH) {
             console.info("error: pg.error.DEVICE_TEMPERATURE_TOO_HIGH == 7-设备温度过高");
             try {
               expect(cloudSync.ErrorType.DEVICE_TEMPERATURE_TOO_HIGH === 7).assertTrue();
             } catch (err) {
               console.info(tag + "Assert Fail: " + JSON.stringify(err));
             }
           }
         }
       });
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       errHandle(err,TAG);
     }
     console.info(tag + "end====");
     done();
   });

  /**
   * @tc.name   test_CloudSync_NotifyType_001
   * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0100
   * @tc.desc   function of API, Test  NotifyType NOTIFY_ADDED.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
   it('test_CloudSync_NotifyType_001', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_CloudSync_NotifyType_001 ";
     console.info(tag + "start====");
     console.info('--------------test_CloudSync_NotifyType_001 begin-------------------')
     try{
       let value1 = cloudSync.NotifyType.NOTIFY_ADDED;
       expect(value1).assertEqual(0);
       console.info(tag + "end====");
       done();
     }catch(e){
       console.info(tag + "catch err: " + JSON.stringify(e));
       console.info("test_CloudSync_NotifyType_001 has failed for " + e.message + ",code:"+e.code);
       expect(false).assertTrue();
     }
   });


  /**
   * @tc.name   test_CloudSync_NotifyType_002
   * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0200
   * @tc.desc   function of API, Test  NotifyType NOTIFY_MODIFIED.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
   it('test_CloudSync_NotifyType_002', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_CloudSync_NotifyType_002 ";
     console.info(tag + "start====");
     console.info('--------------test_CloudSync_NotifyType_002 begin-------------------')
     try{
       let value1 = cloudSync.NotifyType.NOTIFY_MODIFIED;
       expect(value1).assertEqual(1);
       console.info(tag + "end====");
       done();
     }catch(e){
       console.info(tag + "catch err: " + JSON.stringify(e));
       console.info("test_CloudSync_NotifyType_002 has failed for " + e.message + ",code:"+e.code);
       expect(false).assertTrue();
     }
   });

  /**
   * @tc.name   test_CloudSync_NotifyType_003
   * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0300
   * @tc.desc   function of API, Test  NotifyType NOTIFY_MODIFIED.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
   it('test_CloudSync_NotifyType_003', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_CloudSync_NotifyType_003 ";
     console.info(tag + "start====");
     console.info('--------------test_CloudSync_NotifyType_003 begin-------------------')
     try{
       let value1 = cloudSync.NotifyType.NOTIFY_DELETED;
       expect(value1).assertEqual(2);
       console.info(tag + "end====");
       done();
     }catch(e){
       console.info(tag + "catch err: " + JSON.stringify(e));
       console.info("test_CloudSync_NotifyType_002 has failed for " + e.message + ",code:"+e.code);
       expect(false).assertTrue();
     }
   });


  /**
   * @tc.name   test_CloudSync_NotifyType_004
   * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0400
   * @tc.desc   function of API, Test  NotifyType NOTIFY_RENAMED.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
   it('test_CloudSync_NotifyType_004', Level.LEVEL3, async (done: Function) => {
     let tag = "====>test_CloudSync_NotifyType_004 ";
     console.info(tag + "start====");
     console.info('--------------test_CloudSync_NotifyType_004 begin-------------------')
     try{
       let value1 = cloudSync.NotifyType.NOTIFY_RENAMED;
       expect(value1).assertEqual(3);
       console.info(tag + "end====");
       done();
     }catch(e){
       console.info(tag + "catch err: " + JSON.stringify(e));
       console.info("test_CloudSync_NotifyType_002 has failed for " + e.message + ",code:"+e.code);
       expect(false).assertTrue();
     }
   });

  /**
   * @tc.name   test_Getlastsynctime_001
   * @tc.number SUB_STORAGE_GETLASTAYNCTIME_TEST_0100
   * @tc.desc   function of API, Test getLastsynctime interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
   it('test_Getlastsynctime_001', Level.LEVEL3, async (done: Function) => {
     let TAG = "test_Getlastsynctime_001::";
     let tag = "====>test_Getlastsynctime_001 ";
     console.info(tag + "start====");
     let fileSync = new cloudSync.FileSync();
     try {
       console.info(tag + "start getLastSyncTime");
       let timeStamp = await fileSync.getLastSyncTime();
       let date = new Date(timeStamp);
       expect(cloudSync.SyncState.UPLOADING === 0).assertTrue();
     } catch (err) {
       console.info(tag + "catch err: " + JSON.stringify(err));
       errHandle(err,TAG);
     }
     console.info(tag + "end====");
     done();
   });

  /**
   * @tc.name   test_Getlastsynctime_002
   * @tc.number SUB_STORAGE_GETLASTAYNCTIME_TEST_0200
   * @tc.desc   function of API, Test getLastsynctime interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
   it('test_Getlastsynctime_002', Level.LEVEL3, async (done: Function) => {
     let TAG = "test_Getlastsynctime_002::";
     let tag = "====>test_Getlastsynctime_002 ";
     console.info(tag + "start====");
     let fileSync = new cloudSync.FileSync();
      try {
        console.info(tag + "start getLastSyncTime");
        fileSync.getLastSyncTime((err, timeStamp) => {
          console.info(tag + "getLastSyncTime callback enter");
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "timeStamp: " + JSON.stringify(timeStamp));
          if (err) {
            console.error("test_Getlastsynctime_002 get last sync time failed: " + err.message + ", error code: " + err.code);
          } else {
            let date = new Date(timeStamp);
            console.info("test_Getlastsynctime_002 get last sync time successfully:"+ date);
            try {
              expect(cloudSync.SyncState.UPLOADING === 0).assertTrue();
            } catch (err) {
              console.info(tag + "Assert Fail: " + JSON.stringify(err));
            }
          }
          console.info(tag + "end====");
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        errHandle(err,TAG);
        console.info(tag + "end====");
        done();
      }
   });
  });
}