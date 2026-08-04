/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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
import { Driver, ON } from '@ohos.UiTest';
import { pushPage, assertTitleVisible } from '../common/PagePushHelper';

export default function lifecycleReuseNullUndefinedTest() {
  describe('LifecycleReuseNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[LifecycleReuseNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[LifecycleReuseNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number CustomComponentLifecycle_addObserver_null_undefined_001
     * @tc.name CustomComponentLifecycle_addObserver_null_undefined_001
     * @tc.desc Cover addObserver/removeObserver/aboutToReuse null/undefined on page
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('CustomComponentLifecycle_addObserver_null_undefined_001', Level.LEVEL2, async () => {
      console.info('[CustomComponentLifecycle_addObserver_null_undefined_001] START');
      try {
        await pushPage('MainAbility/pages/lifecycle/LifecycleReuseCover', 'LifecycleReuseCover');
        await assertTitleVisible('lifecycle_reuse_cover_title');
        const driver: Driver = await Driver.create();
        const life: string =
          await (await driver.findComponent(ON.id('lifecycle_reuse_cover_lifecycle'))).getText();
        expect(life.indexOf('lifecycle:') === 0).assertTrue();
      } catch (err) {
        console.error('[CustomComponentLifecycle_addObserver_null_undefined_001] Error: ' +
          JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[CustomComponentLifecycle_addObserver_null_undefined_001] END');
    });

    /**
     * @tc.number IReusePool_getReusableInfo_preRender_null_undefined_001
     * @tc.name IReusePool_getReusableInfo_preRender_null_undefined_001
     * @tc.desc Cover IReusePool.getReusableInfo/preRender null/undefined on page
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('IReusePool_getReusableInfo_preRender_null_undefined_001', Level.LEVEL2, async () => {
      console.info('[IReusePool_getReusableInfo_preRender_null_undefined_001] START');
      try {
        await pushPage('MainAbility/pages/lifecycle/LifecycleReuseCover', 'LifecycleReuseCover');
        await assertTitleVisible('lifecycle_reuse_cover_title');
        const driver: Driver = await Driver.create();
        const ctx: string =
          await (await driver.findComponent(ON.id('lifecycle_reuse_cover_context'))).getText();
        expect(ctx.indexOf('context:') === 0).assertTrue();
      } catch (err) {
        console.error('[IReusePool_getReusableInfo_preRender_null_undefined_001] Error: ' +
          JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[IReusePool_getReusableInfo_preRender_null_undefined_001] END');
    });
  });
}
