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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

const TAG = 'ProviderNullUndefinedTest';
const DOMAIN = 0x0000;


export default function providerNullUndefinedTest() {
  describe('ProviderNullUndefinedTest', () => {
     beforeEach(async (done: Function) => {
      hilog.info(DOMAIN, TAG, "ProviderNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provider/ProviderNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        hilog.info(DOMAIN, TAG, "get ProviderNullUndefined state pages: " + JSON.stringify(pages));
        if (!("ProviderNullUndefined" == pages.name)) {
          hilog.info(DOMAIN, TAG, "get ProviderNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          hilog.info(DOMAIN, TAG, "push ProviderNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProviderNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, 'beforeEach: prepare for test case');
    });

    afterEach(() => {
      hilog.info(DOMAIN, TAG, 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'afterAll: all tests finished');
    });

    /**
     * @tc.name   ProviderNullUndefined_001
     * @tc.number SUB_ARKUI_PROVIDER_NULL_UNDEFINED_0100
     * @tc.desc   Test @Provider decorator with undefined parameter - initial state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ProviderNullUndefined_001', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'ProviderNullUndefined_001 START');
      let strJson: string = getInspectorByKey('parent_values');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let content: string = obj.$attrs.content as string;
      hilog.info(DOMAIN, TAG, 'ProviderNullUndefined_001 parent_values: ' + content);
      expect(content).assertContain('undefined age: 1');
      expect(content).assertContain('null age2: 1');
      hilog.info(DOMAIN, TAG, 'ProviderNullUndefined_001 END');
    });

    /**
     * @tc.name   ProviderNullUndefined_002
     * @tc.number SUB_ARKUI_PROVIDER_NULL_UNDEFINED_0200
     * @tc.desc   Test @Provider decorator with null parameter - child initial state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ProviderNullUndefined_002', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'ProviderNullUndefined_002 START');
      let strJson: string = getInspectorByKey('child_values');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let content: string = obj.$attrs.content as string;
      hilog.info(DOMAIN, TAG, 'ProviderNullUndefined_002 child_values: ' + content);
      expect(content).assertContain('undefined age: 1');
      expect(content).assertContain('null age2: 1');
      hilog.info(DOMAIN, TAG, 'ProviderNullUndefined_002 END');
    });

    /**
     * @tc.name   ProviderNullUndefined_003
     * @tc.number SUB_ARKUI_PROVIDER_NULL_UNDEFINED_0300
     * @tc.desc   Test @Provider decorator with undefined parameter - click parent button to change state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ProviderNullUndefined_003', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'ProviderNullUndefined_003 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('parent_button'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJsonAfter: string = getInspectorByKey('parent_values');
      let objAfter: Record<string, ESObject> = JSON.parse(strJsonAfter);
      let contentAfter: string = objAfter.$attrs.content as string;
      hilog.info(DOMAIN, TAG, 'ProviderNullUndefined_003 after click: ' + contentAfter);
      expect(contentAfter).assertContain('undefined age: 2');
      expect(contentAfter).assertContain('null age2: 2');

      let childStrJsonAfter: string = getInspectorByKey('child_values');
      let childObjAfter: Record<string, ESObject> = JSON.parse(childStrJsonAfter);
      let childContentAfter: string = childObjAfter.$attrs.content as string;
      hilog.info(DOMAIN, TAG, 'ProviderNullUndefined_004 child after: ' + childContentAfter);
      expect(childContentAfter).assertContain('undefined age: 2');
      expect(childContentAfter).assertContain('null age2: 2');

      hilog.info(DOMAIN, TAG, 'ProviderNullUndefined_003 END');
    });


  });
}