'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import Utils from './Util.test';
import manager from '@ohos.nearlink.manager';
import dataTransfer from '@ohos.nearlink.dataTransfer';
import constant from '@ohos.nearlink.constant';
import hilog from '@ohos.hilog';

export default function dataTransferTest(): void {
  describe('dataTransferTest', () => {
    let return_boolean: boolean;
    let isFrameType4Supported: boolean;
    let TIME_SLEEP: int = 2000;
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
    let manufacturerDataBufferTemp = new ArrayBuffer(4);
    let manufacturerDataBuffer = new DataView(manufacturerDataBufferTemp);
    manufacturerDataBuffer.setUint8(0, 4);
    manufacturerDataBuffer.setUint8(1, 6);
    manufacturerDataBuffer.setUint8(2, 7);
    manufacturerDataBuffer.setUint8(3, 8);
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] beforeAll start');
      await Utils.msSleep(TIME_SLEEP);
      await Utils.clickRequestPermission();
      return_boolean = manager.isNearLinkSupported();
      isFrameType4Supported = manager.isFrameType4Supported();
      hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] beforeAll end');
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] beforeEach start');
      await Utils.openNearLink();
      try {
        dataTransfer.createPort(UUID);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] nearlink api get error:%{public}s', JSON.stringify(error));
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] beforeEach end');
      done();
    })
    afterEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] afterEach start');
      try {
        dataTransfer.destroyPort(UUID);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] nearlink api get error:%{public}s', JSON.stringify(error));
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] afterEach end');
      done();
    })
    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] afterAll');
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_DataTransfer_Enum_static_0100
     * @tc.number SUB_Communication_XTS_NearLink_DataTransfer_Enum_0100
     * @tc.desc TransferMode enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_DataTransfer_Enum_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLink_DataTransfer_Enum_static_0100';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let BASIC: dataTransfer.TransferMode = dataTransfer.TransferMode.BASIC;
          hilog.info(0x0000, 'testTag', '%{public}s BASIC result: %{public}d', caseName, BASIC);
          expect(BASIC).assertEqual(0);
          let RELIABLE: dataTransfer.TransferMode = dataTransfer.TransferMode.RELIABLE;
          hilog.info(0x0000, 'testTag', '%{public}s RELIABLE result: %{public}d', caseName, RELIABLE);
          expect(RELIABLE).assertEqual(1);
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s TransferMode error.code %{public}s,errMessage: %{public}s', caseName, JSON.stringify(error.code), JSON.stringify(error.message));
          expect().assertFail();
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0100
     * @tc.desc dataTransfer.onConnectionStateChanged normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: dataTransfer.ConnectionResult) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        dataTransfer.onConnectionStateChanged(onReceiveEvent);
        dataTransfer.offConnectionStateChanged(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onConnectionStateChanged/offConnectionStateChanged error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0200
     * @tc.desc dataTransfer onConnectionStateChanged with callback, offConnectionStateChanged without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: dataTransfer.ConnectionResult) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        dataTransfer.onConnectionStateChanged(onReceiveEvent);
        dataTransfer.offConnectionStateChanged();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onConnectionStateChanged/offConnectionStateChanged error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0700
     * @tc.desc dataTransfer.onReadData normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0700';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: dataTransfer.DataParams) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        dataTransfer.onReadData(onReceiveEvent);
        dataTransfer.offReadData(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onReadData/offReadData error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_On_0800
     * @tc.desc dataTransfer onReadData with callback, offReadData without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_On_static_0800';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: dataTransfer.DataParams) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        dataTransfer.onReadData(onReceiveEvent);
        dataTransfer.offReadData();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onReadData/offReadData error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0100
     * @tc.desc dataTransfer createPort and destroyPort normal call with valid UUID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        dataTransfer.createPort(UUID_test);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] createPort success');
        dataTransfer.destroyPort(UUID_test);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] destroyPort success');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] createPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0200
     * @tc.desc dataTransfer createPort with already registered UUID returns error 36100020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] repeat createPort start.');
        dataTransfer.createPort(UUID);
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] repeat createPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100020);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0300
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0300
     * @tc.desc dataTransfer destroyPort with unregistered UUID returns error 36100022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0300';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        dataTransfer.destroyPort(UUID_test);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] repeat destroyPort end');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] repeat destroyPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100022);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0400
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0400
     * @tc.desc dataTransfer createPort and destroyPort with uppercase available UUID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0400';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        dataTransfer.createPort(UUID_Upp_Available);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] createPort success');
        dataTransfer.destroyPort(UUID_Upp_Available);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] destroyPort success');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] repeat createPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0500
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0500
     * @tc.desc dataTransfer createPort with NearLink standard lowercase UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0500';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] repeat createPort start.');
        dataTransfer.createPort(UUID_LOW_Invailable);
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] repeat createPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0600
     * @tc.desc dataTransfer destroyPort with NearLink standard lowercase UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0600';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        dataTransfer.destroyPort(UUID_LOW_Invailable);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] repeat destroyPort end');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] repeat destroyPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0700
     * @tc.desc dataTransfer createPort with NearLink standard uppercase UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0700';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] repeat createPort start.');
        dataTransfer.createPort(UUID_Upp_Invailable);
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] repeat createPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0800
     * @tc.desc dataTransfer destroyPort with NearLink standard uppercase UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0800';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        dataTransfer.destroyPort(UUID_Upp_Invailable);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] repeat destroyPort end');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] repeat destroyPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0900
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0900
     * @tc.desc dataTransfer createPort and destroyPort with lowercase available UUID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_static_0900';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        dataTransfer.createPort(UUID_LOW_Available);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] createPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] createPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      try {
        dataTransfer.destroyPort(UUID_LOW_Available);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] destroyPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] destroyPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1000
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1000
     * @tc.desc dataTransfer createPort with invalid UUID returns error 36100043
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1000';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] createPort 1 bytes start.');
        dataTransfer.createPort(UUID_Invalid);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] createPort 1 bytes end.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] createPort 1 bytes fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1100
     * @tc.desc dataTransfer destroyPort with invalid UUID returns error 36100043
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] destroyPort 1 bytes start.');
        dataTransfer.destroyPort(UUID_Invalid);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] destroyPort 1 bytes end.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] destroyPort 1 bytes fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1200
     * @tc.desc dataTransfer getConnectionState with valid ConnectionParams
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS, uuid:UUID}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] getConnectionState result:%{public}s', connectionState);
        const enumvalue: number[] = [
          constant.ConnectionState.STATE_CONNECTING, constant.ConnectionState.STATE_CONNECTED,
          constant.ConnectionState.STATE_DISCONNECTING, constant.ConnectionState.STATE_DISCONNECTED];
        expect(enumvalue.includes(connectionState)).assertTrue();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] nearLink getConnectionState errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1300
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1300
     * @tc.desc dataTransfer getConnectionState with invalid address returns error 36100041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS_Invailable1, uuid:UUID_test}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] getConnectionState result:%{public}s', connectionState);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] nearLink getConnectionState errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1400
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1400
     * @tc.desc dataTransfer getConnectionState with overlength address returns error 36100041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS_Invailable2, uuid:UUID_Upp_Available}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] getConnectionState result:%{public}s', connectionState);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] nearLink getConnectionState errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1500
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1500
     * @tc.desc dataTransfer getConnectionState with empty address returns error 36100041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS_Invailable3, uuid:UUID_LOW_Available}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] getConnectionState result:%{public}s', connectionState);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] nearLink getConnectionState errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1600
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1600
     * @tc.desc dataTransfer getConnectionState with invalid UUID returns error 36100043
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS, uuid:UUID_Invalid}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] getConnectionState result:%{public}s', connectionState);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] nearLink getConnectionState errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1700
     * @tc.desc dataTransfer getConnectionState with uppercase invalid UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS, uuid:UUID_Upp_Invailable}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] getConnectionState result:%{public}s', connectionState);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] nearLink getConnectionState errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_1800
     * @tc.desc dataTransfer getConnectionState with lowercase invalid UUID returns error 36100044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS, uuid:UUID_LOW_Invailable}
        let connectionState: dataTransfer.ConnectionState = dataTransfer.getConnectionState(ConnStateParams);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] getConnectionState result:%{public}s', connectionState);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] nearLink getConnectionState errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_2700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2700
     * @tc.desc dataTransfer connect and disconnect with valid ConnectionParams
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS,
        uuid:UUID
      }
      try {
        await dataTransfer.connect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer connect success.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer connect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }

      try {
        await dataTransfer.disconnect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer disconnect success.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer disconnect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_2800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2800
     * @tc.desc dataTransfer connect and disconnect with invalid address return error 36100041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS_Invailable1,
        uuid:UUID_test,
        transferMode:dataTransfer.TransferMode.BASIC
      }
      try {
        await dataTransfer.connect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer connect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer disconnect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_2900
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_2900
     * @tc.desc dataTransfer connect and disconnect with overlength address return error 36100041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS_Invailable2,
        uuid:UUID_Upp_Available
      }
      try {
        await dataTransfer.connect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer connect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer disconnect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3000
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3000
     * @tc.desc 参数覆盖 connect disconnect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS_Invailable3,
        uuid:UUID_LOW_Available,
        transferMode:dataTransfer.TransferMode.RELIABLE
      }
      try {
        await dataTransfer.connect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer connect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer disconnect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3100
     * @tc.desc 参数覆盖 connect disconnect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS,
        uuid:UUID_Invalid
      }
      try {
        await dataTransfer.connect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer connect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer disconnect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3200
     * @tc.desc 参数覆盖 connect disconnect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS,
        uuid:UUID_Upp_Invailable
      }
      try {
        await dataTransfer.connect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer connect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer disconnect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3300
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3300
     * @tc.desc 参数覆盖 connect disconnect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS,
        uuid:UUID_LOW_Invailable
      }
      try {
        await dataTransfer.connect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer connect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer connect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }

      try {
        await dataTransfer.disconnect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test]dataTransfer disconnect success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer disconnect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3400
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3400
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS,
        uuid:UUID,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] dataTransfer writeData success.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] dataTransfer writeData fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3500
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3500
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS_Invailable1,
        uuid:UUID_test,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] dataTransfer writeData fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3600
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3600
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS_Invailable2,
        uuid:UUID_Upp_Available,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] dataTransfer writeData fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3700
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS_Invailable3,
        uuid:UUID_LOW_Available,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] dataTransfer writeData fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3800
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS,
        uuid:UUID_Invalid,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] dataTransfer writeData fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3900
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_3900
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS,
        uuid:UUID_Upp_Invailable,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] dataTransfer writeData fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_4000
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4000
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.DataParams = {
        address:ADDRESS,
        uuid:UUID_LOW_Invailable,
        data:manufacturerDataBuffer.buffer
      }
      try {
        await dataTransfer.writeData(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] dataTransfer writeData success.');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] dataTransfer writeData fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_4100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4100
     * @tc.desc createPort 入参 ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        dataTransfer.createPort('');
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] createPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] createPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_4200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_4200
     * @tc.desc destroyPort 入参 ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        dataTransfer.destroyPort('');
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] destroyPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] destroyPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5100
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5100
     * @tc.desc createPort 入参 128bt 长度+1 不合�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let UUID = "FFFFFFFF-1234-5678-ABCD-0000000012341";
        dataTransfer.createPort(UUID);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] createPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] createPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5200
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5200
     * @tc.desc destroyPort 入参 128bt 长度+1 不合�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let UUID = "a1b2c3d4-e5f6-7890-abcd-ef12345678901";
        dataTransfer.destroyPort(UUID);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] destroyPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] destroyPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5300
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5300
     * @tc.desc createPort 入参 长度+1 不合�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        dataTransfer.createPort("060D1");
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] createPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] createPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5400
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5400
     * @tc.desc destroyPort 入参 长度+1 不合�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        dataTransfer.destroyPort("060D1");
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] destroyPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] destroyPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5500
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5500
     * @tc.desc createPort 入参 长度-1 不合�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        dataTransfer.createPort("06D");
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] createPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] createPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5600
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5600
     * @tc.desc destroyPort 入参 长度+1 不合�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        dataTransfer.destroyPort("06d");
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] destroyPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] destroyPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5700
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5700
     * @tc.desc createPort 入参 128bt 长度-1 不合�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let UUID = "a1b2c3d4-e5f6-7890-abcd-ef123456789";
        dataTransfer.createPort(UUID);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] createPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] createPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5800
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5800
     * @tc.desc destroyPort 入参 128bt 长度-1 不合�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let UUID = "FFFFFFFF-1234-5678-ABCD-00000000123";
        dataTransfer.destroyPort(UUID);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] destroyPort end.');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] destroyPort fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', "[Nearlink Test] api is not support");
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5900
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_5900
     * @tc.desc dataTransfer connect with frameType FRAME_TYPE_1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS,
        uuid:UUID,
        frameType:constant.FrameType.FRAME_TYPE_1
      }
      try {
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] call connect start');
        await dataTransfer.connect(params);
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer connect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] call disconnect start');
        await dataTransfer.disconnect(params);
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer disconnect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_static_6000
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_6000
     * @tc.desc dataTransfer connect with frameType FRAME_TYPE_4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let params: dataTransfer.ConnectionParams = {
        address:ADDRESS,
        uuid:UUID,
        frameType:constant.FrameType.FRAME_TYPE_4
      }
      try {
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] call connect start');
        await dataTransfer.connect(params);
        expect(isFrameType4Supported === true).assertTrue();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer connect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(err.code).assertEqual(801);
          expect(isFrameType4Supported === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] call disconnect start');
        await dataTransfer.disconnect(params);
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[nearLink_test]dataTransfer disconnect fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    })
  })
}