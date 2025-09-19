/*
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

import { afterAll, beforeAll, describe, expect, it, Level } from '@ohos/hypium'
import baskddkerror from 'libbaskddkerrorcode.so'
import deviceManager from "@ohos.driver.deviceManager";

const Success = 0
const TAG: string = "[HidEmitEventTest]";
const DEVICE_NOSUPPORT_ERRINFO: string = "The device does not support or cannot find hid_ddk_service;";
function IsDevcieSupport(errCode: number, caseName: string) {
  if (errCode == -3) {
    console.info(TAG, `Test result ${caseName} : ${DEVICE_NOSUPPORT_ERRINFO}`);
    expect('undefined').assertEqual(DEVICE_NOSUPPORT_ERRINFO);
  }
}
export default function ActsHidEmitCodeTest() {
  let deviceId: number = -1;
  describe('ActsHidEmitCodeTest', () => {
    beforeAll(async () => {
      try {
        console.info(`before queryDevices`)
        let devices: Array<deviceManager.Device> = deviceManager.queryDevices(deviceManager.BusType.USB);
        console.info(`after queryDevices`)
        for (let item of devices) {
          console.info(`enter for`)
          let device: deviceManager.USBDevice = item as deviceManager.USBDevice;
          if ((device.vendorId == 0x2109 && device.productId == 0x888b) ||
            (device.vendorId == 0xbda && device.productId == 0x8153) ||
            (!baskddkerror.IsHidDevice(device.deviceId))) {
            console.info(`Device vid = ${device.vendorId} pid = ${device.productId}, is not hid device`);
            continue;
          }
          deviceId = device.deviceId;
          console.info(`Hid device id is ${device.deviceId}`);
        }
      } catch (error) {
        console.error(`Failed to query device. Code is ${error.code}, message is ${error.message}`);
      }
      console.log(TAG, '*************hid Unit HidEmitEventTest start*************');
    })

    afterAll(async () => {
      console.log(TAG, '*************hid Unit HidEmitEventTest end*************');
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDevicePropPointer_0100
     * @tc.name     SUB_Driver_Ext_HidCreateDevicePropPointer_0100
     * @tc.desc     Test HidCreateDevicePropPointer.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDevicePropPointer_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropPointer_0100 start====");
        let result: number = baskddkerror.HidCreateDevicePropPointer();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropPointer_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropPointer_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200
     * @tc.name     SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200
     * @tc.desc     Test HidCreateDevicePropPointingStick.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200 start====");
        let result: number = baskddkerror.HidCreateDevicePropPointingStick();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300
     * @tc.name     SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300
     * @tc.desc     Test HidCreateDevicePropButtonPad.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300 start====");
        let result: number = baskddkerror.HidCreateDevicePropButtonPad();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400
     * @tc.name     SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400
     * @tc.desc     Test HidCreateDevicePropSemiMt.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400 start====");
        let result: number = baskddkerror.HidCreateDevicePropSemiMt();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500
     * @tc.name     SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500
     * @tc.desc     Test HidCreateDevicePropTopButtonPad.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500 start====");
        let result: number = baskddkerror.HidCreateDevicePropTopButtonPad();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600
     * @tc.name     SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600
     * @tc.desc     Test HidCreateDevicePropAccelerometer.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600 start====");
        let result: number = baskddkerror.HidCreateDevicePropAccelerometer();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700
     * @tc.desc     Test HidCreateDeviceEventTypeHidEVRel.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700 start====");
        let result: number = baskddkerror.HidCreateDeviceEventTypeHidEVRel();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidSynEventReport_0800
     * @tc.name     SUB_Driver_Ext_HidSynEventReport_0800
     * @tc.desc     Test HidSynEventReport.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidSynEventReport_0800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidSynEventReport_0800 start====");
        let result: number = baskddkerror.HidSynEventReport();
        IsDevcieSupport(result, 'SUB_Driver_Ext_HidSynEventReport_0800');
        expect(result).assertEqual(27300003);
        console.info("====>SUB_Driver_Ext_HidSynEventReport_0800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidSynEventReport_0800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidSynEventConfig_0900
     * @tc.name     SUB_Driver_Ext_HidSynEventConfig_0900
     * @tc.desc     Test HidSynEventConfig.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidSynEventConfig_0900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidSynEventConfig_0900 start====");
        let result: number = baskddkerror.HidSynEventConfig();
        IsDevcieSupport(result, 'SUB_Driver_Ext_HidSynEventConfig_0900');
        expect(result).assertEqual(27300003);
        console.info("====>SUB_Driver_Ext_HidSynEventConfig_0900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidSynEventConfig_0900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidSynEventMtReport_1000
     * @tc.name     SUB_Driver_Ext_HidSynEventMtReport_1000
     * @tc.desc     Test HidSynEventMtReport.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidSynEventMtReport_1000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidSynEventMtReport_1000 start====");
        let result: number = baskddkerror.HidSynEventMtReport();
        IsDevcieSupport(result, 'SUB_Driver_Ext_HidSynEventMtReport_1000');
        expect(result).assertEqual(27300003);
        console.info("====>SUB_Driver_Ext_HidSynEventMtReport_1000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidSynEventMtReport_1000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidSynEventDropped_1100
     * @tc.name     SUB_Driver_Ext_HidSynEventDropped_1100
     * @tc.desc     Test HidSynEventDropped.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidSynEventDropped_1100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidSynEventDropped_1100 start====");
        let result: number = baskddkerror.HidSynEventReport();
        IsDevcieSupport(result, 'SUB_Driver_Ext_HidSynEventDropped_1100');
        expect(result).assertEqual(27300003);
        console.info("====>SUB_Driver_Ext_HidSynEventDropped_1100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidSynEventDropped_1100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200
     * @tc.desc     Test HidCreateDeviceKeyCodeKEYA.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYA();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300
     * @tc.desc     Test HidCreateDeviceKeyCodeKEYB.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYB();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400
     * @tc.desc     Test HidCreateDeviceKeyCodeKEYC.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYC();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500
     * @tc.desc     Test HidCreateDeviceKeyCodeKEYD.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYD();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600
     * @tc.desc     Test HidCreateDeviceKeyCodeKEYE.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700
     * @tc.desc     Test HidCreateDeviceKeyCodeKEYF.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYF();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800
     * @tc.desc     Test HidCreateDeviceKeyCodeKEYG.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYG();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900
     * @tc.desc     Test HidCreateDeviceKeyCodeKEYA.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYH();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000
     * @tc.desc     Test HidCreateDeviceKeyCodeKEYI.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYI();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100
     * @tc.desc     Test HidCreateDeviceKeyCodeKEYJ.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYJ();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200
     * @tc.name     SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200
     * @tc.desc     Test HidCreateDeviceKeyCodeKEYK.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYK();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200 catch err: " + err);
        expect().assertFail();
      }
    })

  })
}

