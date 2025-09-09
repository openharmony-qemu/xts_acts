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

export default function comSizeAbilityTest_17() {
  describe('comSizeAbilityTest_17', () => {
    beforeAll(() => {
      console.info("comSizeAbilityTest_17 beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(() => {
      console.info("comSizeAbilityTest_17 beforeEach start")
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/comSizeAbility/comSizeAbilityTest_17'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info("get comSizeAbilityTest_17 state pages: " + JSON.stringify(pages))
        if (!("comSizeAbilityTest" == pages.name)) {
          console.info("get comSizeAbilityTest_17 state pages.name: " + JSON.stringify(pages.name))
          routerInstance.pushUrl(options)


        }
      } catch (err) {
        console.error("push comSizeAbilityTest_17 page error: " + err)
        expect().assertFail()
      }
    })

    /*
     * @tc.number    comSizeAbilityTestJsunit_static_44
     * @tc.name      comSizeAbilityTestJsunit_static_44
     * @tc.desc      comSizeAbilityTestJsunit_static_44
     * @tc.level     2
     */
    it('comSizeAbilityTestJsunit_static_44', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('comSizeAbilityTestJsunit_static_44 START')
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('comSizeAbilityTest_17_to_1'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);


        let button = await driver.findComponent(ON.id('TextPicker_Size'));
        let rect = await (button!.getBounds() as Promise<Rect>)
        console.info("[comSizeAbilityTestJsunit_static_44] component rect is: " + JSON.stringify(rect))


        await CommonFunc.sleep(1000);


        console.info('[comSizeAbilityTestJsunit_static_44] END')
        await CommonFunc.sleep(1000);
        done()
      } catch (err: Error) {
        expect().assertFail();
      }
    })

    /*
     * @tc.number    comSizeAbilityTestJsunit_static_45
     * @tc.name      comSizeAbilityTestJsunit_static_45
     * @tc.desc      comSizeAbilityTestJsunit_static_45
     * @tc.level     2
     */
    it('comSizeAbilityTestJsunit_static_45', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('comSizeAbilityTestJsunit_static_45 START')
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('comSizeAbilityTest_17_to_2'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);


        let button = await driver.findComponent(ON.id('Text_Size'));
        let rect = await (button!.getBounds() as Promise<Rect>)
        console.info("[comSizeAbilityTestJsunit_static_45] component rect is: " + JSON.stringify(rect))


        await CommonFunc.sleep(1000);


        console.info('[comSizeAbilityTestJsunit_static_45] END')
        await CommonFunc.sleep(1000);
        done()
      } catch (err: Error) {
        expect().assertFail();
      }
    })

    /*
     * @tc.number    comSizeAbilityTestJsunit_static_46
     * @tc.name      comSizeAbilityTestJsunit_static_46
     * @tc.desc      comSizeAbilityTestJsunit_static_46
     * @tc.level     2
     */
    it('comSizeAbilityTestJsunit_static_46', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('comSizeAbilityTestJsunit_static_46 START')
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('comSizeAbilityTest_17_to_3'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);


        let button = await driver.findComponent(ON.id('TextInput_Size'));
        let rect = await (button!.getBounds() as Promise<Rect>)
        console.info("[comSizeAbilityTestJsunit_static_46] component rect is: " + JSON.stringify(rect))


        await CommonFunc.sleep(1000);


        console.info('[comSizeAbilityTestJsunit_static_46] END')
        await CommonFunc.sleep(1000);
        done()
      } catch (err: Error) {
        expect().assertFail();
      }
    })
  })
}