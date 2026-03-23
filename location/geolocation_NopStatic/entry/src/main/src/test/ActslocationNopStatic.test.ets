/**
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import geoLocationManager from '@ohos.geoLocationManager';
import notificationManager from '@ohos.notificationManager';
import { canIUse } from '@internal.full.global';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import wifiMg from '@ohos.wifiManager';

let domain: int = 0x0000;
let tag: string = 'location';
const TEST_SUIT_NAME = 'ActslocationTest'
let g_context: common.UIAbilityContext;

export default function actslocationTest() {
  describe('actslocationTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number  Sub_Location_onLocationChange_0100
     * @tc.name  Sub_Location_onLocationChange_0100
     * @tc.desc  onLocationChange(request: LocationRequest | ContinuousLocationRequest, callback: Callback<Location>): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('Sub_Location_onLocationChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let request: geoLocationManager.ContinuousLocationRequest = {
        'interval': 1,
        'locationScenario': geoLocationManager.UserActivityScenario.NAVIGATION
      };
      let locationCallback = (location: geoLocationManager.Location): void => {
        console.info('locationCallback: data: ' + JSON.stringify(location));
        expect(true).assertEqual(location != null);
      };
      try {
        geoLocationManager.onLocationChange(request, locationCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(201);
      }
      await Utils.msSleep(1000)
      done();
    })

    /**
     * @tc.number  Sub_Location_offLocationChange_0100
     * @tc.name  Sub_Location_offLocationChange_0100
     * @tc.desc  offLocationChange(callback?: Callback<Location>): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('Sub_Location_offLocationChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      let requestInfo: geoLocationManager.LocationRequest = {
        'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
        'scenario': geoLocationManager.LocationRequestScenario.UNSET,
        'timeInterval': 1,
        'distanceInterval': 0,
        'maxAccuracy': 0
      };
      let locationChange = (location: geoLocationManager.Location): void => {
        console.info('locationChange: data: ' + JSON.stringify(location));
        expect(true).assertEqual(location != null);
      };
      try {
        geoLocationManager.offLocationChange(locationChange);
      } catch (err) {
        err = err as BusinessError;
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(201);
      }
      await Utils.msSleep(1000)
      done();
    })







  })
}