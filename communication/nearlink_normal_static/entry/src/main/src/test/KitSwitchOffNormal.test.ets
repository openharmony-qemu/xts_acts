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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import manager from '@ohos.nearlink.manager';
import ssap from '@ohos.nearlink.ssap';
import advertising from '@ohos.nearlink.advertising';
import dataTransfer from '@ohos.nearlink.dataTransfer';
import scan from '@ohos.nearlink.scan';
import Utils from './Util.test';
import hilog from '@ohos.hilog';


export default function nearlinkswitchoffNormalTest(): void {
  describe('nearlinkswitchoffNormalTest', () => {
    let ssapClient :ssap.Client;
    let ssapServer :ssap.Server;
    let ADDRESS = "22:33:44:55:66:77"
    let TIME_SLEEP = 2000;
    let UUID = "FFFFFFFF-1234-5678-ABCD-000000001234";
    let return_boolean: boolean;
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll start');

      await Utils.msSleep(TIME_SLEEP);
      await Utils.clickRequestPermission("辅助包执行");
      return_boolean = manager.isNearLinkSupported();
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll end');
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach start');
      await Utils.closeNearLink();
      try {
        let state: manager.NearlinkState = manager.getState();
        hilog.info(0x0000, 'state', '%{public}s', "state status:" + state);
      } catch (error) {
        hilog.info(0x0000, 'state', '%{public}s', "state status error:" + JSON.stringify(error.code), JSON.stringify(error.message));
      }
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach end');
      done();
    })
    afterEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach');
    })
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach start');
      await Utils.openNearLink();
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach end');
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_static_0100
     * @tc.desc startAdvertising
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startAdvertising promise result out:');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_static_0200
     * @tc.desc stopAdvertising
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_SwitchOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await advertising.stopAdvertising(0);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startAdvertising promise result out:');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_static_0100
     * @tc.desc getLocalName in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let result: string = manager.getLocalName();
        hilog.info(0x0000, 'testTag', '%{public}s getLocalName:%{public}s', caseName, result);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s getLocalName error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s api is not support', caseName);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_static_0200
     * @tc.desc getPairedDevices in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_SwitchOff_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let result = manager.getPairedDevices();
        hilog.info(0x0000, 'testTag', '%{public}s getPairedDevices:%{public}s', caseName, JSON.stringify(result));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s getPairedDevices error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s api is not support', caseName);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_static_0100
     * @tc.desc startScan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TEST_ALIAS: string = 'nearLinkTest';
      let SERVICE_UUID = 4567;

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
      let scanFilters: scan.ScanFilters = {
        address:ADDRESS,
        deviceName:TEST_ALIAS,
        manufacturerId:SERVICE_UUID,
        manufacturerData:manufacturerDataBuffer.buffer,
        manufacturerDataMask:manufacturerDataMaskBuffer.buffer
      };
      let scanOptions: scan.ScanOptions = {
        scanMode:scan.ScanMode.SCAN_MODE_BALANCED
      };
      try {
        await scan.startScan([scanFilters], scanOptions);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_static_0200
     * @tc.desc startScan input null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await scan.startScan(null);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] startScan promise success');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_static_0300
     * @tc.desc stopScan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Scan_SwitchOff_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await scan.stopScan();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopScan promise success');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0100
     * @tc.desc createPort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        dataTransfer.createPort(UUID);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] createPort success ');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0200
     * @tc.desc destroyPort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        dataTransfer.destroyPort(UUID);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] destroyPort success ');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0300
     * @tc.desc connect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let params: dataTransfer.ConnectionParams = {
          address:ADDRESS,
          uuid:UUID,
          transferMode:dataTransfer.TransferMode.RELIABLE
        }
        await dataTransfer.connect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] connect success ');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0400
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0400
     * @tc.desc disconnect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let params: dataTransfer.ConnectionParams = {
          address:ADDRESS,
          uuid:UUID,
          transferMode:dataTransfer.TransferMode.RELIABLE
        }
        await dataTransfer.disconnect(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] disconnect success ');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0500
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0500
     * @tc.desc writeData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let manufacturerDataBufferTemp = new ArrayBuffer(4);
        let manufacturerDataBuffer = new DataView(manufacturerDataBufferTemp);
        manufacturerDataBuffer.setUint8(0, 1);
        manufacturerDataBuffer.setUint8(1, 2);
        manufacturerDataBuffer.setUint8(2, 3);
        manufacturerDataBuffer.setUint8(3, 4);

        let params: dataTransfer.DataParams = {
          address:ADDRESS,
          uuid:UUID,
          data:manufacturerDataBuffer.buffer
        }
        await dataTransfer.writeData(params);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] writeData success ');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_0600
     * @tc.name SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0600
     * @tc.desc getConnectionState
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_DataTransfer_SwitchOff_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let ConnStateParams: dataTransfer.ConnectionStateParams = {address:ADDRESS, uuid:UUID}
        dataTransfer.getConnectionState(ConnStateParams);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] getConnectionState success ');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_Normal_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_Normal_static_0200
     * @tc.desc createServer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_Normal_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        ssapServer = ssap.createServer();
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] createServer = ' + JSON.stringify(ssapServer));
        expect().assertFail();
      }catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] fail %s %s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_Normal_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0100
     * @tc.desc getConnectionState
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        ssapClient = ssap.createClient(ADDRESS);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] createClient success ');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[NearLink Test] fail %{public}s%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      done();
    })

  })
}