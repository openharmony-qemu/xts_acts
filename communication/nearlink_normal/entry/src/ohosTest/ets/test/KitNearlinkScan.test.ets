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
import manager from '@ohos.nearlink.manager';
import scan from '@ohos.nearlink.scan';

import { clickRequestPermission } from './ClickRequestPermission';
import { sleep } from './Sleep';
import { openNearLink } from './OpenNearLink';
let TIME_SLEEP = 2000;

let manufacturerDataBuffer = new Uint8Array(4);
manufacturerDataBuffer[0] = 1;
manufacturerDataBuffer[1] = 2;
manufacturerDataBuffer[2] = 3;
manufacturerDataBuffer[3] = 4;
let manufacturerDataMaskBuffer = new Uint8Array(4);
manufacturerDataMaskBuffer[0] = 4;
manufacturerDataMaskBuffer[1] = 6;
manufacturerDataMaskBuffer[2] = 7;
manufacturerDataMaskBuffer[3] = 8;
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
export default function scanTest() {
  describe('scanTest', () => {
    let return_boolean: boolean;
    beforeAll(async (done:Function) => {
      console.info('beforeAll start');
      await clickRequestPermission();
      await sleep(TIME_SLEEP);
      return_boolean = manager.isNearLinkSupported();
      console.info('beforeAll end');
      done();
    })
    beforeEach(async (done:Function) => {
      console.info('beforeEach start');
      await openNearLink();
      console.info('beforeEach end');
      done();
    })
    afterEach(() => {
      console.info('afterEach');
    })
    afterAll(() => {
      console.info('afterAll');
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLink_Scan_Enum_0100
     * @tc.name SUB_Communication_XTS_NearLink_Scan_Enum_0100
     * @tc.desc ScanMode enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Scan_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_Scan_Enum_0100';
        console.info(`${caseName} test start`);
        try {
          let SCAN_MODE_LOW_POWER: scan.ScanMode = scan.ScanMode.SCAN_MODE_LOW_POWER;
          console.info(`${caseName} SCAN_MODE_LOW_POWER result:` + SCAN_MODE_LOW_POWER);
          expect(SCAN_MODE_LOW_POWER).assertEqual(0);
          let SCAN_MODE_BALANCED: scan.ScanMode = scan.ScanMode.SCAN_MODE_BALANCED;
          console.info(`${caseName} SCAN_MODE_BALANCED result:` + SCAN_MODE_BALANCED);
          expect(SCAN_MODE_BALANCED).assertEqual(1);
          let SCAN_MODE_LOW_LATENCY: scan.ScanMode = scan.ScanMode.SCAN_MODE_LOW_LATENCY;
          console.info(`${caseName} SCAN_MODE_LOW_LATENCY result:` + SCAN_MODE_LOW_LATENCY);
          expect(SCAN_MODE_LOW_LATENCY).assertEqual(2);
        } catch (error) {
          console.info(`${caseName} ScanMode error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_ON_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_ON_0100
     * @tc.desc 无法触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_ON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Scan_ON_0100';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: scan.ScanResults[]) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onDeviceFound/offDeviceFound error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_ON_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_ON_0200
     * @tc.desc 无法触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_ON_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Scan_ON_0200';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: scan.ScanResults[]) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        scan.offDeviceFound();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onDeviceFound/offDeviceFound error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_ON_0300
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_ON_0300
     * @tc.desc onDeviceFound input null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_ON_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Scan_ON_0300';
      console.info(`${caseName} test start`);
      try {
        scan.onDeviceFound(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onDeviceFound/offDeviceFound error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_ON_0400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_ON_0400
     * @tc.desc offDeviceFound input null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_ON_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Scan_ON_0400';
      console.info(`${caseName} test start`);
      try {
        scan.offDeviceFound(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onDeviceFound/offDeviceFound error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_ON_0500
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_ON_0500
     * @tc.desc onDeviceFound input undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_ON_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Scan_ON_0500';
      console.info(`${caseName} test start`);
      try {
        scan.onDeviceFound(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onDeviceFound/offDeviceFound error, code is ${error.code},message is ${error.message}` + typeof error.code);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_ON_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_ON_0600
     * @tc.desc offDeviceFound input undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_ON_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Scan_ON_0600';
      console.info(`${caseName} test start`);
      try {
        scan.offDeviceFound(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onDeviceFound/offDeviceFound error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLink_Scan_0100
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0100
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let onReceiveEvent = (scanRes: scan.ScanResults[]) => {
        console.info(`[Nearlink Test] result = ` + JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          console.info('[Nearlink Test] scan address = ' + JSON.stringify(scanRes[0].address));
          console.info('[Nearlink Test] scan rssi = ' + JSON.stringify(scanRes[0].rssi));
          console.info('[Nearlink Test] scan data = ' + JSON.stringify(scanRes[0].data));
          console.info('[Nearlink Test] scan deviceName = ' + JSON.stringify(scanRes[0].deviceName));
          console.info('[Nearlink Test] scan isConnectable = ' + JSON.stringify(scanRes[0].isConnectable));
          console.info('[Nearlink Test] scan deviceClass = ' + JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        console.info('[Nearlink Test] onDeviceFound success');
        await scan.startScan(null);
        console.info('[Nearlink Test] startScan promise success');
        await sleep(1000);
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        scan.offDeviceFound();
        console.info('[Nearlink Test] offDeviceFound success');
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_0200
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0200
     * @tc.desc startScan with undefined parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try {
        await scan.startScan(undefined);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] scan 0200 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_0300
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0300
     * @tc.desc startScan with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try {
        await scan.startScan([]);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] scan 0300 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100042);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_0400
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0400
     * @tc.desc startScan with null filters and null options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let onReceiveEvent = (scanRes: scan.ScanResults[]) => {
        console.info(`[Nearlink Test] result = ` + JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          console.info('[Nearlink Test] scan address = ' + JSON.stringify(scanRes[0].address));
          console.info('[Nearlink Test] scan rssi = ' + JSON.stringify(scanRes[0].rssi));
          console.info('[Nearlink Test] scan data = ' + JSON.stringify(scanRes[0].data));
          console.info('[Nearlink Test] scan deviceName = ' + JSON.stringify(scanRes[0].deviceName));
          console.info('[Nearlink Test] scan isConnectable = ' + JSON.stringify(scanRes[0].isConnectable));
          console.info('[Nearlink Test] scan deviceClass = ' + JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        console.info('[Nearlink Test] onDeviceFound success');
        await scan.startScan(null, null);
        console.info('[Nearlink Test] startScan promise success');
        await sleep(1000);
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        scan.offDeviceFound();
        console.info('[Nearlink Test] offDeviceFound success');
      } catch (error) {
        console.info("[Nearlink Test] scan 0400 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_0500
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0500
     * @tc.desc startScan with null filters and undefined options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let onReceiveEvent = (scanRes: scan.ScanResults[]) => {
        console.info(`[Nearlink Test] result = ` + JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          console.info('[Nearlink Test] scan address = ' + JSON.stringify(scanRes[0].address));
          console.info('[Nearlink Test] scan rssi = ' + JSON.stringify(scanRes[0].rssi));
          console.info('[Nearlink Test] scan data = ' + JSON.stringify(scanRes[0].data));
          console.info('[Nearlink Test] scan deviceName = ' + JSON.stringify(scanRes[0].deviceName));
          console.info('[Nearlink Test] scan isConnectable = ' + JSON.stringify(scanRes[0].isConnectable));
          console.info('[Nearlink Test] scan deviceClass = ' + JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        console.info('[Nearlink Test] onDeviceFound success');
        await scan.startScan(null, undefined);
        console.info('[Nearlink Test] startScan promise success');
        await sleep(1000);
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        scan.offDeviceFound();
        console.info('[Nearlink Test] offDeviceFound success');
      } catch (error) {
        console.info("[Nearlink Test] scan 0500 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_0600
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0600
     * @tc.desc startScan with scanFilters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let scanFilters: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        console.info('[Nearlink Test] scan ScanResults = ' + JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          console.info('[Nearlink Test] scan address = ' + JSON.stringify(scanRes[0].address));
          console.info('[Nearlink Test] scan rssi = ' + JSON.stringify(scanRes[0].rssi));
          console.info('[Nearlink Test] scan data = ' + JSON.stringify(scanRes[0].data));
          console.info('[Nearlink Test] scan deviceName = ' + JSON.stringify(scanRes[0].deviceName));
          console.info('[Nearlink Test] scan isConnectable = ' + JSON.stringify(scanRes[0].isConnectable));
          console.info('[Nearlink Test] scan deviceClass = ' + JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters]);
        console.info('[Nearlink Test] startScan promise success');
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_0700
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0700
     * @tc.desc startScan with empty scanFilters and empty ScanOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合0: 非法基线 ====================
      let scanFilters: scan.ScanFilters = {
      };
      let ScanOptions: scan.ScanOptions = {
      };
      try {
        await scan.startScan([scanFilters], ScanOptions);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100042);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_0800
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0800
     * @tc.desc startScan with valid scanFilters and ScanOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合1: 全合法基线 ====================
      let scanFilters_01: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let ScanOptions_01: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        console.info('[Nearlink Test] scan ScanResults = ' + JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          console.info('[Nearlink Test] scan address = ' + JSON.stringify(scanRes[0].address));
          console.info('[Nearlink Test] scan rssi = ' + JSON.stringify(scanRes[0].rssi));
          console.info('[Nearlink Test] scan data = ' + JSON.stringify(scanRes[0].data));
          console.info('[Nearlink Test] scan deviceName = ' + JSON.stringify(scanRes[0].deviceName));
          console.info('[Nearlink Test] scan isConnectable = ' + JSON.stringify(scanRes[0].isConnectable));
          console.info('[Nearlink Test] scan deviceClass = ' + JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_01], ScanOptions_01);
        console.info('[Nearlink Test] startScan promise success');
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_0900
     * @tc.number SUB_Communication_XTS_NearLink_Scan_0900
     * @tc.desc startScan with address too long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合2: address过长 ====================
      let scanFilters_02: scan.ScanFilters = {
        address: ADDRESS_invailable_1,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let ScanOptions_02: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      try {
        await scan.startScan([scanFilters_02], ScanOptions_02);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_1000
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1000
     * @tc.desc startScan with invalid address format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合3: address格式错误 ====================
      let scanFilters_03: scan.ScanFilters = {
        address: ADDRESS_invailable_2,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let ScanOptions_03: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
      };
      try {
        await scan.startScan([scanFilters_03], ScanOptions_03);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_1100
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1100
     * @tc.desc startScan with empty address string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合4: address空串 ====================
      let scanFilters_04: scan.ScanFilters = {
        address: ADDRESS_invailable_3,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let ScanOptions_04: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      try {
        await scan.startScan([scanFilters_04], ScanOptions_04);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_1200
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1200
     * @tc.desc startScan with deviceName containing space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合5: deviceName含空格(合法) ====================
      let scanFilters_05: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME_vailable_1,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let ScanOptions_05: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        console.info('[Nearlink Test] scan ScanResults = ' + JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          console.info('[Nearlink Test] scan address = ' + JSON.stringify(scanRes[0].address));
          console.info('[Nearlink Test] scan rssi = ' + JSON.stringify(scanRes[0].rssi));
          console.info('[Nearlink Test] scan data = ' + JSON.stringify(scanRes[0].data));
          console.info('[Nearlink Test] scan deviceName = ' + JSON.stringify(scanRes[0].deviceName));
          console.info('[Nearlink Test] scan isConnectable = ' + JSON.stringify(scanRes[0].isConnectable));
          console.info('[Nearlink Test] scan deviceClass = ' + JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_05], ScanOptions_05);
        console.info('[Nearlink Test] startScan promise success');
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_1300
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1300
     * @tc.desc startScan with empty deviceName string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合6: deviceName空串(非法) ====================
      let scanFilters_06: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME_vailable_2,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let ScanOptions_06: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      try {
        await scan.startScan([scanFilters_06], ScanOptions_06);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_1400
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1400
     * @tc.desc startScan with rssi boundary lower -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合7: rssi=-128(边界下界) ====================
      let scanFilters_07: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI_vailable_1
      };
      let ScanOptions_07: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        console.info('[Nearlink Test] scan ScanResults = ' + JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          console.info('[Nearlink Test] scan address = ' + JSON.stringify(scanRes[0].address));
          console.info('[Nearlink Test] scan rssi = ' + JSON.stringify(scanRes[0].rssi));
          console.info('[Nearlink Test] scan data = ' + JSON.stringify(scanRes[0].data));
          console.info('[Nearlink Test] scan deviceName = ' + JSON.stringify(scanRes[0].deviceName));
          console.info('[Nearlink Test] scan isConnectable = ' + JSON.stringify(scanRes[0].isConnectable));
          console.info('[Nearlink Test] scan deviceClass = ' + JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_07], ScanOptions_07);
        console.info('[Nearlink Test] startScan promise success');
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_1500
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1500
     * @tc.desc startScan with rssi boundary upper 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合8: rssi=127(边界上界) ====================
      let scanFilters_08: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI_vailable_2
      };
      let ScanOptions_08: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        console.info('[Nearlink Test] scan ScanResults = ' + JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          console.info('[Nearlink Test] scan address = ' + JSON.stringify(scanRes[0].address));
          console.info('[Nearlink Test] scan rssi = ' + JSON.stringify(scanRes[0].rssi));
          console.info('[Nearlink Test] scan data = ' + JSON.stringify(scanRes[0].data));
          console.info('[Nearlink Test] scan deviceName = ' + JSON.stringify(scanRes[0].deviceName));
          console.info('[Nearlink Test] scan isConnectable = ' + JSON.stringify(scanRes[0].isConnectable));
          console.info('[Nearlink Test] scan deviceClass = ' + JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_08], ScanOptions_08);
        console.info('[Nearlink Test] startScan promise success');
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_1600
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1600
     * @tc.desc startScan with rssi below lower bound -129
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合9: rssi=-129(越下界) ====================
      let scanFilters_09: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI_invailable_1
      };
      let ScanOptions_09: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      try {
        await scan.startScan([scanFilters_09], ScanOptions_09);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100040);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_1700
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1700
     * @tc.desc startScan with rssi above upper bound 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合10: rssi=128(越上界) ====================
      let scanFilters_10: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI_invailable_2
      };
      let ScanOptions_10: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_BALANCED,
        duration: 10
      };
      try {
        await scan.startScan([scanFilters_10], ScanOptions_10);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100040);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_1800
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1800
     * @tc.desc startScan with scanMode LOW_POWER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合11: scanMode=LOW_POWER ====================
      let scanFilters_11: scan.ScanFilters = {
        address: ADDRESS,
        deviceName: NAME,
        manufacturerId: SERVICE_UUID,
        manufacturerData: manufacturerDataBuffer.buffer,
        manufacturerDataMask: manufacturerDataMaskBuffer.buffer,
        rssi: RSSI
      };
      let ScanOptions_11: scan.ScanOptions = {
        scanMode: scan.ScanMode.SCAN_MODE_LOW_POWER,
        duration: 10
      };
      let onReceiveEvent:(scanRes: scan.ScanResults[]) => void = (scanRes: scan.ScanResults[]) => {
        console.info('[Nearlink Test] scan ScanResults = ' + JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          console.info('[Nearlink Test] scan address = ' + JSON.stringify(scanRes[0].address));
          console.info('[Nearlink Test] scan rssi = ' + JSON.stringify(scanRes[0].rssi));
          console.info('[Nearlink Test] scan data = ' + JSON.stringify(scanRes[0].data));
          console.info('[Nearlink Test] scan deviceName = ' + JSON.stringify(scanRes[0].deviceName));
          console.info('[Nearlink Test] scan isConnectable = ' + JSON.stringify(scanRes[0].isConnectable));
          console.info('[Nearlink Test] scan deviceClass = ' + JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_11], ScanOptions_11);
        console.info('[Nearlink Test] startScan promise success');
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_1900
     * @tc.number SUB_Communication_XTS_NearLink_Scan_1900
     * @tc.desc startScan with scanMode LOW_LATENCY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      // ==================== 组合12: scanMode=LOW_LATENCY ====================
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
        console.info('[Nearlink Test] scan ScanResults = ' + JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          console.info('[Nearlink Test] scan address = ' + JSON.stringify(scanRes[0].address));
          console.info('[Nearlink Test] scan rssi = ' + JSON.stringify(scanRes[0].rssi));
          console.info('[Nearlink Test] scan data = ' + JSON.stringify(scanRes[0].data));
          console.info('[Nearlink Test] scan deviceName = ' + JSON.stringify(scanRes[0].deviceName));
          console.info('[Nearlink Test] scan isConnectable = ' + JSON.stringify(scanRes[0].isConnectable));
          console.info('[Nearlink Test] scan deviceClass = ' + JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_12], ScanOptions_12);
        console.info('[Nearlink Test] startScan promise success');
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Scan_2000
     * @tc.number SUB_Communication_XTS_NearLink_Scan_2000
     * @tc.desc startScan with multiple scanFilters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Scan_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
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
        console.info('[Nearlink Test] scan ScanResults = ' + JSON.stringify(scanRes));
        if (scanRes.length > 0) {
          console.info('[Nearlink Test] scan address = ' + JSON.stringify(scanRes[0].address));
          console.info('[Nearlink Test] scan rssi = ' + JSON.stringify(scanRes[0].rssi));
          console.info('[Nearlink Test] scan data = ' + JSON.stringify(scanRes[0].data));
          console.info('[Nearlink Test] scan deviceName = ' + JSON.stringify(scanRes[0].deviceName));
          console.info('[Nearlink Test] scan isConnectable = ' + JSON.stringify(scanRes[0].isConnectable));
          console.info('[Nearlink Test] scan deviceClass = ' + JSON.stringify(scanRes[0].deviceClass));
          expect(scanRes.length > 0).assertTrue();
        } else {
          expect(scanRes.length === 0).assertTrue();
        }
      }
      try {
        scan.onDeviceFound(onReceiveEvent);
        await scan.startScan([scanFilters_11, scanFilters_12], ScanOptions_12);
        console.info('[Nearlink Test] startScan promise success');
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        scan.offDeviceFound(onReceiveEvent);
      } catch (error) {
        console.info("[Nearlink Test] scan 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
  })
}