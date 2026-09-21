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
import Utils from './Util.test';
import ssap from '@ohos.nearlink.ssap';
import remoteDevice from '@ohos.nearlink.remoteDevice';
import manager from '@ohos.nearlink.manager';
import nearlinkConstant from '@ohos.nearlink.constant';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function nearlinkswitchoffTest(): void {
  describe('nearlinkswitchoffTest', () => {
    let RemoteD: remoteDevice.RemoteDevice | undefined = undefined;
    let TIME_SLEEP = 2000;
    let return_boolean: boolean;
    let ssapClient :ssap.Client | undefined = undefined;
    let ssapServer :ssap.Server | undefined = undefined;
    let ADDRESS = "22:33:44:55:66:77"
    let propertyDescriptors :Array<ssap.PropertyDescriptor>=[];
    let bufferDesc = new ArrayBuffer(8);
    let descV = new DataView(bufferDesc);
    descV.setUint8(0, 11);
    let propertyDescriptor :ssap.PropertyDescriptor = {
      serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
      propertyUuid: '00001820-0000-1000-8000-00805F9B34FB',
      value: bufferDesc,
      descriptorType: ssap.PropertyDescriptorType.PROPERTY,
      isWriteable: true,
    };
    propertyDescriptors.push(propertyDescriptor);
    let properties:Array<ssap.Property>=[];
    let bufferCCC = new ArrayBuffer(8);
    let cccV = new DataView(bufferCCC);
    cccV.setUint8(0, 1);
    let property :ssap.Property = {
      serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
      propertyUuid: '00001820-0000-1000-8000-00805F9B34FB',
      value: bufferCCC,
      descriptors: propertyDescriptors,
      operation: 0,
    };
    properties.push(property);
    let service :ssap.Service= {
      serviceUuid:'00001810-0000-1000-8000-00805F9B34FB',
      properties:properties,
    }
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll start');
      await Utils.clickRequestPermission("辅助包执行");
      await Utils.msSleep(TIME_SLEEP);
      return_boolean = manager.isNearLinkSupported();
      try {
        RemoteD = remoteDevice.createRemoteDevice(ADDRESS);
        hilog.info(0x0000, 'testTag', '[nearLink_Test] createRemoteDevice result:%{public}s', RemoteD);
        expect(RemoteD !== null).assertTrue();
        ssapClient = ssap.createClient(ADDRESS);
        hilog.info(0x0000, 'testTag', '[nearLink_Test] ssap client info: %{public}s', ssapClient);
        expect(ssapClient !== null).assertTrue();
        ssapServer = ssap.createServer();
        hilog.info(0x0000, 'testTag', '[nearLink_Test] ssap client info: %{public}s', ssapServer);
        expect(ssapServer !== null).assertTrue();
      } catch (err) {
        hilog.error(0x0000, 'testTag', '[nearLink_Test]errCode: %{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, 'beforeAll end');
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach start');
      await Utils.closeNearLink();
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0100
     * @tc.desc RemoteDevice.startPairing in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        await RemoteD!.startPairing();
        hilog.info(0x0000, 'testTag', '%{public}s startPairing success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s startPairing error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0200
     * @tc.desc RemoteDevice.getPairingState in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let result: number = RemoteD!.getPairingState();
        hilog.info(0x0000, 'testTag', '%{public}s getPairingState:%{public}s', caseName, result);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s getPairingState error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0300
     * @tc.desc RemoteDevice.getDeviceName in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0300';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let result: string = RemoteD!.getDeviceName();
        hilog.info(0x0000, 'testTag', '%{public}s getDeviceName:%{public}s', caseName, result);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s getDeviceName error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0400
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0400
     * @tc.desc RemoteDevice.getDeviceClass in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0400';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let result: number = RemoteD!.getDeviceClass();
        hilog.info(0x0000, 'testTag', '%{public}s getDeviceClass:%{public}s', caseName, result);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s getDeviceClass error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0500
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0500
     * @tc.desc RemoteDevice.getConnectionState in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0500';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let result: number = RemoteD!.getConnectionState();
        hilog.info(0x0000, 'testTag', '%{public}s getConnectionState:%{public}s', caseName, result);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s getConnectionState error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0600
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0600
     * @tc.desc RemoteDevice.getAcbState in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0600';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let result: number = RemoteD!.getAcbState();
        hilog.info(0x0000, 'testTag', '%{public}s getAcbState:%{public}s', caseName, result);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s getAcbState error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0700
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0700
     * @tc.desc RemoteDevice.getDeviceInformation in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0700';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let result: remoteDevice.DeviceInformation = RemoteD!.getDeviceInformation();
        hilog.info(0x0000, 'testTag', '%{public}s getDeviceInformation:%{public}s', caseName, result);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s getDeviceInformation error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0800
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0800
     * @tc.desc RemoteDevice.getRssiValue in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0800';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let result: number = await RemoteD!.getRssiValue();
        hilog.info(0x0000, 'testTag', '%{public}s getRssiValue:%{public}s', caseName, result);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s getRssiValue error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0900
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0900
     * @tc.desc RemoteDevice.setConnectionInterval in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_static_0900';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        RemoteD!.setConnectionInterval(nearlinkConstant.ConnectionInterval.LOW_SPEED_INTERVAL_150);
        hilog.info(0x0000, 'testTag', '%{public}s setConnectionInterval success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s setConnectionInterval error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_Create_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0100
     * @tc.desc connect in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        await ssapClient!.connect();
        hilog.info(0x0000, 'testTag', '%{public}s ssap client connect success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s setConnectionInterval error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_Create_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0200
     * @tc.desc ssapClient.disconnect in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        await ssapClient!.disconnect();
        hilog.info(0x0000, 'testTag', '%{public}s ssap client disconnect success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s ssapClient.disconnect error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_Create_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0300
     * @tc.desc ssapClient.close in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0300';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        ssapClient!.close();
        hilog.info(0x0000, 'testTag', '%{public}s ssap client close success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s ssapClient.close error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0400
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0400
     * @tc.desc ssapClient.getServices in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0400';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let services = await ssapClient!.getServices();
        hilog.info(0x0000, 'testTag', '%{public}s ssap client getServices success: %{public}s', caseName, JSON.stringify(services));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s ssapClient.getServices error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0500
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0500
     * @tc.desc ssapClient.readProperty in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0500';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let value = await ssapClient!.readProperty(property);
        hilog.info(0x0000, 'testTag', '%{public}s ssap client readProperty success: %{public}s', caseName, JSON.stringify(value));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s ssapClient.readProperty error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0600
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0600
     * @tc.desc ssapClient.writeProperty in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0600';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        await ssapClient!.writeProperty(property, ssap.PropertyWriteType.WRITE);
        hilog.info(0x0000, 'testTag', '%{public}s ssap client writeProperty success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s ssapClient.writeProperty error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0700
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0700
     * @tc.desc ssapClient.setPropertyNotification in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0700';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let propertyDescriptors :Array<ssap.PropertyDescriptor>=[];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new DataView(bufferDesc);
        descV.setUint8(0, 11)
        let propertyDescriptor :ssap.PropertyDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          propertyUuid: '00001820-0000-1000-8000-00805F9B34FB',
          value: bufferDesc,
          descriptorType: ssap.PropertyDescriptorType.PROPERTY,
          isWriteable: true,
        };
        propertyDescriptors.push(propertyDescriptor);

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new DataView(bufferCCC);
        cccV.setUint8(0, 1);
        let property :ssap.Property = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          propertyUuid: '00001820-0000-1000-8000-00805F9B34FB',
          value: bufferCCC,
          descriptors: propertyDescriptors,
          operation: 0,
        };
        await ssapClient!.setPropertyNotification(property,true);
        hilog.info(0x0000, 'testTag', '%{public}s ssap client setPropertyNotification success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s ssapClient.setPropertyNotification error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0900
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0900
     * @tc.desc ssapClient.requestMtuSize in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_0900';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        await ssapClient!.requestMtuSize(512);
        hilog.info(0x0000, 'testTag', '%{public}s ssap client requestMtuSize success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s ssapClient.requestMtuSize error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1000
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1000
     * @tc.desc ssapServer!.addService in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1000';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        ssapServer!.addService(service);
        hilog.info(0x0000, 'testTag', '%{public}s ssap server addService success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s ssapServer.addService error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1100
     * @tc.desc ssapServer.removeService in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        ssapServer!.removeService('FFFFFFFF-1234-5678-ABCD-000000001234');
        hilog.info(0x0000, 'testTag', '%{public}s ssap server removeService success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s ssapServer.removeService error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1200
     * @tc.desc ssapServer.close in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        ssapServer!.close();
        hilog.info(0x0000, 'testTag', '%{public}s ssap server close success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s ssapServer.close error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1300
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1300
     * @tc.desc ssapServer.notifyPropertyChanged in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1300';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        await ssapServer!.notifyPropertyChanged(ADDRESS, property);
        hilog.info(0x0000, 'testTag', '%{public}s ssap server notifyPropertyChanged success', caseName);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s ssapServer.notifyPropertyChanged error.code: %{public}s, errMessage: %{public}s', caseName, error.code, error.message);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1400
     * @tc.desc ssap server sendResponse test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void>  => {
      let serverResponse:ssap.ServerResponse= {
        address:"11:22:33:44:55:66",
        requestId:0,
        value:bufferCCC,
      };
      try {
        ssapServer!.sendResponse(serverResponse);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] sendResponse success');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink_test] sendResponse fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100003);
        }
      }
      done();
    })
  })
}