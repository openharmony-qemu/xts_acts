/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import manager from '@ohos.nearlink.manager';
import ssap from '@ohos.nearlink.ssap';
import scan from '@ohos.nearlink.scan';
import advertising from '@ohos.nearlink.advertising';
import dataTransfer from '@ohos.nearlink.dataTransfer';
import cdsm from '@ohos.nearlink.cdsm';
export default function nearLinkErrCode201Test() {
  let ssapClient :ssap.Client;
  let ssapServer :ssap.Server;
  let ADDRESS = "22:33:44:55:66:77"
  let UUID = "FFFFFFFF-1234-5678-ABCD-000000001234";
  describe('nearLinkErrCode201Test', () => {
    let return_boolean: boolean
    beforeAll(() => {
      console.info('beforeAll start');
      try{
        return_boolean = manager.isNearLinkSupported();
        console.info('[Nearlink Test] beforeAll isNearLinkSupported ' + return_boolean);
      }catch(err){
        console.info('[Nearlink Test] beforeAll isNearLinkSupported ' + err.code + err.message);
        expect().assertFail();
      }
      console.info('beforeAll end');
    })
    beforeEach(() => {
      console.info('beforeEach');
    })
    afterEach(() => {
      console.info('afterEach');
    })
    afterAll(() => {
      console.info('afterAll');
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_Nop_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_Nop_0100
     * @tc.desc stopAdvertising接口入参依赖starAdvertising返回值，无法覆盖201错误码
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_Nop_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let advertisingSettings: advertising.AdvertisingSettings = {
        };
        let advertisingData: advertising.AdvertisingData = {
        };
        let advertisingParams: advertising.AdvertisingParams = {
          advertisingSettings: advertisingSettings,
          advertisingData: advertisingData
        }
        await advertising.startAdvertising(advertisingParams);
        console.info('[Nearlink Test] startAdvertising promise result out:');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(return_boolean == false).assertTrue();
        } else {
          expect(return_boolean == true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Cdsm_Nop_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Cdsm_Nop_0100
     * @tc.desc createCdsmClient 201 API24
     */
    it('SUB_Communication_XTS_NearLinkPub_Cdsm_Nop_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Cdsm_Nop_0100';
      console.info(`${caseName} test start`);
      try {
        let cdsmClient: cdsm.CdsmClient;
        cdsmClient = cdsm.createCdsmClient(ADDRESS);
        console.info('[Nearlink Test] createRemoteDevice result:' + cdsmClient);
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean == false).assertTrue();
        } else if(error.code == 36100050) {
          console.info(`该设备不支持星闪音频--合作集`);
          expect(error.code).assertEqual(36100050);
        } else {
          expect(error.code).assertEqual(201);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_Nop_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_Nop_0100
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_Nop_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let devices = manager.getPairedDevices();
        console.info('[NearLink Test]  getPairedDevices = ' + JSON.stringify(devices));
        expect().assertFail();
      }catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(return_boolean == false).assertTrue();
        } else {
          expect(return_boolean == true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_Nop_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_Nop_0200
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_Nop_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let name = manager.getLocalName();
        console.info('[NearLink Test]  getLocalName = ' + JSON.stringify(name));
        expect().assertFail();
      }catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(return_boolean == false).assertTrue();
        } else {
          expect(return_boolean == true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_Nop_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_Nop_0100
     * @tc.desc startScan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_Nop_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TEST_ALIAS: string = 'nearLinkTest';
      let SERVICE_UUID = 4567;
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
      let scanFilters: scan.ScanFilters = {
        address:ADDRESS,
        deviceName:TEST_ALIAS,
        manufacturerId:SERVICE_UUID,
        manufacturerData:manufacturerDataBuffer.buffer,
        manufacturerDataMask:manufacturerDataMaskBuffer.buffer
      };
      let ScanOptions: scan.ScanOptions = {
        scanMode:scan.ScanMode.SCAN_MODE_BALANCED
      };
      try {
        await scan.startScan([scanFilters], ScanOptions);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(return_boolean == false).assertTrue();
        } else {
          expect(return_boolean == true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_Nop_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_Nop_0200
     * @tc.desc startScan input null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_Nop_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await scan.startScan(null);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(return_boolean == false).assertTrue();
        } else {
          expect(return_boolean == true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_Nop_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_Nop_0300
     * @tc.desc stopScan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_Nop_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(return_boolean == false).assertTrue();
        } else {
          expect(return_boolean == true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Nop_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Nop_0100
     * @tc.desc createClient
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Nop_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        ssapClient = ssap.createClient(ADDRESS);
        console.info('[NearLink Test]  createClient = ' + JSON.stringify(ssapClient));
        expect().assertFail();
      }catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(return_boolean == false).assertTrue();
        } else {
          expect(return_boolean == true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Nop_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Nop_0200
     * @tc.desc createServer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Nop_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        ssapServer = ssap.createServer();
        console.info('[NearLink Test] createServer = ' + JSON.stringify(ssapServer));
        expect().assertFail();
      }catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(return_boolean == false).assertTrue();
        } else {
          expect(return_boolean == true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_0100
     * @tc.desc createPort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataTransfer.createPort(UUID);
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(return_boolean == false).assertTrue();
        } else {
          expect(return_boolean == true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    });
  })
}