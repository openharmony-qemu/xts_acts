/*
 * Copyright (c) 2026 KaiHong Co., Ltd.
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

import { beforeAll, describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';

const driver = Driver.create();
const EVENT_KEY = 207100;

export default function EmbedOptionsTest() {
  describe('EmbedOptions', () => {
    beforeAll(async (done: Function) => {
      await router.pushUrl({ url: 'testability/pages/EmbedOptions' });
      await driver.waitForComponent(ON.id('EmbedOptions'), 10000);
      done();
    });
    /**
     * @tc.name   SUB_WEB_EMBEDOPTIONS_SUPPORTTRANSFORMROTATEANDSKEW_0100
     * @tc.number SUB_WEB_EMBEDOPTIONS_SUPPORTTRANSFORMROTATEANDSKEW_0100
     * @tc.desc   test embedoptions supporttransformrotateandskew (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_EMBEDOPTIONS_SUPPORTTRANSFORMROTATEANDSKEW_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('supportTransformRotateAndSkew', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('EmbedOptionsSkew', true, 207111, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'EmbedOptions');
        if (await Utils.waitForExist(() => ok, 'EmbedOptionsSkew', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_EMBEDOPTIONS_DYNAMIC_0100
     * @tc.number SUB_WEB_EMBEDOPTIONS_DYNAMIC_0100
     * @tc.desc   test embedoptions dynamic (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_EMBEDOPTIONS_DYNAMIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testEmbedOptions', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('EmbedOptions', true, 207110, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'EmbedOptions');
        if (await Utils.waitForExist(() => ok, 'EmbedOptions', 1, 5000)) { done(); }
      });
  });
}
