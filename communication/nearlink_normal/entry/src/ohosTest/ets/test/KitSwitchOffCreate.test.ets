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
import remoteDevice from '@ohos.nearlink.remoteDevice';
import { clickRequestPermission } from './ClickRequestPermission';
import { sleep } from './Sleep';
import {clickCloseNearLinkSwitch,clickOpenNearLinkSwitch} from './Tools';

export default function nearlinkswitchoffTest() {
  describe('nearlinkswitchoffTest', () => {
    let RemoteD: remoteDevice.RemoteDevice;
    let TIME_SLEEP = 2000;
    let return_boolean: boolean;
    let ssapClient :ssap.Client;
    let ssapServer :ssap.Server;
    let ADDRESS = "22:33:44:55:66:77"
    let propertyDescriptors :Array<ssap.PropertyDescriptor>=[];
    let bufferDesc = new ArrayBuffer(8);
    let descV = new Uint8Array(bufferDesc);
    descV[0] = 11;
    let propertyDescriptor :ssap.PropertyDescriptor = {
      serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
      propertyUuid: '00001820-0000-1000-8000-00805F9B34FB',
      value: bufferDesc,
      descriptorType: ssap.PropertyDescriptorType.PROPERTY,
      isWriteable: true,
    };
    propertyDescriptors[0] = propertyDescriptor;
    let properties:Array<ssap.Property>=[];
    let bufferCCC = new ArrayBuffer(8);
    let cccV = new Uint8Array(bufferCCC);
    cccV[0] = 1;
    let property :ssap.Property = {
      serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
      propertyUuid: '00001820-0000-1000-8000-00805F9B34FB',
      value: bufferCCC,
      descriptors: propertyDescriptors,
      operation: 0,
    };
    properties[0]=property;
    let service :ssap.Service={
      serviceUuid:'00001810-0000-1000-8000-00805F9B34FB',
      properties:properties,
    }
    beforeAll(async (done: Function) => {
      console.info('beforeAll start');
      await sleep(TIME_SLEEP);
      await clickRequestPermission("辅助包执行");
      return_boolean = manager.isNearLinkSupported();
      try {
        RemoteD = remoteDevice.createRemoteDevice(ADDRESS);
        console.info('[nearLink_Test] createRemoteDevice result:' + RemoteD);
        expect(RemoteD != null).assertTrue();
        ssapClient = ssap.createClient(ADDRESS);
        console.info('[nearLink_Test] ssap client info: '+ ssapClient);
        expect(ssapClient != null).assertTrue();
        ssapServer = ssap.createServer();
        console.info('[nearLink_Test] ssap client info: '+ssapServer);
        expect(ssapServer != null).assertTrue();
      } catch (err) {
        console.error('[nearLink_Test]errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0100
     * @tc.desc RemoteDevice.startPairing in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0100';
      console.info(`${caseName} test start`);
      try {
        await RemoteD.startPairing();
        console.info(`${caseName} startPairing success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} startPairing error.code: ${error.code}, errMessage: ${error.message}`);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0200
     * @tc.desc RemoteDevice.getPairingState in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0200';
      console.info(`${caseName} test start`);
      try {
        let result: number = RemoteD.getPairingState();
        console.info(`${caseName} getPairingState:` + result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} getPairingState error.code: ${error.code}, errMessage: ${error.message}`);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0300
     * @tc.desc RemoteDevice.getDeviceName in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0300';
      console.info(`${caseName} test start`);
      try {
        let result: string = RemoteD.getDeviceName();
        console.info(`${caseName} getDeviceName:` + result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} getDeviceName error.code: ${error.code}, errMessage: ${error.message}`);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0400
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0400
     * @tc.desc RemoteDevice.getDeviceClass in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0400';
      console.info(`${caseName} test start`);
      try {
        let result: number = RemoteD.getDeviceClass();
        console.info(`${caseName} getDeviceClass:` + result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} getDeviceClass error.code: ${error.code}, errMessage: ${error.message}`);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0500
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0500
     * @tc.desc RemoteDevice.getConnectionState in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0500';
      console.info(`${caseName} test start`);
      try {
        let result: number = RemoteD.getConnectionState();
        console.info(`${caseName} getConnectionState:` + result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} getConnectionState error.code: ${error.code}, errMessage: ${error.message}`);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0600
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0600
     * @tc.desc RemoteDevice.getAcbState in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0600';
      console.info(`${caseName} test start`);
      try {
        let result: number = RemoteD.getAcbState();
        console.info(`${caseName} getAcbState:` + result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} getAcbState error.code: ${error.code}, errMessage: ${error.message}`);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0700
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0700
     * @tc.desc RemoteDevice.getDeviceInformation in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0700';
      console.info(`${caseName} test start`);
      try {
        let result: remoteDevice.DeviceInformation = RemoteD.getDeviceInformation();
        console.info(`${caseName} getDeviceInformation:` + result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} getDeviceInformation error.code: ${error.code}, errMessage: ${error.message}`);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0800
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0800
     * @tc.desc RemoteDevice.getRssiValue in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0800';
      console.info(`${caseName} test start`);
      try {
        let result: number = await RemoteD.getRssiValue();
        console.info(`${caseName} getRssiValue:` + result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} getRssiValue error.code: ${error.code}, errMessage: ${error.message}`);
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
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0900
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0900
     * @tc.desc RemoteDevice.setConnectionInterval in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_SwitchOff_0900';
      console.info(`${caseName} test start`);
      try {
        await RemoteD.setConnectionInterval(6);
        console.info(`${caseName} setConnectionInterval success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} setConnectionInterval error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0100
     * @tc.desc connect in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0100';
      console.info(`${caseName} test start`);
      try {
        await ssapClient.connect();
        console.info(`${caseName} ssap client connect success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} setConnectionInterval error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0200
     * @tc.desc ssapClient.disconnect in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0200';
      console.info(`${caseName} test start`);
      try {
        await ssapClient.disconnect();
        console.info(`${caseName} ssap client disconnect success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} ssapClient.disconnect error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0300
     * @tc.desc ssapClient.close in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0300';
      console.info(`${caseName} test start`);
      try {
        await ssapClient.close();
        console.info(`${caseName} ssap client close success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} ssapClient.close error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0400
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0400
     * @tc.desc ssapClient.getServices in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0400';
      console.info(`${caseName} test start`);
      try {
        let services = await ssapClient.getServices();
        console.info(`${caseName} ssap client getServices success: ${JSON.stringify(services)}`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} ssapClient.getServices error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0500
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0500
     * @tc.desc ssapClient.readProperty in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0500';
      console.info(`${caseName} test start`);
      try {
        let value = await ssapClient.readProperty(property);
        console.info(`${caseName} ssap client readProperty success: ${JSON.stringify(value)}`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} ssapClient.readProperty error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0600
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0600
     * @tc.desc ssapClient.writeProperty in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0600';
      console.info(`${caseName} test start`);
      try {
        await ssapClient.writeProperty(property, ssap.PropertyWriteType.WRITE);
        console.info(`${caseName} ssap client writeProperty success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} ssapClient.writeProperty error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0700
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0700
     * @tc.desc ssapClient.setPropertyNotification in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0700';
      console.info(`${caseName} test start`);
      try {
        let propertyDescriptors :Array<ssap.PropertyDescriptor>=[];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let propertyDescriptor :ssap.PropertyDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          propertyUuid: '00001820-0000-1000-8000-00805F9B34FB',
          value: bufferDesc,
          descriptorType: ssap.PropertyDescriptorType.PROPERTY,
          isWriteable: true,
        };
        propertyDescriptors[0] = propertyDescriptor;

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let property :ssap.Property = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          propertyUuid: '00001820-0000-1000-8000-00805F9B34FB',
          value: bufferCCC,
          descriptors: propertyDescriptors,
          operation: 0,
        };
        await ssapClient.setPropertyNotification(property,true);
        console.info(`${caseName} ssap client setPropertyNotification success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} ssapClient.setPropertyNotification error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0900
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0900
     * @tc.desc ssapClient.requestMtuSize in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_0900';
      console.info(`${caseName} test start`);
      try {
        await ssapClient.requestMtuSize(512);
        console.info(`${caseName} ssap client requestMtuSize success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} ssapClient.requestMtuSize error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1000
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1000
     * @tc.desc ssapServer.addService in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1000';
      console.info(`${caseName} test start`);
      try {
        await ssapServer.addService(service);
        console.info(`${caseName} ssap server addService success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} ssapServer.addService error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1100
     * @tc.desc ssapServer.removeService in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1100';
      console.info(`${caseName} test start`);
      try {
        await ssapServer.removeService('FFFFFFFF-1234-5678-ABCD-000000001234');
        console.info(`${caseName} ssap server removeService success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} ssapServer.removeService error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1200
     * @tc.desc ssapServer.close in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1200';
      console.info(`${caseName} test start`);
      try {
        await ssapServer.close();
        console.info(`${caseName} ssap server close success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} ssapServer.close error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1300
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1300
     * @tc.desc ssapServer.notifyPropertyChanged in SwitchOff state, error 36100003 expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1300';
      console.info(`${caseName} test start`);
      try {
        await ssapServer.notifyPropertyChanged(ADDRESS, property);
        console.info(`${caseName} ssap server notifyPropertyChanged success`);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} ssapServer.notifyPropertyChanged error.code: ${error.code}, errMessage: ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1400
     * @tc.desc ssap server sendResponse test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_SwitchOff_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      let serverResponse:ssap.ServerResponse={
        address:"11:22:33:44:55:66",
        requestId:0,
        value:bufferCCC,
      };
      try {
        ssapServer.sendResponse(serverResponse);
        console.info('[Nearlink_test] sendResponse success');
        expect().assertFail();
      } catch (err) {
        console.info('[Nearlink_test] sendResponse fail '+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100003);
        }
      }
      done();
    })
  })
}