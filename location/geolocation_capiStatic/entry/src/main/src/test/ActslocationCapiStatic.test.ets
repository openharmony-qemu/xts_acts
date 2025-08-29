/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import geoLocationManager from '@ohos.geoLocationManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag:string='location'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TEST_SUIT_NAME='ActslocationTest'
let g_context: common.UIAbilityContext;

export default function actslocationTest() {

    describe("actslocationTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            try {
                await Utils.msSleep(2000);
                hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
                g_context = Hypium.get('Context') as common.UIAbilityContext;
                let atManager = abilityAccessCtrl.createAtManager();
                let arr: Array<Permissions> = new Array<Permissions>();
                arr.push('ohos.permission.LOCATION', 'ohos.permission.LOCATION_IN_BACKGROUND','ohos.permission.APPROXIMATELY_LOCATION')
                atManager.requestPermissionsFromUser(g_context, arr,
                    (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
                        hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
                        hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
                        hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
                    });
            } catch (err: BusinessError) {
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('仅使用期间允许');
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        beforeEach(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach start');
            try {
                //await Utils.openBluetooth();
                hilog.info(domain, tag, '%{public}s', 'beforeEach end');
            } catch (err: BusinessError) {
                hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
            }
        })

        /*
         * @tc.number: testGeolocationManagerConfig001
         * @tc.name: testGeolocationManagerConfig001
         * @tc.desc: Test Location API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it('testGeolocationManagerConfig001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2,
            async(done:()=>void):Promise<void>=>{
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.UNSET==0x300)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.NAVIGATION ==0x301)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.TRAJECTORY_TRACKING ==0x302)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.CAR_HAILING ==0x303)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.DAILY_LIFE_SERVICE ==0x304)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.NO_POWER ==0x305)

                expect(true).assertEqual(geoLocationManager.LocationSourceType.GNSS==1)
                expect(true).assertEqual(geoLocationManager.LocationSourceType.NETWORK==2)
                expect(true).assertEqual(geoLocationManager.LocationSourceType.INDOOR ==3)
                expect(true).assertEqual(geoLocationManager.LocationSourceType.RTK ==4)

                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.UNSET ==0x200)
                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.ACCURACY==0X201)
                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.LOW_POWER==0x202)
                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.FIRST_FIX == 0x203)

                expect(true).assertEqual(geoLocationManager.LocatingPriority.PRIORITY_LOCATING_SPEED == 0x502)
                expect(true).assertEqual(geoLocationManager.LocatingPriority.PRIORITY_ACCURACY == 0x501)

                expect(true).assertEqual(geoLocationManager.UserACtivityScenario.NAVIGATION==0X401)
                expect(true).assertEqual(geoLocationManager.UserACtivityScenario.SPORT == 0x402)
                expect(true).assertEqual(geoLocationManager.UserACtivityScenario.TRANSPORT ==0X403)
                expect(true).assertEqual(geoLocationManager.UserACtivityScenario.DAILY_LIFE_SERVICE == 0x404)
                done();


       })

    })
}