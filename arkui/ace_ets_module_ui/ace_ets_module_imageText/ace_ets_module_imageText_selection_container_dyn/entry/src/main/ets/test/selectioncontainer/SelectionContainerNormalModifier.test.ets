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

interface OptionsObj {
  uri: string
}

export default function SelectionContainerNormalModifierTest() {
  describe('SelectionContainerNormalModifierTest', () => {
    beforeAll(async () => {
      console.info('[ARKUI_DYN] SelectionContainerNormalModifierTest beforeAll');
    });

    beforeEach(async (done: Function) => {
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerNormalModifier'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('SelectionContainerNormalModifier' == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] SelectionContainerNormalModifierTest push error: ' + err);
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
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_MODIFIER_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_MODIFIER_0100
     * @tc.desc   attributeModifier applies normal SelectionContainerAttribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_MODIFIER_0100', Level.LEVEL1, async () => {
      let obj: Record<string, ESObject> = JSON.parse(getInspectorByKey('sc_dyn_modifier_host'));
      expect(obj.$attrs.copyOption).assertEqual('InApp');
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      expect(obj.$attrs.textJoinStyle).assertEqual('NEWLINE');
      expect(obj.$attrs.caretColor).not().assertUndefined();
      expect(obj.$attrs.selectedBackgroundColor).not().assertUndefined();
    });

  });
}
