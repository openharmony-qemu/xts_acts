'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium-binary/src/main/indexStatic'
import emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function doubleSidedTest() {
  describe('commonColorModeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("doubleSidedTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("doubleSidedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/doubleSided',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get doubleSidedTest state pages:" + JSON.stringify(pages));
        if (!("doubleSided" == pages.name)) {
          console.info("get doubleSidedTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push doubleSidedTest page error:" + err);
      }
      console.info("doubleSidedTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("commonColorMode after each called");
    });

    /**
     * @tc.number   doubleSideJsunit_static_0100
     * @tc.name     doubleSideJsunit_static_0100
     * @tc.desc     doubleSideJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('doubleSideJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the blendMode component
      console.info('[doubleSideJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('doubleSidedTrue');
      console.info("[doubleSideJsunit_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson)).not().assertUndefined();
      console.info('[doubleSideJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   doubleSideJsunit_static_0200
     * @tc.name     doubleSideJsunit_static_0200
     * @tc.desc     doubleSideJsunit_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('doubleSideJsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the blendMode component
      console.info('[doubleSideJsunit_static_0200] START');
      let strJson = inspector.getInspectorByKey('doubleSidedFalse');
      console.info("[doubleSideJsunit_static_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson)).not().assertUndefined();
      console.info('[doubleSideJsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   doubleSideJsunit_static_0300
     * @tc.name     doubleSideJsunit_static_0300
     * @tc.desc     doubleSideJsunit_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('doubleSideJsunit_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the blendMode component
      console.info('[doubleSideJsunit_static_0300] START');
      let strJson = inspector.getInspectorByKey('doubleSidedUndefined');
      console.info("[doubleSideJsunit_static_0300] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson)).not().assertUndefined();
      console.info('[doubleSideJsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   doubleSideJsunit_static_0400
     * @tc.name     doubleSideJsunit_static_0400
     * @tc.desc     doubleSideJsunit_static_0400
     * @tc.level    Level.LEVEL2
     */
    it('doubleSideJsunit_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the blendMode component
      console.info('[doubleSideJsunit_static_0400] START');
      let strJson = inspector.getInspectorByKey('doubleSidedDefault');
      console.info("[doubleSideJsunit_static_0400] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson)).not().assertUndefined();
      console.info('[doubleSideJsunit_static_0400] END');
      done();
    });

    /**
     * @tc.number   doubleSideJsunit_static_0500
     * @tc.name     doubleSideJsunit_static_0500
     * @tc.desc     doubleSideJsunit_static_0500
     * @tc.level    Level.LEVEL2
     */
    it('doubleSideJsunit_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the blendMode component
      console.info('[doubleSideJsunit_static_0500] START');
      let strJson = inspector.getInspectorByKey('doubleSidedChained');
      console.info("[doubleSideJsunit_static_0500] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson)).not().assertUndefined();
      console.info('[doubleSideJsunit_static_0500] END');
      done();
    });
    
  })
}
