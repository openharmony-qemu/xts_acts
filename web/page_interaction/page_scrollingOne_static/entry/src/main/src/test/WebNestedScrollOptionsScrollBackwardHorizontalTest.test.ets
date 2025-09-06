/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import UtilsHelpers from './UtilsHelper'
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import deviceInfo from '@ohos.deviceInfo'


let testAbilityContext:common.UIAbilityContext;

export default function webNestedScrollOptionsScrollBackwardHorizontalTest() {

  describe('WebNestedScrollOptionsScrollBackwardHorizontalTest', () => {

    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.pageInteractionTwoscrollingOne.test.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("componentLifeCycleTestOne beforeEach start");
    })

    /*
    * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0100
    * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontalStatic001
    * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 3
    */
    it('testNestedScrollOptionsScrollBackwardHorizontalStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(5000)
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal001", 10)
      let webRect = UtilsHelpers.getComponentRect('RowSize');
      await Utils.msSleep(2000)
      let X = Utils.getRectHorizontalCenterX(webRect).toInt();
      let Y = Utils.getRectVerticalCenterY(webRect).toInt();
      let driver = Driver.create();
      let deviceType: string = deviceInfo.deviceType;
      await Utils.msSleep(5000)
      if (deviceType == '2in1') {
        driver.swipe(X - 60, Y, X + 60, Y);
      } else {
        driver.swipe(X - 100, Y, X + 100, Y);
      }
      await Utils.msSleep(2000)
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal001", true, 9001, done);
      inspector.sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
      done();
    })

    /*
    * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0200
    * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontalStatic002
    * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 3
    */
    it('testNestedScrollOptionsScrollBackwardHorizontalStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal002", 10)
      let webRect = UtilsHelpers.getComponentRect('RowSize');
      await Utils.msSleep(2000)
      let X = Utils.getRectHorizontalCenterX(webRect).toInt();
      let Y = Utils.getRectVerticalCenterY(webRect).toInt();
      let driver = Driver.create();
      let deviceType: string = deviceInfo.deviceType;
      await Utils.msSleep(5000)
      if (deviceType == '2in1') {
        driver.swipe(X - 60, Y, X + 60, Y);
      } else {
        driver.swipe(X - 100, Y, X + 100, Y);
      }
      await Utils.msSleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal002", true, 9002, done);
      inspector.sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
      done();
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0300
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontalStatic003
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 3
     */
    it('testNestedScrollOptionsScrollBackwardHorizontalStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal003", 10)
      let webRect = UtilsHelpers.getComponentRect('RowSize');
      await Utils.msSleep(2000)
      let X = Utils.getRectHorizontalCenterX(webRect).toInt();
      let Y = Utils.getRectVerticalCenterY(webRect).toInt();
      let driver = Driver.create();
      let deviceType: string = deviceInfo.deviceType;
      await Utils.msSleep(5000)
      if (deviceType == '2in1') {
        driver.swipe(X - 60, Y, X + 60, Y);
      } else {
        driver.swipe(X - 100, Y, X + 100, Y);
      }
      await Utils.msSleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal003", true, 9003, done);
      inspector.sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0400
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal004
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 3
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal004", 10)
      let webRect = UtilsHelpers.getComponentRect('RowSize');
      await Utils.msSleep(2000)
      let X = Utils.getRectHorizontalCenterX(webRect).toInt();
      let Y = Utils.getRectVerticalCenterY(webRect).toInt();
      let driver = Driver.create();
      let deviceType: string = deviceInfo.deviceType;
      await Utils.msSleep(5000)
      if (deviceType == '2in1') {
        driver.swipe(X - 60, Y, X + 60, Y);
      } else {
        driver.swipe(X - 100, Y, X + 100, Y);
      }
      await Utils.msSleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal004", true, 9004, done);
      inspector.sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
      done();
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0500
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal005
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 3
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal005", 10)
      let webRect = UtilsHelpers.getComponentRect('RowSize');
      await Utils.msSleep(2000)
      let X = Utils.getRectHorizontalCenterX(webRect).toInt();
      let Y = Utils.getRectVerticalCenterY(webRect).toInt();
      let driver = Driver.create();
      let deviceType: string = deviceInfo.deviceType;
      await Utils.msSleep(5000);
      if (deviceType == '2in1') {
        driver.swipe(X - 60, Y, X + 60, Y);
      } else {
        driver.swipe(X - 100, Y, X + 100, Y);
      }
      await Utils.msSleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal005", true, 9005, done);
      inspector.sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
      done();
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0600
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal006
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 3
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal006", 10)
      let webRect = UtilsHelpers.getComponentRect('RowSize');
      await Utils.msSleep(2000)
      let X = Utils.getRectHorizontalCenterX(webRect).toInt();
      let Y = Utils.getRectVerticalCenterY(webRect).toInt();
      let driver = Driver.create();
      let deviceType: string = deviceInfo.deviceType;
      await Utils.msSleep(5000);
      if (deviceType == '2in1') {
        driver.swipe(X - 60, Y, X + 60, Y);
      } else {
        driver.swipe(X - 100, Y, X + 100, Y);
      }
      await Utils.msSleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal006", true, 9006, done);
      inspector.sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
      done();
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0700
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal007
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 3
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal007", 10)
      let webRect = UtilsHelpers.getComponentRect('RowSize');
      await Utils.msSleep(2000)
      let X = Utils.getRectHorizontalCenterX(webRect).toInt();
      let Y = Utils.getRectVerticalCenterY(webRect).toInt();
      let driver = Driver.create();
      let deviceType: string = deviceInfo.deviceType;
      await Utils.msSleep(5000);
      if (deviceType == '2in1') {
        driver.swipe(X - 60, Y, X + 60, Y);
      } else {
        driver.swipe(X - 100, Y, X + 100, Y);
      }
      await Utils.msSleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal007", true, 9007, done);
      inspector.sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
      done();
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0800
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal008
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 3
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal008", 10)
      let webRect = UtilsHelpers.getComponentRect('RowSize');
      await Utils.msSleep(2000)
      let X = Utils.getRectHorizontalCenterX(webRect).toInt();
      let Y = Utils.getRectVerticalCenterY(webRect).toInt();
      let driver = Driver.create();
      let deviceType: string = deviceInfo.deviceType;
      await Utils.msSleep(5000);
      if (deviceType == '2in1') {
        driver.swipe(X - 60, Y, X + 60, Y);
      } else {
        driver.swipe(X - 100, Y, X + 100, Y);
      }
      await Utils.msSleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal008", true, 9008, done);
      inspector.sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

  })
}
