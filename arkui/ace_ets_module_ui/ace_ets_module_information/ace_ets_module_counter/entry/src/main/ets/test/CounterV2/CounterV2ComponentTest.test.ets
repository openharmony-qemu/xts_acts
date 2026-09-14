/**
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, Component, ON } from '@ohos.UiTest';

export default function CounterV2ComponentTest() {
  describe('CounterV2ComponentTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CounterV2ComponentTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CounterV2/CounterV2ComponentTest',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CounterV2ComponentTest state pages:' + JSON.stringify(pages));
        if (!('CounterV2ComponentTest' == pages.name)) {
          console.info('get CounterV2ComponentTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CounterV2ComponentTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.log('push CounterV2ComponentTest page error:' + err);
      }
      console.info('CounterV2ComponentTest beforeEach end');
      done();
    });
    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterV2ComponentTest afterEach sleep error: ' + err);
      }
      console.info('CounterV2ComponentTest after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_API_CounterV2ComponentTest_0100
     * @tc.number SUB_ARKUI_API_CounterV2ComponentTest_0100
     * @tc.desc   Return specified page by index value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2ComponentTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_CounterV2ComponentTest_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn: Component = await driver.findComponent(ON.id('btn'));
        await btn.click();
        await CommonFunc.sleep(1000);
        let type = getInspectorByKey('type');
        await CommonFunc.sleep(1000);
        expect(JSON.parse(type).$attrs.content).assertEqual('INLINE_DATE');
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2ComponentTest_0100 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2ComponentTest_0100] END');
      done();
    });
  });
}
