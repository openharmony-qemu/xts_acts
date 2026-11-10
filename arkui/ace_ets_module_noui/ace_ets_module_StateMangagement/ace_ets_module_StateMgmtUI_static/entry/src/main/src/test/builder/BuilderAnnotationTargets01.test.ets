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

export default function BuilderAnnotationTargets01Test(): void {
  describe('BuilderAnnotationTargets01Test', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("BuilderAnnotationTargets01Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/builder/BuilderAnnotationTargets01",
      }
      try {
        const BuilderAnnotationTargets01 = AppStorage.get<Router>("router") as Router
        BuilderAnnotationTargets01.clear();
        let pages: router.RouterState = BuilderAnnotationTargets01.getState();
        console.info("get BuilderAnnotationTargets01 state pages: " + JSON.stringify(pages));
        if (!("BuilderAnnotationTargets01" == pages.name)) {
          console.info("get BuilderAnnotationTargets01 state pages.name: " + JSON.stringify(pages.name));
          BuilderAnnotationTargets01.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BuilderAnnotationTargets01 page error:" + err);
      }
      console.info("BuilderAnnotationTargets01Test beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("BuilderAnnotationTargets01Test after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_BuilderAnnotationTargets01_static_0100
     * @tc.name     SUB_ARKUI_BuilderAnnotationTargets01_static_0100
     * @tc.desc     Verify global @Builder function buildWithLambda renders text and button correctly
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_BuilderAnnotationTargets01_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_BuilderAnnotationTargets01_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJSON: string = inspector.getInspectorByKey('buildWithLambda_text');
      let content: string = JSON.parseJsonElement(strJSON).getElement('$attrs').getString('content');
      console.info('[SUB_ARKUI_BuilderAnnotationTargets01_static_0200] before click: ' + content);
      expect(content).assertEqual('Global Builder with Lambda');
      console.info('[SUB_ARKUI_BuilderAnnotationTargets01_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_BuilderAnnotationTargets01_static_0200
     * @tc.name     SUB_ARKUI_BuilderAnnotationTargets01_static_0200
     * @tc.desc     Verify clicking Action button in global @Builder triggers model.increment and updates count
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_BuilderAnnotationTargets01_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_BuilderAnnotationTargets01_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let strBefore: string = inspector.getInspectorByKey('builderLambdaModel_text1');
      let contentBefore: string = JSON.parseJsonElement(strBefore).getElement('$attrs').getString('content');
      console.info('[SUB_ARKUI_BuilderAnnotationTargets01_static_0200] before click: ' + contentBefore);
      expect(contentBefore).assertEqual('Count: 0');
      let btn = await driver.findComponent(ON.id('builderAnnotationTargets_001'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strAfter: string = inspector.getInspectorByKey('builderLambdaModel_text1');
      let contentAfter: string = JSON.parseJsonElement(strAfter).getElement('$attrs').getString('content');
      console.info('[SUB_ARKUI_BuilderAnnotationTargets01_static_0200] after click: ' + contentAfter);
      expect(contentAfter).assertEqual('Count: 1');
      let strLabel: string = inspector.getInspectorByKey('builderLambdaModel_text2');
      let contentLabel: string = JSON.parseJsonElement(strLabel).getElement('$attrs').getString('content');
      expect(contentLabel).assertEqual('Label: Updated-1');
      console.info('[SUB_ARKUI_BuilderAnnotationTargets01_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_BuilderAnnotationTargets01_static_0300
     * @tc.name     SUB_ARKUI_BuilderAnnotationTargets01_static_0300
     * @tc.desc     Verify Reset button resets model count and label back to initial values
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_BuilderAnnotationTargets01_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_BuilderAnnotationTargets01_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let resetBtn = await driver.findComponent(ON.id('builderLambda_reset_003'));
      await (resetBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strCount: string = inspector.getInspectorByKey('builderLambdaModel_text1');
      let contentCount: string = JSON.parseJsonElement(strCount).getElement('$attrs').getString('content');
      expect(contentCount).assertEqual('Count: 0');
      let strLabel: string = inspector.getInspectorByKey('builderLambdaModel_text2');
      let contentLabel: string = JSON.parseJsonElement(strLabel).getElement('$attrs').getString('content');
      expect(contentLabel).assertEqual('Label: Initial');
      console.info('[SUB_ARKUI_BuilderAnnotationTargets01_static_0300] END');
      done();
    });
  });
}
