/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium'
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function InheritFreezeOptionsNodeTest() {
  describe('InheritFreezeOptionsNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('InheritFreezeOptionsNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ReactiveBuilderNode/InheritFreezeOptionsNodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get InheritFreezeOptionsNodeTest state pages:' + JSON.stringify(pages));
        if (!('InheritFreezeOptionsNodeTest' == pages.name)) {
          console.info('get InheritFreezeOptionsNodeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push InheritFreezeOptionsNodeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push InheritFreezeOptionsNodeTest page error:' + err);
      }
      console.info('InheritFreezeOptionsNodeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('InheritFreezeOptionsNodeTest after each called');
    });

    /**
     * @tc.number    InheritFreezeOptionsNodeTest_0100
     * @tc.name      InheritFreezeOptionsNodeTest_0100
     * @tc.desc      ReactiveBuilderNode InheritFreezeOptionsNodeTest
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('InheritFreezeOptionsNodeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('InheritFreezeOptionsNodeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_nextPage1_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_updateBuilderNode'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('textBuilderLogCount');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[InheritFreezeOptionsNodeTest_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[InheritFreezeOptionsNodeTest_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('1');
      console.info('[InheritFreezeOptionsNodeTest_0100] END');
      done();
    });
  })
}