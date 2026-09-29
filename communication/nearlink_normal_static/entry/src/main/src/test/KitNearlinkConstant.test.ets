'use static';
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
import nearlinkConstant from '@ohos.nearlink.constant';
import Utils from './Util.test';
import hilog from '@ohos.hilog';

export default function constantTest(): void {
  describe('constantTest', () => {

    let TIME_SLEEP: int = 2000;

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll start');
      await Utils.msSleep(TIME_SLEEP);
      await Utils.clickRequestPermission();
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
     * @tc.number SUB_Communication_XTS_NearLink_Constant_Enum_0100
     * @tc.name SUB_Communication_XTS_NearLink_Constant_Enum_static_0100
     * @tc.desc PairingState enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Constant_Enum_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLink_Constant_Enum_static_0100';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let PAIRING_STATE_NONE: nearlinkConstant.PairingState = nearlinkConstant.PairingState.PAIRING_STATE_NONE;
          hilog.info(0x0000, 'testTag', '%{public}s PAIRING_STATE_NONE result: %{public}d', caseName, PAIRING_STATE_NONE);
          expect(PAIRING_STATE_NONE).assertEqual(1);
          let PAIRING_STATE_PAIRING: nearlinkConstant.PairingState = nearlinkConstant.PairingState.PAIRING_STATE_PAIRING;
          hilog.info(0x0000, 'testTag', '%{public}s PAIRING_STATE_PAIRING result: %{public}d', caseName, PAIRING_STATE_PAIRING);
          expect(PAIRING_STATE_PAIRING).assertEqual(2);
          let PAIRING_STATE_PAIRED: nearlinkConstant.PairingState = nearlinkConstant.PairingState.PAIRING_STATE_PAIRED;
          hilog.info(0x0000, 'testTag', '%{public}s PAIRING_STATE_PAIRED result: %{public}d', caseName, PAIRING_STATE_PAIRED);
          expect(PAIRING_STATE_PAIRED).assertEqual(3);
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s PairingState error.code %{public}s,errMessage: %{public}s', caseName, JSON.stringify(error.code), JSON.stringify(error.message));
          expect().assertFail();
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })

    /**
     * @tc.number SUB_Communication_XTS_NearLink_Constant_Enum_0200
     * @tc.name SUB_Communication_XTS_NearLink_Constant_Enum_static_0200
     * @tc.desc ConnectionState enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Constant_Enum_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLink_Constant_Enum_static_0200';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let STATE_CONNECTING: nearlinkConstant.ConnectionState = nearlinkConstant.ConnectionState.STATE_CONNECTING;
          hilog.info(0x0000, 'testTag', '%{public}s STATE_CONNECTING result: %{public}d', caseName, STATE_CONNECTING);
          expect(STATE_CONNECTING).assertEqual(0);
          let STATE_CONNECTED: nearlinkConstant.ConnectionState = nearlinkConstant.ConnectionState.STATE_CONNECTED;
          hilog.info(0x0000, 'testTag', '%{public}s STATE_CONNECTED result: %{public}d', caseName, STATE_CONNECTED);
          expect(STATE_CONNECTED).assertEqual(1);
          let STATE_DISCONNECTING: nearlinkConstant.ConnectionState = nearlinkConstant.ConnectionState.STATE_DISCONNECTING;
          hilog.info(0x0000, 'testTag', '%{public}s STATE_DISCONNECTING result: %{public}d', caseName, STATE_DISCONNECTING);
          expect(STATE_DISCONNECTING).assertEqual(2);
          let STATE_DISCONNECTED: nearlinkConstant.ConnectionState = nearlinkConstant.ConnectionState.STATE_DISCONNECTED;
          hilog.info(0x0000, 'testTag', '%{public}s STATE_DISCONNECTED result: %{public}d', caseName, STATE_DISCONNECTED);
          expect(STATE_DISCONNECTED).assertEqual(3);
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s ConnectionState error.code %{public}s,errMessage: %{public}s', caseName, JSON.stringify(error.code), JSON.stringify(error.message));
          expect().assertFail();
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })

    /**
     * @tc.number SUB_Communication_XTS_NearLink_Constant_Enum_0300
     * @tc.name SUB_Communication_XTS_NearLink_Constant_Enum_static_0300
     * @tc.desc AcbState enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Constant_Enum_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLink_Constant_Enum_static_0300';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let DISCONNECTED: nearlinkConstant.AcbState = nearlinkConstant.AcbState.DISCONNECTED;
          hilog.info(0x0000, 'testTag', '%{public}s AcbState DISCONNECTED result: %{public}d', caseName, DISCONNECTED);
          expect(DISCONNECTED).assertEqual(0);
          let CONNECTED: nearlinkConstant.AcbState = nearlinkConstant.AcbState.CONNECTED;
          hilog.info(0x0000, 'testTag', '%{public}s AcbState CONNECTED result: %{public}d', caseName, CONNECTED);
          expect(CONNECTED).assertEqual(1);
          let ENCRYPTED: nearlinkConstant.AcbState = nearlinkConstant.AcbState.ENCRYPTED;
          hilog.info(0x0000, 'testTag', '%{public}s AcbState ENCRYPTED result: %{public}d', caseName, ENCRYPTED);
          expect(ENCRYPTED).assertEqual(2);
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s AcbState error.code %{public}s,errMessage: %{public}s', caseName, JSON.stringify(error.code), JSON.stringify(error.message));
          expect().assertFail();
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })

    /**
     * @tc.number SUB_Communication_XTS_NearLink_Constant_Enum_0400
     * @tc.name SUB_Communication_XTS_NearLink_Constant_Enum_static_0400
     * @tc.desc DeviceClass enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Constant_Enum_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLink_Constant_Enum_static_0400';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let DEVICE_INVALID_CLASS: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_INVALID_CLASS;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_INVALID_CLASS result: %{public}d', caseName, DEVICE_INVALID_CLASS);
          expect(DEVICE_INVALID_CLASS).assertEqual(-1);
          let DEVICE_UNCATEGORIZED: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_UNCATEGORIZED;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_UNCATEGORIZED result: %{public}d', caseName, DEVICE_UNCATEGORIZED);
          expect(DEVICE_UNCATEGORIZED).assertEqual(0x000100);
          let DEVICE_PHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_PHONE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_PHONE result: %{public}d', caseName, DEVICE_PHONE);
          expect(DEVICE_PHONE).assertEqual(0x000200);
          let DEVICE_SMARTPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMARTPHONE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_SMARTPHONE result: %{public}d', caseName, DEVICE_SMARTPHONE);
          expect(DEVICE_SMARTPHONE).assertEqual(0x000201);
          let DEVICE_COMPUTER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_COMPUTER;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_COMPUTER result: %{public}d', caseName, DEVICE_COMPUTER);
          expect(DEVICE_COMPUTER).assertEqual(0x000300);
          let DEVICE_LAPTOP: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_LAPTOP;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_LAPTOP result: %{public}d', caseName, DEVICE_LAPTOP);
          expect(DEVICE_LAPTOP).assertEqual(0x000301);
          let DEVICE_TABLET: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_TABLET;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_TABLET result: %{public}d', caseName, DEVICE_TABLET);
          expect(DEVICE_TABLET).assertEqual(0x000302);
          let DEVICE_ALL_IN_ONE_COMPUTER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ALL_IN_ONE_COMPUTER;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_ALL_IN_ONE_COMPUTER result: %{public}d', caseName, DEVICE_ALL_IN_ONE_COMPUTER);
          expect(DEVICE_ALL_IN_ONE_COMPUTER).assertEqual(0x000303);
          let DEVICE_MINI_PC: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_MINI_PC;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_MINI_PC result: %{public}d', caseName, DEVICE_MINI_PC);
          expect(DEVICE_MINI_PC).assertEqual(0x000304);
          let DEVICE_WATCH: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_WATCH;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_WATCH result: %{public}d', caseName, DEVICE_WATCH);
          expect(DEVICE_WATCH).assertEqual(0x000400);
          let DEVICE_SMART_WATCH: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_WATCH;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_SMART_WATCH result: %{public}d', caseName, DEVICE_SMART_WATCH);
          expect(DEVICE_SMART_WATCH).assertEqual(0x000401);
          let DEVICE_HUMAN_INTERFACE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_HUMAN_INTERFACE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_HUMAN_INTERFACE result: %{public}d', caseName, DEVICE_HUMAN_INTERFACE);
          expect(DEVICE_HUMAN_INTERFACE).assertEqual(0x000500);
          let DEVICE_KEYBOARD: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_KEYBOARD;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_KEYBOARD result: %{public}d', caseName, DEVICE_KEYBOARD);
          expect(DEVICE_KEYBOARD).assertEqual(0x000501);
          let DEVICE_MOUSE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_MOUSE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_MOUSE result: %{public}d', caseName, DEVICE_MOUSE);
          expect(DEVICE_MOUSE).assertEqual(0x000502);
          let DEVICE_HANDLE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_HANDLE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_HANDLE result: %{public}d', caseName, DEVICE_HANDLE);
          expect(DEVICE_HANDLE).assertEqual(0x000503);
          let DEVICE_STYLUS: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_STYLUS;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_STYLUS result: %{public}d', caseName, DEVICE_STYLUS);
          expect(DEVICE_STYLUS).assertEqual(0x000504);
          let DEVICE_TOUCHPAD: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_TOUCHPAD;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_TOUCHPAD result: %{public}d', caseName, DEVICE_TOUCHPAD);
          expect(DEVICE_TOUCHPAD).assertEqual(0x000505);
          let DEVICE_AUDIO_PLAYBACK: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_AUDIO_PLAYBACK;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_AUDIO_PLAYBACK result: %{public}d', caseName, DEVICE_AUDIO_PLAYBACK);
          expect(DEVICE_AUDIO_PLAYBACK).assertEqual(0x000600);
          let DEVICE_SMART_SPEAKER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_SPEAKER;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_SMART_SPEAKER result: %{public}d', caseName, DEVICE_SMART_SPEAKER);
          expect(DEVICE_SMART_SPEAKER).assertEqual(0x000601);
          let DEVICE_ECHO_WALL: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ECHO_WALL;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_ECHO_WALL result: %{public}d', caseName, DEVICE_ECHO_WALL);
          expect(DEVICE_ECHO_WALL).assertEqual(0x000602);
          let DEVICE_AUDIO_CAPTURE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_AUDIO_CAPTURE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_AUDIO_CAPTURE result: %{public}d', caseName, DEVICE_AUDIO_CAPTURE);
          expect(DEVICE_AUDIO_CAPTURE).assertEqual(0x000700);
          let DEVICE_KARAOKE_MICROPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_KARAOKE_MICROPHONE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_KARAOKE_MICROPHONE result: %{public}d', caseName, DEVICE_KARAOKE_MICROPHONE);
          expect(DEVICE_KARAOKE_MICROPHONE).assertEqual(0x000701);
          let DEVICE_LAPEL_MICROPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_LAPEL_MICROPHONE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_LAPEL_MICROPHONE result: %{public}d', caseName, DEVICE_LAPEL_MICROPHONE);
          expect(DEVICE_LAPEL_MICROPHONE).assertEqual(0x000702);
          let DEVICE_WEARABLE_AUDIO: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_WEARABLE_AUDIO;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_WEARABLE_AUDIO result: %{public}d', caseName, DEVICE_WEARABLE_AUDIO);
          expect(DEVICE_WEARABLE_AUDIO).assertEqual(0x000800);
          let DEVICE_IN_EAR_EARPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_IN_EAR_EARPHONE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_IN_EAR_EARPHONE result: %{public}d', caseName, DEVICE_IN_EAR_EARPHONE);
          expect(DEVICE_IN_EAR_EARPHONE).assertEqual(0x000801);
          let DEVICE_HEADSET: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_HEADSET;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_HEADSET result: %{public}d', caseName, DEVICE_HEADSET);
          expect(DEVICE_HEADSET).assertEqual(0x000802);
          let DEVICE_OVER_EAR_HEADPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_OVER_EAR_HEADPHONE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_OVER_EAR_HEADPHONE result: %{public}d', caseName, DEVICE_OVER_EAR_HEADPHONE);
          expect(DEVICE_OVER_EAR_HEADPHONE).assertEqual(0x000803);
          let DEVICE_NECKBAND_EARPHONE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_NECKBAND_EARPHONE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_NECKBAND_EARPHONE result: %{public}d', caseName, DEVICE_NECKBAND_EARPHONE);
          expect(DEVICE_NECKBAND_EARPHONE).assertEqual(0x000804);
          let DEVICE_PERSONAL_CARE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_PERSONAL_CARE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_PERSONAL_CARE result: %{public}d', caseName, DEVICE_PERSONAL_CARE);
          expect(DEVICE_PERSONAL_CARE).assertEqual(0x000900);
          let DEVICE_INTELLIGENT_TOOTHBRUSH: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_INTELLIGENT_TOOTHBRUSH;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_INTELLIGENT_TOOTHBRUSH result: %{public}d', caseName, DEVICE_INTELLIGENT_TOOTHBRUSH);
          expect(DEVICE_INTELLIGENT_TOOTHBRUSH).assertEqual(0x000901);
          let DEVICE_SMART_CUP: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_CUP;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_SMART_CUP result: %{public}d', caseName, DEVICE_SMART_CUP);
          expect(DEVICE_SMART_CUP).assertEqual(0x000902);
          let DEVICE_INTELLIGENT_SHAVER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_INTELLIGENT_SHAVER;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_INTELLIGENT_SHAVER result: %{public}d', caseName, DEVICE_INTELLIGENT_SHAVER);
          expect(DEVICE_INTELLIGENT_SHAVER).assertEqual(0x000903);
          let DEVICE_HVAC: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_HVAC;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_HVAC result: %{public}d', caseName, DEVICE_HVAC);
          expect(DEVICE_HVAC).assertEqual(0x000A00);
          let DEVICE_AIR_PURIFIER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_AIR_PURIFIER;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_AIR_PURIFIER result: %{public}d', caseName, DEVICE_AIR_PURIFIER);
          expect(DEVICE_AIR_PURIFIER).assertEqual(0x000A01);
          let DEVICE_HUMIDIFIER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_HUMIDIFIER;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_HUMIDIFIER result: %{public}d', caseName, DEVICE_HUMIDIFIER);
          expect(DEVICE_HUMIDIFIER).assertEqual(0x000A02);
          let DEVICE_AIR_CIRCULATION_FAN: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_AIR_CIRCULATION_FAN;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_AIR_CIRCULATION_FAN result: %{public}d', caseName, DEVICE_AIR_CIRCULATION_FAN);
          expect(DEVICE_AIR_CIRCULATION_FAN).assertEqual(0x000A03);
          let DEVICE_ELECTRIC_RIDE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ELECTRIC_RIDE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_ELECTRIC_RIDE result: %{public}d', caseName, DEVICE_ELECTRIC_RIDE);
          expect(DEVICE_ELECTRIC_RIDE).assertEqual(0x000B00);
          let DEVICE_ELECTRIC_SCOOTER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ELECTRIC_SCOOTER;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_ELECTRIC_SCOOTER result: %{public}d', caseName, DEVICE_ELECTRIC_SCOOTER);
          expect(DEVICE_ELECTRIC_SCOOTER).assertEqual(0x000B01);
          let DEVICE_ELECTRIC_BICYCLE: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ELECTRIC_BICYCLE;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_ELECTRIC_BICYCLE result: %{public}d', caseName, DEVICE_ELECTRIC_BICYCLE);
          expect(DEVICE_ELECTRIC_BICYCLE).assertEqual(0x000B02);
          let DEVICE_LIGHT_FITTING: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_LIGHT_FITTING;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_LIGHT_FITTING result: %{public}d', caseName, DEVICE_LIGHT_FITTING);
          expect(DEVICE_LIGHT_FITTING).assertEqual(0x000C00);
          let DEVICE_SMART_TABLE_LAMP: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_TABLE_LAMP;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_SMART_TABLE_LAMP result: %{public}d', caseName, DEVICE_SMART_TABLE_LAMP);
          expect(DEVICE_SMART_TABLE_LAMP).assertEqual(0x000C01);
          let DEVICE_REMOTE_CONTROL: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_REMOTE_CONTROL;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_REMOTE_CONTROL result: %{public}d', caseName, DEVICE_REMOTE_CONTROL);
          expect(DEVICE_REMOTE_CONTROL).assertEqual(0x000D00);
          let DEVICE_TV_REMOTE_CONTROL: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_TV_REMOTE_CONTROL;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_TV_REMOTE_CONTROL result: %{public}d', caseName, DEVICE_TV_REMOTE_CONTROL);
          expect(DEVICE_TV_REMOTE_CONTROL).assertEqual(0x000D01);
          let DEVICE_IMAGING: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_IMAGING;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_IMAGING result: %{public}d', caseName, DEVICE_IMAGING);
          expect(DEVICE_IMAGING).assertEqual(0x000E00);
          let DEVICE_SMART_TV: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_TV;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_SMART_TV result: %{public}d', caseName, DEVICE_SMART_TV);
          expect(DEVICE_SMART_TV).assertEqual(0x000E01);
          let DEVICE_IP_CAMERA: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_IP_CAMERA;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_IP_CAMERA result: %{public}d', caseName, DEVICE_IP_CAMERA);
          expect(DEVICE_IP_CAMERA).assertEqual(0x000E02);
          let DEVICE_SCREEN_CASTER: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SCREEN_CASTER;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_SCREEN_CASTER result: %{public}d', caseName, DEVICE_SCREEN_CASTER);
          expect(DEVICE_SCREEN_CASTER).assertEqual(0x000E03);
          let DEVICE_NETWORKING: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_NETWORKING;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_NETWORKING result: %{public}d', caseName, DEVICE_NETWORKING);
          expect(DEVICE_NETWORKING).assertEqual(0x000F00);
          let DEVICE_IOT_GATEWAY: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_IOT_GATEWAY;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_IOT_GATEWAY result: %{public}d', caseName, DEVICE_IOT_GATEWAY);
          expect(DEVICE_IOT_GATEWAY).assertEqual(0x000F01);
          let DEVICE_ACCESS_CONTROL: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_ACCESS_CONTROL;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_ACCESS_CONTROL result: %{public}d', caseName, DEVICE_ACCESS_CONTROL);
          expect(DEVICE_ACCESS_CONTROL).assertEqual(0x001000);
          let DEVICE_INTELLIGENT_LOCK: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_INTELLIGENT_LOCK;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_INTELLIGENT_LOCK result: %{public}d', caseName, DEVICE_INTELLIGENT_LOCK);
          expect(DEVICE_INTELLIGENT_LOCK).assertEqual(0x001001);
          let DEVICE_SMART_KEY: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_SMART_KEY;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_SMART_KEY result: %{public}d', caseName, DEVICE_SMART_KEY);
          expect(DEVICE_SMART_KEY).assertEqual(0x001002);
          let DEVICE_VEHICLE_KEY: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_VEHICLE_KEY;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_VEHICLE_KEY result: %{public}d', caseName, DEVICE_VEHICLE_KEY);
          expect(DEVICE_VEHICLE_KEY).assertEqual(0x001003);
          let DEVICE_VEHICLE_LOCK: nearlinkConstant.DeviceClass = nearlinkConstant.DeviceClass.DEVICE_VEHICLE_LOCK;
          hilog.info(0x0000, 'testTag', '%{public}s DEVICE_VEHICLE_LOCK result: %{public}d', caseName, DEVICE_VEHICLE_LOCK);
          expect(DEVICE_VEHICLE_LOCK).assertEqual(0x001004);
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s DeviceClass error.code %{public}s,errMessage: %{public}s', caseName, JSON.stringify(error.code), JSON.stringify(error.message));
          expect().assertFail();
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })

  })
}
