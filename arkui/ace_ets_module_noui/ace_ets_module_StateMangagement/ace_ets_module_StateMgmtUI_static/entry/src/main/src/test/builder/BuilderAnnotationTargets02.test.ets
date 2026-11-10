'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function BuilderAnnotationTargets02Test(): void {
  describe('BuilderAnnotationTargets02Test', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("BuilderAnnotationTargets02Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/builder/BuilderAnnotationTargets02",
      }
      try {
        const BuilderAnnotationTargets02 = AppStorage.get<Router>("router") as Router
        BuilderAnnotationTargets02.clear();
        let pages: router.RouterState = BuilderAnnotationTargets02.getState();
        console.info("get BuilderAnnotationTargets02 state pages: " + JSON.stringify(pages));
        if (!("BuilderAnnotationTargets02" == pages.name)) {
          console.info("get BuilderAnnotationTargets02 state pages.name: " + JSON.stringify(pages.name));
          BuilderAnnotationTargets02.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BuilderAnnotationTargets02 page error:" + err);
      }
      console.info("BuilderAnnotationTargets02Test beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("BuilderAnnotationTargets02Test after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_BuilderAnnotationTargets02_static_0100
     * @tc.name     SUB_ARKUI_BuilderAnnotationTargets02_static_0100
     * @tc.desc     Verify @Builder interface method count() renders initial text correctly
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_BuilderAnnotationTargets02_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_BuilderAnnotationTargets02_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('builderAnnotationTargets02_text');
      let content: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
      console.info('[SUB_ARKUI_BuilderAnnotationTargets02_static_0100] content: ' + content);
      expect(content).assertEqual('UseStateVarByReference: 3');
      console.info('[SUB_ARKUI_BuilderAnnotationTargets02_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_BuilderAnnotationTargets02_static_0200
     * @tc.name     SUB_ARKUI_BuilderAnnotationTargets02_static_0200
     * @tc.desc     Verify clicking 'Click me' button updates a=4 and re-renders count result to 12
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_BuilderAnnotationTargets02_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_BuilderAnnotationTargets02_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('builderAnnotationTargets02'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('builderAnnotationTargets02_text');
      let content: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
      console.info('[SUB_ARKUI_BuilderAnnotationTargets02_static_0200] content after click: ' + content);
      expect(content).assertEqual('UseStateVarByReference: 12');
      console.info('[SUB_ARKUI_BuilderAnnotationTargets02_static_0200] END');
      done();
    });
  });
}
