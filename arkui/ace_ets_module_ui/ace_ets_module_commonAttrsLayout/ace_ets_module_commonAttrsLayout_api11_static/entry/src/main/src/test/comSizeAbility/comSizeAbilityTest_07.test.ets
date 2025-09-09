/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import componentUtils from '@ohos.arkui.componentUtils';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Rect } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function comSizeAbilityTest_07() {
  describe('comSizeAbilityTest_07', () => {
    beforeAll(() => {
      console.info("comSizeAbilityTest_07 beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(() => {
      console.info("comSizeAbilityTest_07 beforeEach start")
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/comSizeAbility/comSizeAbilityTest_07'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info("get comSizeAbilityTest_07 state pages: " + JSON.stringify(pages))
        if (!("comSizeAbilityTest" == pages.name)) {
          console.info("get comSizeAbilityTest_07 state pages.name: " + JSON.stringify(pages.name))
          routerInstance.pushUrl(options)


        }
      } catch (err) {
        console.error("push comSizeAbilityTest_07 page error: " + err)
        expect().assertFail()
      }
    })

    /*
     * @tc.number    comSizeAbilityTestJsunit_static_20
     * @tc.name      comSizeAbilityTestJsunit_static_20
     * @tc.desc      comSizeAbilityTestJsunit_static_20
     * @tc.level     2
     */
    it('comSizeAbilityTestJsunit_static_20', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('comSizeAbilityTestJsunit_static_20 START')
        await CommonFunc.sleep(1000);
        if (AppStorage.get<number>("winLeft") == 0) {
          let driver = Driver.create();
          let button1 = await driver.findComponent(ON.id('btn_MenuItemGroup'))
          await (button1?.click() as Promise<void>);
          await CommonFunc.sleep(2000)


          await CommonFunc.sleep(1000);


        }
        console.info('[comSizeAbilityTestJsunit_static_20] END')
        await CommonFunc.sleep(1000);
        done()
      } catch (err: Error) {
        expect().assertFail();
      }
    })

    /*
     * @tc.number    comSizeAbilityTestJsunit_static_21
     * @tc.name      comSizeAbilityTestJsunit_static_21
     * @tc.desc      comSizeAbilityTestJsunit_static_21
     * @tc.level     2
     */
    it('comSizeAbilityTestJsunit_static_21', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('comSizeAbilityTestJsunit_static_21 START')
        await CommonFunc.sleep(1000);
        if (AppStorage.get<number>("winLeft") == 0) {
          let driver = Driver.create();
          let button1 = await driver.findComponent(ON.id('btn_MenuItem'))
          await (button1?.click() as Promise<void>);
          await CommonFunc.sleep(2000);


          await CommonFunc.sleep(1000);


        }
        console.info('[comSizeAbilityTestJsunit_static_21] END')
        await CommonFunc.sleep(1000);
        done()
      } catch (err: Error) {
        expect().assertFail();
      }
    })

    /*
     * @tc.number    comSizeAbilityTestJsunit_static_22
     * @tc.name      comSizeAbilityTestJsunit_static_22
     * @tc.desc      comSizeAbilityTestJsunit_static_22
     * @tc.level     2
     */
    it('comSizeAbilityTestJsunit_static_22', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('comSizeAbilityTestJsunit_static_22 START')
        await CommonFunc.sleep(1000);
        if (AppStorage.get<number>("winLeft") == 0) {
          let driver = Driver.create();
          let button1 = await driver.findComponent(ON.id('btn_Menu'))
          await (button1?.click() as Promise<void>);
          await CommonFunc.sleep(2000);


          await CommonFunc.sleep(1000);


          await CommonFunc.sleep(1000);
          await (driver?.click(Math.round(AppStorage.get<number>("winLeft") as number + UIContext.getFocusedUIContext()!.vp2px(200)) as Int,
            Math.round(AppStorage.get<number>("winTop") as number + UIContext.getFocusedUIContext()!.vp2px(200)) as Int) as Promise<void>);
          await CommonFunc.sleep(1000);
        }
        console.info('[comSizeAbilityTestJsunit_static_22] END')
        await CommonFunc.sleep(1000);
        done()
      } catch (err: Error) {
        expect().assertFail();
      }
    })
  })
}