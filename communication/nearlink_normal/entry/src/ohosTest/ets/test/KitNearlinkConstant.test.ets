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
import nearlinkConstant from '@ohos.nearlink.constant';
import { clickRequestPermission } from './ClickRequestPermission';
import { sleep } from './Sleep';
import { openNearLink } from './OpenNearLink';

export default function constantTest() {
  describe('constantTest', () => {

    let TIME_SLEEP = 2000;

    beforeAll(async (done: Function) => {
      console.info('beforeAll start');
      await sleep(TIME_SLEEP);
      await clickRequestPermission();
      console.info('beforeAll end');
      done();
    })
    beforeEach(async (done: Function) => {
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
     * @tc.number SUB_Communication_XTS_NearLink_Constant_Enum_0100
     * @tc.name SUB_Communication_XTS_NearLink_Constant_Enum_0100
     * @tc.desc PairingState enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Constant_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_Constant_Enum_0100';
        console.info(`${caseName} test start`);
        try {
          let PAIRING_STATE_NONE: nearlinkConstant.PairingState = nearlinkConstant.PairingState.PAIRING_STATE_NONE;
          console.info(`${caseName} PAIRING_STATE_NONE result:` + PAIRING_STATE_NONE);
          expect(PAIRING_STATE_NONE).assertEqual(1);
          let PAIRING_STATE_PAIRING: nearlinkConstant.PairingState = nearlinkConstant.PairingState.PAIRING_STATE_PAIRING;
          console.info(`${caseName} PAIRING_STATE_PAIRING result:` + PAIRING_STATE_PAIRING);
          expect(PAIRING_STATE_PAIRING).assertEqual(2);
          let PAIRING_STATE_PAIRED: nearlinkConstant.PairingState = nearlinkConstant.PairingState.PAIRING_STATE_PAIRED;
          console.info(`${caseName} PAIRING_STATE_PAIRED result:` + PAIRING_STATE_PAIRED);
          expect(PAIRING_STATE_PAIRED).assertEqual(3);
        } catch (error) {
          console.info(`${caseName} PairingState error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number SUB_Communication_XTS_NearLink_Constant_Enum_0200
     * @tc.name SUB_Communication_XTS_NearLink_Constant_Enum_0200
     * @tc.desc ConnectionState enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Constant_Enum_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_Constant_Enum_0200';
        console.info(`${caseName} test start`);
        try {
          let STATE_CONNECTING: nearlinkConstant.ConnectionState = nearlinkConstant.ConnectionState.STATE_CONNECTING;
          console.info(`${caseName} STATE_CONNECTING result:` + STATE_CONNECTING);
          expect(STATE_CONNECTING).assertEqual(0);
          let STATE_CONNECTED: nearlinkConstant.ConnectionState = nearlinkConstant.ConnectionState.STATE_CONNECTED;
          console.info(`${caseName} STATE_CONNECTED result:` + STATE_CONNECTED);
          expect(STATE_CONNECTED).assertEqual(1);
          let STATE_DISCONNECTING: nearlinkConstant.ConnectionState = nearlinkConstant.ConnectionState.STATE_DISCONNECTING;
          console.info(`${caseName} STATE_DISCONNECTING result:` + STATE_DISCONNECTING);
          expect(STATE_DISCONNECTING).assertEqual(2);
          let STATE_DISCONNECTED: nearlinkConstant.ConnectionState = nearlinkConstant.ConnectionState.STATE_DISCONNECTED;
          console.info(`${caseName} STATE_DISCONNECTED result:` + STATE_DISCONNECTED);
          expect(STATE_DISCONNECTED).assertEqual(3);
        } catch (error) {
          console.info(`${caseName} ConnectionState error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number SUB_Communication_XTS_NearLink_Constant_Enum_0300
     * @tc.name SUB_Communication_XTS_NearLink_Constant_Enum_0300
     * @tc.desc AcbState enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Constant_Enum_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_Constant_Enum_0300';
        console.info(`${caseName} test start`);
        try {
          let DISCONNECTED: nearlinkConstant.AcbState = nearlinkConstant.AcbState.DISCONNECTED;
          console.info(`${caseName} AcbState DISCONNECTED result:` + DISCONNECTED);
          expect(DISCONNECTED).assertEqual(0);
          let CONNECTED: nearlinkConstant.AcbState = nearlinkConstant.AcbState.CONNECTED;
          console.info(`${caseName} AcbState CONNECTED result:` + CONNECTED);
          expect(CONNECTED).assertEqual(1);
          let ENCRYPTED: nearlinkConstant.AcbState = nearlinkConstant.AcbState.ENCRYPTED;
          console.info(`${caseName} AcbState ENCRYPTED result:` + ENCRYPTED);
          expect(ENCRYPTED).assertEqual(2);
        } catch (error) {
          console.info(`${caseName} AcbState error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number SUB_Communication_XTS_NearLink_Constant_Enum_0400
     * @tc.name SUB_Communication_XTS_NearLink_Constant_Enum_0400
     * @tc.desc DeviceClass enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Constant_Enum_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_Constant_Enum_0400';
        console.info(`${caseName} test start`);
        try {
          let DEVICE_INVALID_CLASS: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_INVALID_CLASS;
          console.info(`${caseName} DEVICE_INVALID_CLASS result:` + DEVICE_INVALID_CLASS);
          expect(DEVICE_INVALID_CLASS).assertEqual(-1);
          let DEVICE_UNCATEGORIZED: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_UNCATEGORIZED;
          console.info(`${caseName} DEVICE_UNCATEGORIZED result:` + DEVICE_UNCATEGORIZED);
          expect(DEVICE_UNCATEGORIZED).assertEqual(0x000100);
          let DEVICE_PHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_PHONE;
          console.info(`${caseName} DEVICE_PHONE result:` + DEVICE_PHONE);
          expect(DEVICE_PHONE).assertEqual(0x000200);
          let DEVICE_SMARTPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMARTPHONE;
          console.info(`${caseName} DEVICE_SMARTPHONE result:` + DEVICE_SMARTPHONE);
          expect(DEVICE_SMARTPHONE).assertEqual(0x000201);
          let DEVICE_COMPUTER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_COMPUTER;
          console.info(`${caseName} DEVICE_COMPUTER result:` + DEVICE_COMPUTER);
          expect(DEVICE_COMPUTER).assertEqual(0x000300);
          let DEVICE_LAPTOP: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_LAPTOP;
          console.info(`${caseName} DEVICE_LAPTOP result:` + DEVICE_LAPTOP);
          expect(DEVICE_LAPTOP).assertEqual(0x000301);
          let DEVICE_TABLET: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_TABLET;
          console.info(`${caseName} DEVICE_TABLET result:` + DEVICE_TABLET);
          expect(DEVICE_TABLET).assertEqual(0x000302);
          let DEVICE_ALL_IN_ONE_COMPUTER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ALL_IN_ONE_COMPUTER;
          console.info(`${caseName} DEVICE_ALL_IN_ONE_COMPUTER result:` + DEVICE_ALL_IN_ONE_COMPUTER);
          expect(DEVICE_ALL_IN_ONE_COMPUTER).assertEqual(0x000303);
          let DEVICE_MINI_PC: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_MINI_PC;
          console.info(`${caseName} DEVICE_MINI_PC result:` + DEVICE_MINI_PC);
          expect(DEVICE_MINI_PC).assertEqual(0x000304);
          let DEVICE_WATCH: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_WATCH;
          console.info(`${caseName} DEVICE_WATCH result:` + DEVICE_WATCH);
          expect(DEVICE_WATCH).assertEqual(0x000400);
          let DEVICE_SMART_WATCH: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_WATCH;
          console.info(`${caseName} DEVICE_SMART_WATCH result:` + DEVICE_SMART_WATCH);
          expect(DEVICE_SMART_WATCH).assertEqual(0x000401);
          let DEVICE_HUMAN_INTERFACE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_HUMAN_INTERFACE;
          console.info(`${caseName} DEVICE_HUMAN_INTERFACE result:` + DEVICE_HUMAN_INTERFACE);
          expect(DEVICE_HUMAN_INTERFACE).assertEqual(0x000500);
          let DEVICE_KEYBOARD: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_KEYBOARD;
          console.info(`${caseName} DEVICE_KEYBOARD result:` + DEVICE_KEYBOARD);
          expect(DEVICE_KEYBOARD).assertEqual(0x000501);
          let DEVICE_MOUSE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_MOUSE;
          console.info(`${caseName} DEVICE_MOUSE result:` + DEVICE_MOUSE);
          expect(DEVICE_MOUSE).assertEqual(0x000502);
          let DEVICE_HANDLE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_HANDLE;
          console.info(`${caseName} DEVICE_HANDLE result:` + DEVICE_HANDLE);
          expect(DEVICE_HANDLE).assertEqual(0x000503);
          let DEVICE_STYLUS: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_STYLUS;
          console.info(`${caseName} DEVICE_STYLUS result:` + DEVICE_STYLUS);
          expect(DEVICE_STYLUS).assertEqual(0x000504);
          let DEVICE_TOUCHPAD: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_TOUCHPAD;
          console.info(`${caseName} DEVICE_TOUCHPAD result:` + DEVICE_TOUCHPAD);
          expect(DEVICE_TOUCHPAD).assertEqual(0x000505);
          let DEVICE_AUDIO_PLAYBACK: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_AUDIO_PLAYBACK;
          console.info(`${caseName} DEVICE_AUDIO_PLAYBACK result:` + DEVICE_AUDIO_PLAYBACK);
          expect(DEVICE_AUDIO_PLAYBACK).assertEqual(0x000600);
          let DEVICE_SMART_SPEAKER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_SPEAKER;
          console.info(`${caseName} DEVICE_SMART_SPEAKER result:` + DEVICE_SMART_SPEAKER);
          expect(DEVICE_SMART_SPEAKER).assertEqual(0x000601);
          let DEVICE_ECHO_WALL: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ECHO_WALL;
          console.info(`${caseName} DEVICE_ECHO_WALL result:` + DEVICE_ECHO_WALL);
          expect(DEVICE_ECHO_WALL).assertEqual(0x000602);
          let DEVICE_AUDIO_CAPTURE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_AUDIO_CAPTURE;
          console.info(`${caseName} DEVICE_AUDIO_CAPTURE result:` + DEVICE_AUDIO_CAPTURE);
          expect(DEVICE_AUDIO_CAPTURE).assertEqual(0x000700);
          let DEVICE_KARAOKE_MICROPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_KARAOKE_MICROPHONE;
          console.info(`${caseName} DEVICE_KARAOKE_MICROPHONE result:` + DEVICE_KARAOKE_MICROPHONE);
          expect(DEVICE_KARAOKE_MICROPHONE).assertEqual(0x000701);
          let DEVICE_LAPEL_MICROPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_LAPEL_MICROPHONE;
          console.info(`${caseName} DEVICE_LAPEL_MICROPHONE result:` + DEVICE_LAPEL_MICROPHONE);
          expect(DEVICE_LAPEL_MICROPHONE).assertEqual(0x000702);
          let DEVICE_WEARABLE_AUDIO: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_WEARABLE_AUDIO;
          console.info(`${caseName} DEVICE_WEARABLE_AUDIO result:` + DEVICE_WEARABLE_AUDIO);
          expect(DEVICE_WEARABLE_AUDIO).assertEqual(0x000800);
          let DEVICE_IN_EAR_EARPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_IN_EAR_EARPHONE;
          console.info(`${caseName} DEVICE_IN_EAR_EARPHONE result:` + DEVICE_IN_EAR_EARPHONE);
          expect(DEVICE_IN_EAR_EARPHONE).assertEqual(0x000801);
          let DEVICE_HEADSET: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_HEADSET;
          console.info(`${caseName} DEVICE_HEADSET result:` + DEVICE_HEADSET);
          expect(DEVICE_HEADSET).assertEqual(0x000802);
          let DEVICE_OVER_EAR_HEADPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_OVER_EAR_HEADPHONE;
          console.info(`${caseName} DEVICE_OVER_EAR_HEADPHONE result:` + DEVICE_OVER_EAR_HEADPHONE);
          expect(DEVICE_OVER_EAR_HEADPHONE).assertEqual(0x000803);
          let DEVICE_NECKBAND_EARPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_NECKBAND_EARPHONE;
          console.info(`${caseName} DEVICE_NECKBAND_EARPHONE result:` + DEVICE_NECKBAND_EARPHONE);
          expect(DEVICE_NECKBAND_EARPHONE).assertEqual(0x000804);
          let DEVICE_PERSONAL_CARE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_PERSONAL_CARE;
          console.info(`${caseName} DEVICE_PERSONAL_CARE result:` + DEVICE_PERSONAL_CARE);
          expect(DEVICE_PERSONAL_CARE).assertEqual(0x000900);
          let DEVICE_INTELLIGENT_TOOTHBRUSH: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_INTELLIGENT_TOOTHBRUSH;
          console.info(`${caseName} DEVICE_INTELLIGENT_TOOTHBRUSH result:` + DEVICE_INTELLIGENT_TOOTHBRUSH);
          expect(DEVICE_INTELLIGENT_TOOTHBRUSH).assertEqual(0x000901);
          let DEVICE_SMART_CUP: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_CUP;
          console.info(`${caseName} DEVICE_SMART_CUP result:` + DEVICE_SMART_CUP);
          expect(DEVICE_SMART_CUP).assertEqual(0x000902);
          let DEVICE_INTELLIGENT_SHAVER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_INTELLIGENT_SHAVER;
          console.info(`${caseName} DEVICE_INTELLIGENT_SHAVER result:` + DEVICE_INTELLIGENT_SHAVER);
          expect(DEVICE_INTELLIGENT_SHAVER).assertEqual(0x000903);
          let DEVICE_HVAC: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_HVAC;
          console.info(`${caseName} DEVICE_HVAC result:` + DEVICE_HVAC);
          expect(DEVICE_HVAC).assertEqual(0x000A00);
          let DEVICE_AIR_PURIFIER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_AIR_PURIFIER;
          console.info(`${caseName} DEVICE_AIR_PURIFIER result:` + DEVICE_AIR_PURIFIER);
          expect(DEVICE_AIR_PURIFIER).assertEqual(0x000A01);
          let DEVICE_HUMIDIFIER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_HUMIDIFIER;
          console.info(`${caseName} DEVICE_HUMIDIFIER result:` + DEVICE_HUMIDIFIER);
          expect(DEVICE_HUMIDIFIER).assertEqual(0x000A02);
          let DEVICE_AIR_CIRCULATION_FAN: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_AIR_CIRCULATION_FAN;
          console.info(`${caseName} DEVICE_AIR_CIRCULATION_FAN result:` + DEVICE_AIR_CIRCULATION_FAN);
          expect(DEVICE_AIR_CIRCULATION_FAN).assertEqual(0x000A03);
          let DEVICE_ELECTRIC_RIDE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ELECTRIC_RIDE;
          console.info(`${caseName} DEVICE_ELECTRIC_RIDE result:` + DEVICE_ELECTRIC_RIDE);
          expect(DEVICE_ELECTRIC_RIDE).assertEqual(0x000B00);
          let DEVICE_ELECTRIC_SCOOTER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ELECTRIC_SCOOTER;
          console.info(`${caseName} DEVICE_ELECTRIC_SCOOTER result:` + DEVICE_ELECTRIC_SCOOTER);
          expect(DEVICE_ELECTRIC_SCOOTER).assertEqual(0x000B01);
          let DEVICE_ELECTRIC_BICYCLE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ELECTRIC_BICYCLE;
          console.info(`${caseName} DEVICE_ELECTRIC_BICYCLE result:` + DEVICE_ELECTRIC_BICYCLE);
          expect(DEVICE_ELECTRIC_BICYCLE).assertEqual(0x000B02);
          let DEVICE_LIGHT_FITTING: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_LIGHT_FITTING;
          console.info(`${caseName} DEVICE_LIGHT_FITTING result:` + DEVICE_LIGHT_FITTING);
          expect(DEVICE_LIGHT_FITTING).assertEqual(0x000C00);
          let DEVICE_SMART_TABLE_LAMP: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_TABLE_LAMP;
          console.info(`${caseName} DEVICE_SMART_TABLE_LAMP result:` + DEVICE_SMART_TABLE_LAMP);
          expect(DEVICE_SMART_TABLE_LAMP).assertEqual(0x000C01);
          let DEVICE_REMOTE_CONTROL: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_REMOTE_CONTROL;
          console.info(`${caseName} DEVICE_REMOTE_CONTROL result:` + DEVICE_REMOTE_CONTROL);
          expect(DEVICE_REMOTE_CONTROL).assertEqual(0x000D00);
          let DEVICE_TV_REMOTE_CONTROL: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_TV_REMOTE_CONTROL;
          console.info(`${caseName} DEVICE_TV_REMOTE_CONTROL result:` + DEVICE_TV_REMOTE_CONTROL);
          expect(DEVICE_TV_REMOTE_CONTROL).assertEqual(0x000D01);
          let DEVICE_IMAGING: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_IMAGING;
          console.info(`${caseName} DEVICE_IMAGING result:` + DEVICE_IMAGING);
          expect(DEVICE_IMAGING).assertEqual(0x000E00);
          let DEVICE_SMART_TV: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_TV;
          console.info(`${caseName} DEVICE_SMART_TV result:` + DEVICE_SMART_TV);
          expect(DEVICE_SMART_TV).assertEqual(0x000E01);
          let DEVICE_IP_CAMERA: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_IP_CAMERA;
          console.info(`${caseName} DEVICE_IP_CAMERA result:` + DEVICE_IP_CAMERA);
          expect(DEVICE_IP_CAMERA).assertEqual(0x000E02);
          let DEVICE_SCREEN_CASTER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SCREEN_CASTER;
          console.info(`${caseName} DEVICE_SCREEN_CASTER result:` + DEVICE_SCREEN_CASTER);
          expect(DEVICE_SCREEN_CASTER).assertEqual(0x000E03);
          let DEVICE_NETWORKING: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_NETWORKING;
          console.info(`${caseName} DEVICE_NETWORKING result:` + DEVICE_NETWORKING);
          expect(DEVICE_NETWORKING).assertEqual(0x000F00);
          let DEVICE_IOT_GATEWAY: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_IOT_GATEWAY;
          console.info(`${caseName} DEVICE_IOT_GATEWAY result:` + DEVICE_IOT_GATEWAY);
          expect(DEVICE_IOT_GATEWAY).assertEqual(0x000F01);
          let DEVICE_ACCESS_CONTROL: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ACCESS_CONTROL;
          console.info(`${caseName} DEVICE_ACCESS_CONTROL result:` + DEVICE_ACCESS_CONTROL);
          expect(DEVICE_ACCESS_CONTROL).assertEqual(0x001000);
          let DEVICE_INTELLIGENT_LOCK: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_INTELLIGENT_LOCK;
          console.info(`${caseName} DEVICE_INTELLIGENT_LOCK result:` + DEVICE_INTELLIGENT_LOCK);
          expect(DEVICE_INTELLIGENT_LOCK).assertEqual(0x001001);
          let DEVICE_SMART_KEY: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_KEY;
          console.info(`${caseName} DEVICE_SMART_KEY result:` + DEVICE_SMART_KEY);
          expect(DEVICE_SMART_KEY).assertEqual(0x001002);
          let DEVICE_VEHICLE_KEY: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_VEHICLE_KEY;
          console.info(`${caseName} DEVICE_VEHICLE_KEY result:` + DEVICE_VEHICLE_KEY);
          expect(DEVICE_VEHICLE_KEY).assertEqual(0x001003);
          let DEVICE_VEHICLE_LOCK: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_VEHICLE_LOCK;
          console.info(`${caseName} DEVICE_VEHICLE_LOCK result:` + DEVICE_VEHICLE_LOCK);
          expect(DEVICE_VEHICLE_LOCK).assertEqual(0x001004);
        } catch (error) {
          console.info(`${caseName} DeviceClass error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })
  })
}