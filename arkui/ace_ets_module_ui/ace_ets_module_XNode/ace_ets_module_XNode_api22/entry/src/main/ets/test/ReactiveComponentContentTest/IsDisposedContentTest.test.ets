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

export default function IsDisposedContentTest() {
  describe('IsDisposedContentTest', () => {
    beforeEach(async (done: Function) => {
      console.info('IsDisposedContentTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ReactiveComponentContent/IsDisposedContentTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get IsDisposedContentTest state pages:' + JSON.stringify(pages));
        if (!('IsDisposedContentTest' == pages.name)) {
          console.info('get IsDisposedContentTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push IsDisposedContentTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push IsDisposedContentTest page error:' + err);
      }
      console.info('IsDisposedContentTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('IsDisposedContentTest after each called');
    });

    /**
     * @tc.number    IsDisposedContentTest_0100
     * @tc.name      IsDisposedContentTest_0100
     * @tc.desc      ReactiveComponentContent IsDisposedContentTest
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('IsDisposedContentTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('IsDisposedContentTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('isDisposed'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('isDisposedText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[IsDisposedContentTest_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[IsDisposedContentTest_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[IsDisposedContentTest_0100] END');
      done();
    });


    /**
     * @tc.number    isDisposedTest_0200
     * @tc.name      isDisposedTest_0200
     * @tc.desc      ReactiveComponentContent isDisposed Test
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('IsDisposedContentTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('IsDisposedContentTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('dispose'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('isDisposed'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('isDisposedText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[IsDisposedContentTest_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[IsDisposedContentTest_0200] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('true');
      console.info('[IsDisposedContentTest_0200] END');
      done();
    });
  })
}