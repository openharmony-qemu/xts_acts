'use static';
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach } from "@ohos/hypium-binary/src/main/indexStatic";
import commonEventManager from '@ohos.commonEventManager'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, RecordData } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import notificationManager from '@ohos.notificationManager'
import notificationSubscribe from '@ohos.notificationSubscribe'
import wantAgent from '@ohos.app.ability.wantAgent'
import wantagent from '@ohos.app.ability.wantAgent'
import image from '@ohos.multimedia.image'
import common from '@ohos.app.ability.common';
import {
  Component,
  Driver,
  ON,
  On,
  MatchPattern,
  MouseButton,
  WindowMode,
  UIElementInfo,
  UiDirection,
  PointerMatrix,
  DisplayRotation
} from '@ohos.UiTest'
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import wifiMg from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let testAbilityContext: common.UIAbilityContext;
let bundleName: string = 'com.example.actsnotificationmessageaggregationtest.static'
let count: int = 0;


export default function actsNotificationMessageAggregationTest():void{
  describe('actsNotificationMessageAggregationTest', (): void => {
    let TAG :string = 'actsNotificationMessageAggregationTest ===>'
    hilog.info(domain, TAG, '%{public}s', ' START')

    beforeAll(async() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundleName )
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
      await Utils.msSleep(2000)
    })


    /**
     * @tc.name   SUB_Notification_Ans_Message_Aggregation_static_1300
     * @tc.number SUB_Notification_Ans_Message_Aggregation_static_1300
     * @tc.desc   【强基】【setNotificationSwitch】三方应用调用请求接口，报错202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Notification_Ans_Message_Aggregation_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'SUB_Notification_Ans_Message_Aggregation_static_1300'
       try{
         let switchName: string = 'LOGISTICS';
         let switchState: boolean = true;
         let userId: int = 100;

         notificationManager.setNotificationSwitch(switchName, switchState, userId).then(() => {
           console.info(Tag+'setNotificationSwitch success');
           expect(false).assertTrue()
           done()
         }).catch((e: Error): void => {
           let err :BusinessError = e as BusinessError
           console.error(Tag+`setNotificationSwitch failed, code is ${err.code}, message is ${err.message}`);
           if (err?.code == 202) {
             expect(err?.code).assertEqual(202)
             done()
           } else {
             expect(false).assertTrue()
             done()
           }
         });
       }catch(err){
         console.error(Tag+` failed, code is ${err.code}, message is ${err.message}`);
         expect(false).assertTrue()
         done()
       }
      })

    /**
     * @tc.name   SUB_Notification_Ans_Message_Aggregation_static_2300
     * @tc.number SUB_Notification_Ans_Message_Aggregation_static_2300
     * @tc.desc   【强基】【getNotificationSwitch】三方应用调用请求接口，报错202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Notification_Ans_Message_Aggregation_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'SUB_Notification_Ans_Message_Aggregation_static_2300'
        try{
          let switchName: string = 'DEAL';
          let switchState: boolean = true;
          let userId: int = 100;

          notificationManager.getNotificationSwitch(switchName, userId).then((data:notificationManager.SwitchState) => {
            console.info(Tag+'getNotificationSwitch success');
            expect(false).assertTrue()
            done()
          }).catch((e: Error): void => {
            let err :BusinessError = e as BusinessError
            console.error(Tag+`getNotificationSwitch failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code == 202) {
              expect(err?.code).assertEqual(202)
              done()
            } else {
              expect(false).assertTrue()
              done()
            }
          });
        }catch(err){
          console.error(Tag+` failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        }
      })

  })
}