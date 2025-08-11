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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function UseEffectIndexTest() {
  describe('UseEffectIndexTest', () => {
    beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");

      await UtilsTest.msSleep(4000);
      await startAbility("com.open.harmony.acetest14", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async () => {
      console.info("UseEffectIndexTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/useEffect/useEffectIndex",
      }
      try {
        const alphabetIndexer = AppStorage.get<Router>("router") as Router
        alphabetIndexer.clear();
        let pages = alphabetIndexer.getState();
        console.info("get UseEffectIndexTest state pages: " + JSON.stringify(pages));
        if (!("UseEffectIndexTest" == pages.name)) {
          console.info("get UseEffectIndexTest state pages.name: " + JSON.stringify(pages.name));
          alphabetIndexer.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push UseEffectIndexTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number
    * @tc.name      GetWindowWidthBreakpoint_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UseEffectIndex_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('[UseEffectIndex] START');
      let strJson1 = inspector.getInspectorByKey('windowEffect');
      let strJson2 = inspector.getInspectorByKey('windowDefault');
      console.info("[UseEffectIndex] JSON.parseJsonElement(strJson1) is : " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs')));
      console.info("[UseEffectIndex] JSON.parseJsonElement(strJson2) is : " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('useEffectType')).assertEqual('EffectType.WINDOW_EFFECT');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('useEffectType')).assertEqual('EffectType.DEFAULT');
      console.info('[UseEffectIndex] END');
      done();
    });
  })
}

