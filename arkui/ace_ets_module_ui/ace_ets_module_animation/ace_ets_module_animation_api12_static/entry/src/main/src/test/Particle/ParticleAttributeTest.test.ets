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

export default function ParticleAttributeTest() {
  describe('ParticleAttributeTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("ParticleAttributeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Particle/particleAttributeTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ParticleAttributeTest state pages:" + JSON.stringify(pages));
        if (!("particleAttributeTest" == pages.name)) {
          console.info("get ParticleAttributeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push ParticleAttributeTest page error:" + err);
      }
      console.info("ParticleAttributeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ParticleAttributeTest err: ' + JSON.stringify(err));
      }
      console.info("particleAttributeTest after each called");
    });


/**
     * @tc.number   ParticleAttributeTest_static_001
     * @tc.name     ParticleAttributeTest_static_001
     * @tc.desc     ParticleAttributeTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('ParticleAttributeTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info("[ParticleAttributeTest_static_001] START");
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ParticleAttributeTest err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ParticleAttributeTest err: ' + JSON.stringify(err));
      }
      console.log('test1156 ')
      let btn: Component | null = null;
      try {
        btn = await driver.findComponent(ON.id('btn'));
      } catch (err) {
        console.info('ParticleAttributeTest err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ParticleAttributeTest err: ' + JSON.stringify(err));
      }
      console.log('test1156 ' + btn)
      try {
        await (btn?.click() as Promise<void>);
      } catch (err) {
        console.info('ParticleAttributeTest err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('ParticleAttributeTest err: ' + JSON.stringify(err));
      }
      let noiseScale = inspector.getInspectorByKey("text");
      expect(JSON.parseJsonElement(noiseScale).getElement('$attrs').getString('content')).assertEqual("1");
      console.info("[ParticleAttributeTest_static_001] END");
      done();
    });
  })
}
