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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import manager from '@ohos.nearlink.manager';
import ssap from '@ohos.nearlink.ssap';
import advertising from '@ohos.nearlink.advertising';
import dataTransfer from '@ohos.nearlink.dataTransfer';
import scan from '@ohos.nearlink.scan';
import { clickRequestPermission } from './ClickRequestPermission';
import { sleep } from './Sleep';
import {clickCloseNearLinkSwitch,clickOpenNearLinkSwitch} from './Tools';

export default function nearlinkswitchoffNormalTest() {
  describe('nearlinkswitchoffNormalTest', () => {
    let ssapClient :ssap.Client;
    let ssapServer :ssap.Server;
    let ADDRESS = "22:33:44:55:66:77"
    let TIME_SLEEP = 2000;
    let UUID = "FFFFFFFF-1234-5678-ABCD-000000001234";
    let return_boolean: boolean;
    beforeAll(async (done: Function) => {
      console.info('beforeAll start');
      await sleep(TIME_SLEEP);
      await clickRequestPermission("辅助包执行");
      return_boolean = manager.isNearLinkSupported();
      console.info('beforeAll end');
      done();
    })
    beforeEach(async (done: Function) => {
      console.info('beforeEach start');
      await clickCloseNearLinkSwitch();
      console.info('beforeEach end');
      done();
    })
    afterEach(() => {
      console.info('afterEach');
    })
    afterAll(async (done: Function) => {
      console.info('beforeEach start');
      await clickOpenNearLinkSwitch();
      console.info('beforeEach end');
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_0100
     * @tc.desc startAdvertising
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_0200
     * @tc.desc stopAdvertising
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await advertising.stopAdvertising(0);
        console.info('[Nearlink Test] startAdvertising promise result out:');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_0100
     * @tc.desc getLocalName in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_0100';
      console.info(`${caseName} test start`);
      try {
        let result: string = manager.getLocalName();
        console.info(`${caseName} getLocalName:` + result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} getLocalName error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_0200
     * @tc.desc getPairedDevices in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_0200';
      console.info(`${caseName} test start`);
      try {
        let result = manager.getPairedDevices();
        console.info(`${caseName} getPairedDevices:` + JSON.stringify(result));
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} getPairedDevices error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0100
     * @tc.desc startScan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0200
     * @tc.desc startScan input null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await scan.startScan(null);
        console.info('[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0300
     * @tc.desc stopScan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await scan.stopScan();
        console.info('[Nearlink Test] stopScan promise success');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0100
     * @tc.desc createPort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataTransfer.createPort(UUID);
        console.info('[NearLink Test] createPort success ');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0200
     * @tc.desc destroyPort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataTransfer.destroyPort(UUID);
        console.info('[NearLink Test] destroyPort success ');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0300
     * @tc.desc connect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let params: dataTransfer.ConnectionParams = {
          address:ADDRESS,
          uuid:UUID,
          transferMode:dataTransfer.TransferMode.RELIABLE
        }
        await dataTransfer.connect(params);
        console.info('[NearLink Test] connect success ');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0400
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0400
     * @tc.desc disconnect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let params: dataTransfer.ConnectionParams = {
          address:ADDRESS,
          uuid:UUID,
          transferMode:dataTransfer.TransferMode.RELIABLE
        }
        await dataTransfer.disconnect(params);
        console.info('[NearLink Test] disconnect success ');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0500
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0500
     * @tc.desc writeData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let manufacturerDataBuffer = new Uint8Array(4);
        manufacturerDataBuffer[0] = 1;
        manufacturerDataBuffer[1] = 2;
        manufacturerDataBuffer[2] = 3;
        manufacturerDataBuffer[3] = 4;

        let params: dataTransfer.DataParams = {
          address:ADDRESS,
          uuid:UUID,
          data:manufacturerDataBuffer.buffer
        }
        await dataTransfer.writeData(params);
        console.info('[NearLink Test] writeData success ');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0600
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0600
     * @tc.desc getConnectionState
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let ConnStateParams: dataTransfer.ConnectionParams = {address:ADDRESS, uuid:UUID}
        dataTransfer.getConnectionState(ConnStateParams);
        console.info('[NearLink Test] getConnectionState success ');
        expect().assertFail();
      } catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0100
     * @tc.desc createClient
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        ssapClient = ssap.createClient(ADDRESS);
        console.info('[NearLink Test]  createClient = ' + JSON.stringify(ssapClient));
        expect().assertFail();
      }catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0200
     * @tc.desc createServer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        ssapServer = ssap.createServer();
        console.info('[NearLink Test] createServer = ' + JSON.stringify(ssapServer));
        expect().assertFail();
      }catch (error) {
        console.info('[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });

  })
}