'use static';
/**
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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
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
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function SymbolGlyphTest() {
  describe("SymbolGlyphTest", () => {

    beforeEach(async (): Promise<void> => {
      console.info("SymbolGlyphTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SymbolGlyph/SymbolGlyph",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SymbolGlyphTest state pages:" + JSON.stringify(pages));
        if (!("SymbolGlyph" == pages.name)) {
          console.info("get SymbolGlyphTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SymbolGlyphTest page error:" + err);
      }
      console.info("SymbolGlyphTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SymbolGlyphTest err: ' + JSON.stringify(err));
      }
      console.info("SymbolGlyphTest after each called");
    });

    /**
     * @tc.number   SymbolGlyphTest_static_001
     * @tc.name     SymbolGlyphTest_static_001
     * @tc.desc     SymbolGlyphTest_static_001
     * @tc.level    Level.LEVEL0
     */
    it("SymbolGlyphTest_static_001", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[SymbolGlyphTest_static_001] START");
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SymbolGlyphTest err: ' + JSON.stringify(err));
      }
      let AppearSymbolEffect = inspector.getInspectorByKey("AppearSymbolEffect");
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SymbolGlyphTest err: ' + JSON.stringify(err));
      }
      console.info("AppearSymbolEffect-----" +
      JSON.parseJsonElement(AppearSymbolEffect).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(AppearSymbolEffect).getElement('$attrs').getString('content'))
        .assertEqual("AppearSymbolEffect:true");
      console.info("[SymbolGlyphTest_static_001] END");
      done();
    });

    /**
     * @tc.number   SymbolGlyphTest_static_002
     * @tc.name     SymbolGlyphTest_static_002
     * @tc.desc     SymbolGlyphTest_static_002
     * @tc.level    Level.LEVEL0
     */
    it("SymbolGlyphTest_static_002", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[SymbolGlyphTest_static_002] START");
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SymbolGlyphTest err: ' + JSON.stringify(err));
      }
      let DisappearSymbolEffect = inspector.getInspectorByKey("DisappearSymbolEffect");
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SymbolGlyphTest err: ' + JSON.stringify(err));
      }
      console.info("DisappearSymbolEffect-----" +
      JSON.parseJsonElement(DisappearSymbolEffect).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(DisappearSymbolEffect).getElement('$attrs').getString('content'))
        .assertEqual("DisappearSymbolEffect:true");
      console.info("[SymbolGlyphTest_static_002] END");
      done();
    });

    /**
     * @tc.number   SymbolGlyphTest_static_003
     * @tc.name     SymbolGlyphTest_static_003
     * @tc.desc     SymbolGlyphTest_static_003
     * @tc.level    Level.LEVEL0
     */
    it("SymbolGlyphTest_static_003", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[SymbolGlyphTest_static_003] START");
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SymbolGlyphTest err: ' + JSON.stringify(err));
      }
      let ReplaceSymbolEffect = inspector.getInspectorByKey("ReplaceSymbolEffect");
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SymbolGlyphTest err: ' + JSON.stringify(err));
      }
      console.info("ReplaceSymbolEffect-----" +
      JSON.parseJsonElement(ReplaceSymbolEffect).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(ReplaceSymbolEffect).getElement('$attrs').getString('content'))
        .assertEqual("ReplaceSymbolEffect:true");
      console.info("[SymbolGlyphTest_static_003] END");
      done();
    });

    /**
     * @tc.number   SymbolGlyphTest_static_004
     * @tc.name     SymbolGlyphTest_static_004
     * @tc.desc     SymbolGlyphTest_static_004
     * @tc.level    Level.LEVEL0
     */
    it("SymbolGlyphTest_static_004", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[SymbolGlyphTest_static_004] START");
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SymbolGlyphTest err: ' + JSON.stringify(err));
      }
      let BounceSymbolEffect = inspector.getInspectorByKey("BounceSymbolEffect");
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SymbolGlyphTest err: ' + JSON.stringify(err));
      }
      console.info("BounceSymbolEffect-----" +
      JSON.parseJsonElement(BounceSymbolEffect).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(BounceSymbolEffect).getElement('$attrs').getString('content'))
        .assertEqual("BounceSymbolEffect:true");
      console.info("[SymbolGlyphTest_static_004] END");
      done();
    });
  })
}
