/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { clickRequestPermission } from './ClickRequestPermission';
import { sleep } from './Sleep';
import manager from '@ohos.nearlink.manager';
import dataTransfer from '@ohos.nearlink.dataTransfer';
import constant from '@ohos.nearlink.constant';
import { openNearLink } from './OpenNearLink';

export default function dataTransferTest() {
  describe('dataTransferTest', () => {
    let return_boolean: boolean;
    let TIME_SLEEP: number = 2000;
    let ADDRESS = "11:22:33:44:55:66";
    let ADDRESS_Invailable1 = "11:22:33:44:55:6";
    let ADDRESS_Invailable2 = "11:22:33:44:55:666";
    let ADDRESS_Invailable3 = "";
    let UUID = "FFFFFFFF-1234-5678-ABCD-000000001234";
    let UUID_test = "a1b2c3d4-e5f6-7890-abcd-ef1234567890";
    let UUID_Upp_Available = "060D";
    let UUID_LOW_Available = "060d";
    let UUID_Invalid = "";
    let UUID_Upp_Invailable = "37BEA880-FC70-11EA-B720-000000000001";
    let UUID_LOW_Invailable = "37bea880-fc70-11ea-b720-000000000001";
    let manufacturerDataBuffer = new Uint8Array(4);
    manufacturerDataBuffer[0] = 1;
    manufacturerDataBuffer[1] = 2;
    manufacturerDataBuffer[2] = 3;
    manufacturerDataBuffer[3] = 4;
    beforeAll(async (done:Function) => {
      console.info('[Nearlink Test] beforeAll start');
      await sleep(TIME_SLEEP);
      await clickRequestPermission();
      return_boolean = manager.isNearLinkSupported();
      console.info('[Nearlink Test] beforeAll end');
      done();
    });
    beforeEach(async (done:Function) => {
      console.info('[Nearlink Test] beforeEach start');
      await openNearLink();
      try {
        dataTransfer.createPort(UUID);
      } catch (error) {
        console.info('[Nearlink Test] nearlink api get error:' + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info('[Nearlink Test] beforeEach end');
      done();
    })
    afterEach(async (done:Function) => {
      console.info('[Nearlink Test] afterEach start');
      try {
        dataTransfer.destroyPort(UUID);
      } catch (error) {
        console.info('[Nearlink Test] nearlink api get error:' + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info('[Nearlink Test] afterEach end');
      done();
    })
    afterAll(() => {
      console.info('[Nearlink Test] afterAll');
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLink_DataTransfer_Enum_0100
     * @tc.name SUB_Communication_XTS_NearLink_DataTransfer_Enum_0100
     * @tc.desc TransferMode enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_DataTransfer_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_DataTransfer_Enum_0100';
        console.info(`${caseName} test start`);
        try {
          let BASIC: dataTransfer.TransferMode = dataTransfer.TransferMode.BASIC;
          console.info(`${caseName} BASIC result:` + BASIC);
          expect(BASIC).assertEqual(0);
          let RELIABLE: dataTransfer.TransferMode = dataTransfer.TransferMode.RELIABLE;
          console.info(`${caseName} RELIABLE result:` + RELIABLE);
          expect(RELIABLE).assertEqual(1);
        } catch (error) {
          console.info(`${caseName} TransferMode error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0100
     * @tc.desc dataTransfer.onConnectionStateChanged normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0100';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: dataTransfer.ConnectionResult) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        dataTransfer.onConnectionStateChanged(onReceiveEvent);
        dataTransfer.offConnectionStateChanged(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onConnectionStateChanged/offConnectionStateChanged error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0200
     * @tc.desc dataTransfer onConnectionStateChanged with callback, offConnectionStateChanged without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0200';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: dataTransfer.ConnectionResult) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        dataTransfer.onConnectionStateChanged(onReceiveEvent);
        dataTransfer.offConnectionStateChanged();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onConnectionStateChanged/offConnectionStateChanged error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0300
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0300
     * @tc.desc dataTransfer.onConnectionStateChanged with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0300';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.onConnectionStateChanged(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onConnectionStateChanged error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0400
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0400
     * @tc.desc dataTransfer.offConnectionStateChanged with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0400';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.offConnectionStateChanged(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offConnectionStateChanged error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0500
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0500
     * @tc.desc dataTransfer.onConnectionStateChanged with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0500';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.onConnectionStateChanged(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onConnectionStateChanged error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0600
     * @tc.desc dataTransfer.offConnectionStateChanged with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0600';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.offConnectionStateChanged(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offConnectionStateChanged error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0700
     * @tc.desc dataTransfer.onReadData normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0700';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: dataTransfer.DataParams) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        dataTransfer.onReadData(onReceiveEvent);
        dataTransfer.offReadData(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onReadData/offReadData error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0800
     * @tc.desc dataTransfer onReadData with callback, offReadData without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0800';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: dataTransfer.DataParams) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        dataTransfer.onReadData(onReceiveEvent);
        dataTransfer.offReadData();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onReadData/offReadData error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0900
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0900
     * @tc.desc dataTransfer.onReadData with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0900';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.onReadData(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onReadData error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1000
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1000
     * @tc.desc dataTransfer.offReadData with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1000';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.offReadData(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offReadData error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1100
     * @tc.desc dataTransfer.onReadData with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1100';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.onReadData(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onReadData error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1200
     * @tc.desc dataTransfer.offReadData with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_1200';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.offReadData(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offReadData error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0100
     * @tc.desc dataTransfer createPort and destroyPort normal call with valid UUID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_0100';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.createPort(UUID_test);
        console.info('[Nearlink Test] createPort success');
        dataTransfer.destroyPort(UUID_test);
        console.info('[Nearlink Test] destroyPort success');
      }catch (err) {
        console.info('[Nearlink Test] createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0200
     * @tc.desc dataTransfer createPort with already registered UUID returns error 36100020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_0200';
      console.info(`${caseName} test start`);
      try {
        console.info('[Nearlink Test] repeat createPort start.');
        dataTransfer.createPort(UUID);
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] repeat createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100020);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_0300
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0300
     * @tc.desc dataTransfer destroyPort with unregistered UUID returns error 36100022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_0300';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.destroyPort(UUID_test);
        console.info('[Nearlink Test] repeat destroyPort end');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] repeat destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100022);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_0400
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0400
     * @tc.desc dataTransfer createPort and destroyPort with uppercase available UUID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_0400';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.createPort(UUID_Upp_Available);
        console.info('[Nearlink Test] createPort success');
        dataTransfer.destroyPort(UUID_Upp_Available);
        console.info('[Nearlink Test] destroyPort success');
      }catch (err) {
        console.info('[Nearlink Test] repeat createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_0500
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0500
     * @tc.desc dataTransfer createPort with NearLink standard lowercase UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_0500';
      console.info(`${caseName} test start`);
      try {
        console.info('[Nearlink Test] repeat createPort start.');
        dataTransfer.createPort(UUID_LOW_Invailable);
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] repeat createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0600
     * @tc.desc dataTransfer destroyPort with NearLink standard lowercase UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_0600';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.destroyPort(UUID_LOW_Invailable);
        console.info('[Nearlink Test] repeat destroyPort end');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] repeat destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_0700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0700
     * @tc.desc dataTransfer createPort with NearLink standard uppercase UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_0700';
      console.info(`${caseName} test start`);
      try {
        console.info('[Nearlink Test] repeat createPort start.');
        dataTransfer.createPort(UUID_Upp_Invailable);
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] repeat createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_0800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0800
     * @tc.desc dataTransfer destroyPort with NearLink standard uppercase UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_0800';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.destroyPort(UUID_Upp_Invailable);
        console.info('[Nearlink Test] repeat destroyPort end');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] repeat destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_0900
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0900
     * @tc.desc dataTransfer createPort and destroyPort with lowercase available UUID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_0900';
      console.info(`${caseName} test start`);
      try {
        dataTransfer.createPort(UUID_LOW_Available);
        console.info('[Nearlink Test] createPort end.');
      }catch (err) {
        console.info('[Nearlink Test] createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      try {
        dataTransfer.destroyPort(UUID_LOW_Available);
        console.info('[Nearlink Test] destroyPort end.');
      }catch (err) {
        console.info('[Nearlink Test] destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_1000
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1000
     * @tc.desc dataTransfer createPort with invalid UUID returns error 36100043
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_1000';
      console.info(`${caseName} test start`);
      try {
        console.info('[Nearlink Test] createPort 1 bytes start.');
        dataTransfer.createPort(UUID_Invalid);
        console.info('[Nearlink Test] createPort 1 bytes end.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] createPort 1 bytes fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_1100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1100
     * @tc.desc dataTransfer destroyPort with invalid UUID returns error 36100043
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done:Function) => {
      try {
        console.info('[Nearlink Test] destroyPort 1 bytes start.');
        dataTransfer.destroyPort(UUID_Invalid);
        console.info('[Nearlink Test] destroyPort 1 bytes end.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] destroyPort 1 bytes fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_1200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1200
     * @tc.desc dataTransfer getConnectionState with valid ConnectionParams
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS, uuid:UUID}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        console.info('[Nearlink Test] getConnectionState result:' + connectionState);
        const enumvalue: number[] = [
          constant.ConnectionState.STATE_CONNECTING, constant.ConnectionState.STATE_CONNECTED,
          constant.ConnectionState.STATE_DISCONNECTING, constant.ConnectionState.STATE_DISCONNECTED];
        expect(enumvalue.includes(connectionState)).assertTrue();
      }catch (error) {
        console.info("[Nearlink Test] nearLink getConnectionState errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_1300
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1300
     * @tc.desc dataTransfer getConnectionState with invalid address returns error 36100041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS_Invailable1, uuid:UUID_test}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        console.info('[Nearlink Test] getConnectionState result:' + connectionState);
        expect().assertFail();
      }catch (error) {
        console.info("[Nearlink Test] nearLink getConnectionState errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_1400
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1400
     * @tc.desc dataTransfer getConnectionState with overlength address returns error 36100041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS_Invailable2, uuid:UUID_Upp_Available}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        console.info('[Nearlink Test] getConnectionState result:' + connectionState);
        expect().assertFail();
      }catch (error) {
        console.info("[Nearlink Test] nearLink getConnectionState errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_1500
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1500
     * @tc.desc dataTransfer getConnectionState with empty address returns error 36100041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS_Invailable3, uuid:UUID_LOW_Available}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        console.info('[Nearlink Test] getConnectionState result:' + connectionState);
        expect().assertFail();
      }catch (error) {
        console.info("[Nearlink Test] nearLink getConnectionState errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_1600
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1600
     * @tc.desc dataTransfer getConnectionState with invalid UUID returns error 36100043
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS, uuid:UUID_Invalid}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        console.info('[Nearlink Test] getConnectionState result:' + connectionState);
        expect().assertFail();
      }catch (error) {
        console.info("[Nearlink Test] nearLink getConnectionState errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_1700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1700
     * @tc.desc dataTransfer getConnectionState with uppercase invalid UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS, uuid:UUID_Upp_Invailable}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        console.info('[Nearlink Test] getConnectionState result:' + connectionState);
        expect().assertFail();
      }catch (error) {
        console.info("[Nearlink Test] nearLink getConnectionState errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_1800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1800
     * @tc.desc dataTransfer getConnectionState with lowercase invalid UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS, uuid:UUID_LOW_Invailable}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        console.info('[Nearlink Test] getConnectionState result:' + connectionState);
        expect().assertFail();
      }catch (error) {
        console.info("[Nearlink Test] nearLink getConnectionState errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_1900
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1900
     * @tc.desc dataTransfer connect with undefined parameter returns error 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.connect(undefined);
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] connect undefined fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_2000
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2000
     * @tc.desc dataTransfer disconnect with undefined parameter returns error 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.disconnect(undefined);
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] disconnect undefined fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_2100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2100
     * @tc.desc dataTransfer connect with null parameter returns error 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.connect(null);
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] connect null fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_2200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2200
     * @tc.desc dataTransfer disconnect with null parameter returns error 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.disconnect(null);
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] disconnect null fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_2300
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2300
     * @tc.desc dataTransfer getConnectionState with undefined parameter returns error 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(undefined);
        console.info('[Nearlink Test] getConnectionState result:' + connectionState);
        expect().assertFail();
      }catch (error) {
        console.info("[Nearlink Test] nearLink getConnectionState errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_2400
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2400
     * @tc.desc dataTransfer getConnectionState with null parameter returns error 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(null);
        console.info('[Nearlink Test] getConnectionState result:' + connectionState);
        expect().assertFail();
      }catch (error) {
        console.info("[Nearlink Test] nearLink getConnectionState errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_2500
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2500
     * @tc.desc dataTransfer writeData with undefined parameter returns error 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        await dataTransfer.writeData(undefined)
        console.info('[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] dataTransfer writeData fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_2600
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2600
     * @tc.desc dataTransfer writeData with null parameter returns error 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        await dataTransfer.writeData(null);
        console.info('[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] dataTransfer writeData fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_2700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2700
     * @tc.desc dataTransfer connect and disconnect with valid ConnectionParams
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS,
        uuid:UUID
      }
      try {
        await dataTransfer.connect(params);
        console.info('[nearLink_test]dataTransfer connect success.');
      }catch (err) {
        console.info('[nearLink_test]dataTransfer connect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }

      try {
        await dataTransfer.disconnect(params);
        console.info('[nearLink_test]dataTransfer disconnect success.');
      }catch (err) {
        console.info('[nearLink_test]dataTransfer disconnect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_2800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2800
     * @tc.desc dataTransfer connect and disconnect with invalid address return error 36100041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS_Invailable1,
        uuid:UUID_test,
        transferMode:dataTransfer.TransferMode.BASIC
      }
      try {
        await dataTransfer.connect(params);
        console.info('[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer connect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        console.info('[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer disconnect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_2900
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2900
     * @tc.desc dataTransfer connect and disconnect with overlength address return error 36100041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS_Invailable2,
        uuid:UUID_Upp_Available
      }
      try {
        await dataTransfer.connect(params);
        console.info('[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer connect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        console.info('[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer disconnect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_3000
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3000
     * @tc.desc 参数覆盖 connect disconnect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS_Invailable3,
        uuid:UUID_LOW_Available,
        transferMode:dataTransfer.TransferMode.RELIABLE
      }
      try {
        await dataTransfer.connect(params);
        console.info('[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer connect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        console.info('[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer disconnect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_3100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3100
     * @tc.desc 参数覆盖 connect disconnect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS,
        uuid:UUID_Invalid
      }
      try {
        await dataTransfer.connect(params);
        console.info('[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer connect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        console.info('[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer disconnect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_3200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3200
     * @tc.desc 参数覆盖 connect disconnect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS,
        uuid:UUID_Upp_Invailable
      }
      try {
        await dataTransfer.connect(params);
        console.info('[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer connect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        console.info('[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer disconnect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_3300
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3300
     * @tc.desc 参数覆盖 connect disconnect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS,
        uuid:UUID_LOW_Invailable
      }
      try {
        await dataTransfer.connect(params);
        console.info('[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer connect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        console.info('[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[nearLink_test]dataTransfer disconnect fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_3400
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3400
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS,
        uuid:UUID,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        console.info('[Nearlink Test] dataTransfer writeData success.');
      }catch (err) {
        console.info('[Nearlink Test] dataTransfer writeData fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_3500
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3500
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS_Invailable1,
        uuid:UUID_test,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        console.info('[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] dataTransfer writeData fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_3600
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3600
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS_Invailable2,
        uuid:UUID_Upp_Available,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        console.info('[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] dataTransfer writeData fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_3700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3700
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS_Invailable3,
        uuid:UUID_LOW_Available,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        console.info('[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] dataTransfer writeData fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_3800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3800
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS,
        uuid:UUID_Invalid,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        console.info('[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] dataTransfer writeData fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_3900
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3900
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS,
        uuid:UUID_Upp_Invailable,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        console.info('[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] dataTransfer writeData fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_4000
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4000
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS,
        uuid:UUID_LOW_Invailable,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        console.info('[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] dataTransfer writeData fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_4100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4100
     * @tc.desc createPort 入参 ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.createPort('');
        console.info('[Nearlink Test] createPort end.');
      }catch (err) {
        console.info('[Nearlink Test] createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_4200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4200
     * @tc.desc destroyPort 入参 ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.destroyPort('');
        console.info('[Nearlink Test] destroyPort end.');
      }catch (err) {
        console.info('[Nearlink Test] destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_4300
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4300
     * @tc.desc createPort 入参 null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.createPort(null);
        console.info('[Nearlink Test] createPort end.');
      }catch (err) {
        console.info('[Nearlink Test] createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_4400
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4400
     * @tc.desc destroyPort 入参 null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.destroyPort(null);
        console.info('[Nearlink Test] destroyPort end.');
      }catch (err) {
        console.info('[Nearlink Test] destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_4500
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4500
     * @tc.desc createPort 入参 undefinded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.createPort(undefined);
        console.info('[Nearlink Test] createPort end.');
      }catch (err) {
        console.info('[Nearlink Test] createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_4600
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4600
     * @tc.desc destroyPort 入参 undefinded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.destroyPort(undefined);
        console.info('[Nearlink Test] destroyPort end.');
      }catch (err) {
        console.info('[Nearlink Test] destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_4700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4700
     * @tc.desc connect 入参 null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        await dataTransfer.connect(null);
        console.info('[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_4800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4800
     * @tc.desc disconnect 入参 null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        await dataTransfer.disconnect(null);
        console.info('[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_4900
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4900
     * @tc.desc connect 入参 undefinded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        await dataTransfer.connect(undefined);
        console.info('[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_5000
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5000
     * @tc.desc disconnect 入参 undefinded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        await dataTransfer.disconnect(undefined);
        console.info('[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test] destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_5100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5100
     * @tc.desc createPort 入参 128bt 长度+1 不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let UUID = "FFFFFFFF-1234-5678-ABCD-0000000012341";
        dataTransfer.createPort(UUID);
        console.info('[Nearlink Test] createPort end.');
      }catch (err) {
        console.info('[Nearlink Test] createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_5200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5200
     * @tc.desc destroyPort 入参 128bt 长度+1 不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let UUID = "a1b2c3d4-e5f6-7890-abcd-ef12345678901";
        dataTransfer.destroyPort(UUID);
        console.info('[Nearlink Test] destroyPort end.');
      }catch (err) {
        console.info('[Nearlink Test] destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_5300
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5300
     * @tc.desc createPort 入参 长度+1 不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.createPort("060D1");
        console.info('[Nearlink Test] createPort end.');
      }catch (err) {
        console.info('[Nearlink Test] createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_5400
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5400
     * @tc.desc destroyPort 入参 长度+1 不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.destroyPort("060D1");
        console.info('[Nearlink Test] destroyPort end.');
      }catch (err) {
        console.info('[Nearlink Test] destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_5500
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5500
     * @tc.desc createPort 入参 长度-1 不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.createPort("06D");
        console.info('[Nearlink Test] createPort end.');
      }catch (err) {
        console.info('[Nearlink Test] createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_5600
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5600
     * @tc.desc destroyPort 入参 长度+1 不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        dataTransfer.destroyPort("06d");
        console.info('[Nearlink Test] destroyPort end.');
      }catch (err) {
        console.info('[Nearlink Test] destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_5700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5700
     * @tc.desc createPort 入参 128bt 长度-1 不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let UUID = "a1b2c3d4-e5f6-7890-abcd-ef123456789";
        dataTransfer.createPort(UUID);
        console.info('[Nearlink Test] createPort end.');
      }catch (err) {
        console.info('[Nearlink Test] createPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_5800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5800
     * @tc.desc destroyPort 入参 128bt 长度-1 不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      try {
        let UUID = "FFFFFFFF-1234-5678-ABCD-00000000123";
        dataTransfer.destroyPort(UUID);
        console.info('[Nearlink Test] destroyPort end.');
      }catch (err) {
        console.info('[Nearlink Test] destroyPort fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info("[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    });
  })
}