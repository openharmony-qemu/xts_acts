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

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'location'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TEST_SUIT_NAME = 'ActslocationTest'
let g_context: common.UIAbilityContext;

export default function actslocationTest() {

  describe("actslocationTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async () => {
      let isWifiActive: boolean = wifiMg.isWifiActive() as boolean
      if (!isWifiActive) {
        console.info("======> wifi_test/enable wifi:");
        wifiMg.enableWifi();
        await Utils.msSleep(5000);
      }

      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info("======> Internet WifiLinkedInfo : " + JSON.stringify(data));
        console.info("======> Internet speed : " + JSON.stringify(data.linkSpeed));
        console.info("======> Internet chload : " + JSON.stringify(data.chload));
        console.info("======> Internet rssi : " + JSON.stringify(data.rssi));

        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info("======> WLAN connection established ");
        } else {
          expect().message("======> WLAN Network error").assertFail();

        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message("======> WLAN Network error").assertFail();
        } else if (data.chload >= 500) {
          console.info("======> The internet connection is poor. ");
        }
      } catch (err) {
        console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
        throw (err as Error);
      }
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b ohos.acts.location.geolocation.gnss")
      await Utils.msSleep(4000);
      g_context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'get UIAbilityContext end');
      try {
        await Utils.msSleep(2000);
        hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
            hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
            hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
          });
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
      }
      await Utils.msSleep(2000);
      await Utils.clickRequestPermission('仅使用期间允许');
      await Utils.clickRequestPermission('始终允许');
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    beforeEach(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach start');
      try {
        //await Utils.openBluetooth();
        hilog.info(domain, tag, '%{public}s', 'beforeEach end');
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
      }
    })



    /**
     * @tc.number  Sub_Location_onSatelliteStatusChange_0100
     * @tc.name  Sub_Location_onSatelliteStatusChange_0100
     * @tc.desc onSatelliteStatusChange( callback: Callback<SatelliteStatusInfo>): void  
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('Sub_Location_onSatelliteStatusChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
        console.info('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
        expect(true).assertEqual(satelliteStatusInfo != null);
        // 表示卫星个数
        let totalNumber: number = satelliteStatusInfo.satellitesNumber;
        let satelliteIds: Array<Int> = satelliteStatusInfo.satelliteIds;
        let carrierToNoiseDensitys: Array<number> = satelliteStatusInfo.carrierToNoiseDensitys;
        let altitudes: Array<number> = satelliteStatusInfo.altitudes;
        let azimuths: Array<number> = satelliteStatusInfo.azimuths;
        let carrierFrequencies: Array<number> = satelliteStatusInfo.carrierFrequencies;
        let satelliteConstellations: Array<geoLocationManager.SatelliteConstellationCategory> | undefined = satelliteStatusInfo.satelliteConstellation;
        let satelliteAdditionalInfos: Array<Int> | undefined = satelliteStatusInfo.satelliteAdditionalInfo;
        for (let i = 0; i < totalNumber; i++) {
          // 卫星的ID
          let satelliteId: number = satelliteIds[i];
          // 表示卫星的ID为 ${satelliteId} 的卫星的载波噪声功率谱密度比
          let carrierToNoiseDensity: number = carrierToNoiseDensitys[i];
          // 表示卫星的ID为 ${satelliteId} 的卫星的高度角信息
          let altitude: number = altitudes[i];
          // 表示卫星的ID为 ${satelliteId} 的卫星的方位角
          let azimuth: number = azimuths[i];
          // 表示卫星的ID为 ${satelliteId} 的卫星的载波频率
          let carrierFrequencie: number = carrierFrequencies[i];
          if (satelliteConstellations != undefined) {
            // 表示卫星的ID为 ${satelliteId} 的卫星的星座类型
            let satelliteConstellation: geoLocationManager.SatelliteConstellationCategory = satelliteConstellations[i];
          }
          if (satelliteAdditionalInfos != undefined) {
            // 表示卫星的ID为 ${satelliteId} 的卫星的附加信息；表示是否在最新的位置解算中使用了本卫星，是否具有星历数据，是否具有年历数据，是否具有载波频率信息等。
            let satelliteAdditionalInfo: number = satelliteAdditionalInfos[i];
          }
        }
      }
      try {
        geoLocationManager.onSatelliteStatusChange(gnssStatusCb);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(801);
        done();
      }
      await Utils.msSleep(1000)
      done();
    })

    /**
     * @tc.number  Sub_Location_offSatelliteStatusChange_0100
     * @tc.name  Sub_Location_offSatelliteStatusChange_0100
     * @tc.desc offSatelliteStatusChange(callback?: Callback<SatelliteStatusInfo>): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('Sub_Location_offSatelliteStatusChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
        console.info('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
        expect(true).assertEqual(satelliteStatusInfo != null);
      }
      try {
        geoLocationManager.offSatelliteStatusChange(gnssStatusCb);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(801);
        done();
      }
      await Utils.msSleep(1000)
      done();
    })

    /**
     * @tc.number  Sub_Location_onNmeaMessage_0100
     * @tc.name  Sub_Location_onNmeaMessage_0100
     * @tc.desc onNmeaMessage(callback: Callback<string>): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('Sub_Location_onNmeaMessage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let nmeaCb = (str: string): void => {
        console.info('nmeaMessage: ' + JSON.stringify(str));
        expect(true).assertEqual(str != null);
      }
      try {
        geoLocationManager.onNmeaMessage(nmeaCb);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(801);
        done();
      }
      await Utils.msSleep(1000)
      done();
    })

    /**
     * @tc.number  Sub_Location_offNmeaMessage_0100
     * @tc.name  Sub_Location_offNmeaMessage_0100
     * @tc.desc offNmeaMessage(callback: Callback<string>): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('Sub_Location_offNmeaMessage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let nmeaCb = (str: string): void => {
        console.info('nmeaMessage: ' + JSON.stringify(str));
        expect(true).assertEqual(str != null);
        done();
      }
      try {
        geoLocationManager.offNmeaMessage(nmeaCb);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(801);
        done();
      }
      await Utils.msSleep(1000)
      done();
    })

    /**
     * @tc.name   SUB_geolocation_CachedGnssLocationsRequest_test_001
     * @tc.number SUB_geolocation_CachedGnssLocationsRequest_test_001
     * @tc.desc   Using the CachedGnssLocationsRequest method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_geolocation_CachedGnssLocationsRequest_test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CachedGnssLocationsRequest: geoLocationManager.CachedGnssLocationsRequest = {
        "reportingPeriodSec": 1000,
        "wakeUpCacheQueueFull": true
      };
      try {
        if (CachedGnssLocationsRequest.reportingPeriodSec > 0) {
          expect(typeof CachedGnssLocationsRequest.reportingPeriodSec).assertEqual("int");
          expect(typeof CachedGnssLocationsRequest.wakeUpCacheQueueFull).assertEqual("boolean");
          console.info('---SUB_geolocation_CachedGnssLocationsRequest_test_001 catch end---success');
          done();
        } else {
          console.info('---SUB_geolocation_CachedGnssLocationsRequest_test_001 catch end---fail')
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.info('---SUB_geolocation_CachedGnssLocationsRequest_test_001 catch end---err:' + err.code);
        expect().assertFail();
        done();
      }
      console.info('---SUB_geolocation_CachedGnssLocationsRequest_test_001 end---');
      done();
    });

  })
}