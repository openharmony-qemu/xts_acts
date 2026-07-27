/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@system.router';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';

interface OptionsObj {
  uri: string
}

export default function SelectionContainerNormalEventsTest() {
  describe('SelectionContainerNormalEventsTest', () => {
    beforeAll(async () => {
      console.info('[ARKUI_DYN] SelectionContainerNormalEventsTest beforeAll');
    });

    beforeEach(async (done: Function) => {
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerNormalEvents'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('SelectionContainerNormalEvents' == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] SelectionContainerNormalEventsTest push error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await Utils.sleep(500);
    });

    afterAll(async () => {
      router.clear();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_EVENT_HOST_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_EVENT_HOST_0100
     * @tc.desc   Events host with onTextSelectionChange/onWillCopy/onCopy exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_EVENT_HOST_0100', Level.LEVEL1, async () => {
      expect(getInspectorByKey('sc_dyn_events_host')).not().assertUndefined();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_EVENT_IDLE_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_EVENT_IDLE_0200
     * @tc.desc   Event flags idle before interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_EVENT_IDLE_0200', Level.LEVEL1, async () => {
      let driver = await Driver.create();
      expect(await (await driver.findComponent(ON.id('sc_dyn_events_onTextSelectionChange'))).getText())
        .assertEqual('onTextSelectionChange: false');
      expect(await (await driver.findComponent(ON.id('sc_dyn_events_onWillCopy'))).getText())
        .assertEqual('onWillCopy: false');
      expect(await (await driver.findComponent(ON.id('sc_dyn_events_onCopy'))).getText())
        .assertEqual('onCopy: false');
    });

  });
}
