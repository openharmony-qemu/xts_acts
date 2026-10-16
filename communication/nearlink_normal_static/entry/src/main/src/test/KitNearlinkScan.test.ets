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
import manager from '@ohos.nearlink.manager';
import scan from '@ohos.nearlink.scan';

import Utils from './Util.test';
import hilog from '@ohos.hilog';
let TIME_SLEEP = 2000;

let manufacturerDataBufferTemp = new ArrayBuffer(4);
let manufacturerDataBuffer = new DataView(manufacturerDataBufferTemp);
manufacturerDataBuffer.setUint8(0, 4);
manufacturerDataBuffer.setUint8(1, 6);
manufacturerDataBuffer.setUint8(2, 7);
manufacturerDataBuffer.setUint8(3, 8);

let manufacturerDataMaskBufferTemp = new ArrayBuffer(4);
let manufacturerDataMaskBuffer = new DataView(manufacturerDataMaskBufferTemp);
manufacturerDataMaskBuffer.setUint8(0, 4);
manufacturerDataMaskBuffer.setUint8(1, 6);
manufacturerDataMaskBuffer.setUint8(2, 7);
manufacturerDataMaskBuffer.setUint8(3, 8);


//1.参数 address取值：
let ADDRESS = "00:11:22:33:44:55"
let ADDRESS_invailable_1 = "00:11:22:33:44:551"
let ADDRESS_invailable_2 = "00:11:22:33:4455"
let ADDRESS_invailable_3 = ""
//2.参数deviceName取值：
let NAME = "nearLink_XTS_test";
let NAME_vailable_1 = "Mate 60 Pro";
let NAME_vailable_2 = '';
// 3.参数rssi取值：-129，-128, 127, 128, 0
let RSSI = 0;
let RSSI_vailable_1 = -128;
let RSSI_vailable_2 = 127;
let RSSI_invailable_1 = -129;
let RSSI_invailable_2 = 128;
let SERVICE_UUID = 4567;
export default function scanTest(): void {
  describe('scanTest', () => {
    let return_boolean: boolean;
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll start');
      await Utils.clickRequestPermission();
      await Utils.msSleep(TIME_SLEEP);
      return_boolean = manager.isNearLinkSupported();
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll end');
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach start');
      await Utils.openNearLink();
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach end');
      done();
    })
    afterEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach');
    })
    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterAll');
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_Enum_static_0100
     * @tc.number SUB_Communication_XTS_NearLink_Scan_Enum_0100
     * @tc.desc ScanMode enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Scan_Enum_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLink_Scan_Enum_static_0100';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let SCAN_MODE_LOW_POWER: scan.ScanMode = scan.ScanMode.SCAN_MODE_LOW_POWER;
          hilog.info(0x0000, 'testTag', '%{public}s SCAN_MODE_LOW_POWER result: %{public}d', caseName, SCAN_MODE_LOW_POWER);
          expect(SCAN_MODE_LOW_POWER).assertEqual(0);
          let SCAN_MODE_BALANCED: scan.ScanMode = scan.ScanMode.SCAN_MODE_BALANCED;
          hilog.info(0x0000, 'testTag', '%{public}s SCAN_MODE_BALANCED result: %{public}d', caseName, SCAN_MODE_BALANCED);
          expect(SCAN_MODE_BALANCED).assertEqual(1);
          let SCAN_MODE_LOW_LATENCY: scan.ScanMode = scan.ScanMode.SCAN_MODE_LOW_LATENCY;
          hilog.info(0x0000, 'testTag', '%{public}s SCAN_MODE_LOW_LATENCY result: %{public}d', caseName, SCAN_MODE_LOW_LATENCY);
          expect(SCAN_MODE_LOW_LATENCY).assertEqual(2);
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s ScanMode error.code %{public}s,errMessage: %{public}s', caseName, JSON.stringify(error.code), JSON.stringify(error.message));
          expect().assertFail();
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_ON_static_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_ON_0100
     * @tc.desc 无法触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_ON_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Scan_ON_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onDeviceFound/offDeviceFound error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_ON_static_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_ON_0200
     * @tc.desc 无法触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_ON_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Scan_ON_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        scan.offDeviceFound();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onDeviceFound/offDeviceFound error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
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
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_0100
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0100
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent = (scanRes: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] result = %{public}s', JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan address = %{public}s', JSON.stringify(scanRes[0].address));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan rssi = %{public}s', JSON.stringify(scanRes[0].rssi));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan data = %{public}s', JSON.stringify(scanRes[0].data));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceName = %{public}s', JSON.stringify(scanRes[0].deviceName));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan isConnectable = %{public}s', JSON.stringify(scanRes[0].isConnectable));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceClass = %{public}s', JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] onDeviceFound success');
        await scan.startScan(null);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        await Utils.msSleep(1000);
        await scan.stopScan();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopScan promise success');
        scan.offDeviceFound();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] offDeviceFound success');
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_0300
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0300
     * @tc.desc startScan with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await scan.startScan([]);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0300 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100042);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_0500
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0500
     * @tc.desc startScan with null filters and undefined options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent = (scanRes: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] result = %{public}s', JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan address = %{public}s', JSON.stringify(scanRes[0].address));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan rssi = %{public}s', JSON.stringify(scanRes[0].rssi));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan data = %{public}s', JSON.stringify(scanRes[0].data));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceName = %{public}s', JSON.stringify(scanRes[0].deviceName));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan isConnectable = %{public}s', JSON.stringify(scanRes[0].isConnectable));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceClass = %{public}s', JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] onDeviceFound success');
        await scan.startScan(null, undefined);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        await Utils.msSleep(1000);
        await scan.stopScan();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopScan promise success');
        scan.offDeviceFound();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] offDeviceFound success');
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0500 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_0600
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0600
     * @tc.desc startScan with scanFilters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let scanFilters: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan ScanResults = %{public}s', JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan address = %{public}s', JSON.stringify(scanRes[0].address));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan rssi = %{public}s', JSON.stringify(scanRes[0].rssi));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan data = %{public}s', JSON.stringify(scanRes[0].data));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceName = %{public}s', JSON.stringify(scanRes[0].deviceName));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan isConnectable = %{public}s', JSON.stringify(scanRes[0].isConnectable));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceClass = %{public}s', JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters]);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        await scan.stopScan();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_0700
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0700
     * @tc.desc startScan with empty scanFilters and empty ScanOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合0: 非法基线 ====================
      let scanFilters: scan.ScanFilters = {
      };
      let scanOptions: scan.ScanOptions = {
      };
      try {
        await scan.startScan([scanFilters], scanOptions);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100042);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_0800
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0800
     * @tc.desc startScan with valid scanFilters and ScanOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合1: 全合法基线 ====================
      let scanFilters_01: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let scanOptions_01: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan ScanResults = %{public}s', JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan address = %{public}s', JSON.stringify(scanRes[0].address));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan rssi = %{public}s', JSON.stringify(scanRes[0].rssi));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan data = %{public}s', JSON.stringify(scanRes[0].data));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceName = %{public}s', JSON.stringify(scanRes[0].deviceName));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan isConnectable = %{public}s', JSON.stringify(scanRes[0].isConnectable));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceClass = %{public}s', JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_01], scanOptions_01);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        await scan.stopScan();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_0900
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0900
     * @tc.desc startScan with address too long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合2: address过长 ====================
      let scanFilters_02: scan.ScanFilters = {
        address: ADDRESS_invailable_1,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let scanOptions_02: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      try {
        await scan.startScan([scanFilters_02], scanOptions_02);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_1000
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1000
     * @tc.desc startScan with invalid address format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合3: address格式错误 ====================
      let scanFilters_03: scan.ScanFilters = {
        address: ADDRESS_invailable_2,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let scanOptions_03: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
      };
      try {
        await scan.startScan([scanFilters_03], scanOptions_03);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_1100
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1100
     * @tc.desc startScan with empty address string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合4: address空串 ====================
      let scanFilters_04: scan.ScanFilters = {
        address: ADDRESS_invailable_3,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let scanOptions_04: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      try {
        await scan.startScan([scanFilters_04], scanOptions_04);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_1200
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1200
     * @tc.desc startScan with deviceName containing space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合5: deviceName含空格(合法) ====================
      let scanFilters_05: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME_vailable_1,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let scanOptions_05: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan ScanResults = %{public}s', JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan address = %{public}s', JSON.stringify(scanRes[0].address));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan rssi = %{public}s', JSON.stringify(scanRes[0].rssi));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan data = %{public}s', JSON.stringify(scanRes[0].data));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceName = %{public}s', JSON.stringify(scanRes[0].deviceName));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan isConnectable = %{public}s', JSON.stringify(scanRes[0].isConnectable));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceClass = %{public}s', JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_05], scanOptions_05);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        await scan.stopScan();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_1300
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1300
     * @tc.desc startScan with empty deviceName string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合6: deviceName空串(非法) ====================
      let scanFilters_06: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME_vailable_2,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let scanOptions_06: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      try {
        await scan.startScan([scanFilters_06], scanOptions_06);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_1400
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1400
     * @tc.desc startScan with rssi boundary lower -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合7: rssi=-128(边界下界) ====================
      let scanFilters_07: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI_vailable_1
      };
      let scanOptions_07: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan ScanResults = %{public}s', JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan address = %{public}s', JSON.stringify(scanRes[0].address));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan rssi = %{public}s', JSON.stringify(scanRes[0].rssi));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan data = %{public}s', JSON.stringify(scanRes[0].data));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceName = %{public}s', JSON.stringify(scanRes[0].deviceName));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan isConnectable = %{public}s', JSON.stringify(scanRes[0].isConnectable));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceClass = %{public}s', JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_07], scanOptions_07);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        await scan.stopScan();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_1500
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1500
     * @tc.desc startScan with rssi boundary upper 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合8: rssi=127(边界上界) ====================
      let scanFilters_08: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI_vailable_2
      };
      let scanOptions_08: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan ScanResults = %{public}s', JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan address = %{public}s', JSON.stringify(scanRes[0].address));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan rssi = %{public}s', JSON.stringify(scanRes[0].rssi));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan data = %{public}s', JSON.stringify(scanRes[0].data));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceName = %{public}s', JSON.stringify(scanRes[0].deviceName));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan isConnectable = %{public}s', JSON.stringify(scanRes[0].isConnectable));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceClass = %{public}s', JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_08], scanOptions_08);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        await scan.stopScan();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_1600
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1600
     * @tc.desc startScan with rssi below lower bound -129
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合9: rssi=-129(越下界) ====================
      let scanFilters_09: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI_invailable_1
      };
      let scanOptions_09: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      try {
        await scan.startScan([scanFilters_09], scanOptions_09);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100040);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_1700
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1700
     * @tc.desc startScan with rssi above upper bound 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合10: rssi=128(越上界) ====================
      let scanFilters_10: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI_invailable_2
      };
      let scanOptions_10: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      try {
        await scan.startScan([scanFilters_10], scanOptions_10);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100040);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_1800
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1800
     * @tc.desc startScan with scanMode LOW_POWER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合11: scanMode=LOW_POWER ====================
      let scanFilters_11: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let scanOptions_11: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_LOW_POWER,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan ScanResults = %{public}s', JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan address = %{public}s', JSON.stringify(scanRes[0].address));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan rssi = %{public}s', JSON.stringify(scanRes[0].rssi));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan data = %{public}s', JSON.stringify(scanRes[0].data));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceName = %{public}s', JSON.stringify(scanRes[0].deviceName));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan isConnectable = %{public}s', JSON.stringify(scanRes[0].isConnectable));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceClass = %{public}s', JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_11], scanOptions_11);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        await scan.stopScan();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_1900
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1900
     * @tc.desc startScan with scanMode LOW_LATENCY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合12: scanMode=LOW_LATENCY ====================
      let scanFilters_12: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let scanOptions_12: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_LOW_LATENCY,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan ScanResults = %{public}s', JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan address = %{public}s', JSON.stringify(scanRes[0].address));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan rssi = %{public}s', JSON.stringify(scanRes[0].rssi));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan data = %{public}s', JSON.stringify(scanRes[0].data));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceName = %{public}s', JSON.stringify(scanRes[0].deviceName));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan isConnectable = %{public}s', JSON.stringify(scanRes[0].isConnectable));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceClass = %{public}s', JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_12], scanOptions_12);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        await scan.stopScan();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_static_2000
     * @tc.number SUB_Communication_XTS_NearLink_Scan_2000
     * @tc.desc startScan with multiple scanFilters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // ==================== 组合13: 多个入参 ====================
      let scanFilters_11: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let scanFilters_12: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let ScanOptions_12: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_LOW_LATENCY,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan ScanResults = %{public}s', JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan address = %{public}s', JSON.stringify(scanRes[0].address));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan rssi = %{public}s', JSON.stringify(scanRes[0].rssi));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan data = %{public}s', JSON.stringify(scanRes[0].data));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceName = %{public}s', JSON.stringify(scanRes[0].deviceName));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan isConnectable = %{public}s', JSON.stringify(scanRes[0].isConnectable));
          hilog.info(0x0000, 'testTag', '[Nearlink Test] scan deviceClass = %{public}s', JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_11, scanFilters_12], ScanOptions_12);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        await scan.stopScan();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] scan 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
  })
}