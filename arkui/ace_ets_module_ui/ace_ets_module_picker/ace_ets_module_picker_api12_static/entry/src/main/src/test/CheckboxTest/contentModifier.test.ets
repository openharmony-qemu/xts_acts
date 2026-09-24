'use static';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function contentModifier() {
  describe('contentModifier', () => {

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Checkbox/contentModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get contentModifier state success " + JSON.stringify(pages));
        if (!("contentModifier" == pages.name)) {
          console.info("get contentModifier state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.push(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
          // console.info("push contentModifier page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push contentModifier page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("contentModifier after each called");
    });

    /**
     * @tc.number   contentModifierTest_static_0100
     * @tc.name     contentModifierTest_static_0100
     * @tc.desc     contentModifierTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('contentModifierTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> =>    {
      console.info('contentModifierText_static_0100 START');
      let strJson = inspector.getInspectorByKey('ContentModifierMessage');
      console.info("contentModifierText_static_0100 component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("contentModifierText_static_0100 component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[contentModifierText_static_0100] title: " + obj.getElement('$attrs').getString('stroke'));
      expect(obj.getElement('$attrs').getString('stroke')).assertEqual("#FFFF0000");
      console.info('contentModifierText_static_0100 END');
      done();
    });
  })
}
