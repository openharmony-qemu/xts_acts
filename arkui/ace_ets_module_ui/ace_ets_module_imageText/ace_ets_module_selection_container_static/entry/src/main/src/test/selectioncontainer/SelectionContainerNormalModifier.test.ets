'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

export default function SelectionContainerNormalModifierTest(): void {
  describe('SelectionContainerNormalModifierTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] SelectionContainerNormalModifierTest beforeAll');
      await UtilsTest.startAbility('com.arkui.ace.selectionContainer.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectioncontainer/SelectionContainerNormalModifier'
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        if (pages.name !== 'SelectionContainerNormalModifier') {
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_NEW] SelectionContainerNormalModifierTest route error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500);
    });

    afterAll(async (): Promise<void> => {
      const routerInstance: Router = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_MODIFIER_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_MODIFIER_0100
     * @tc.desc   attributeModifier applies normal SelectionContainerAttribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_MODIFIER_0100', Level.LEVEL1, async () => {
      let strJson: string = inspector.getInspectorByKey('sc_static_modifier_host');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('copyOption')).assertEqual('InApp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableHapticFeedback'))
        .assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textJoinStyle')).assertEqual('NEWLINE');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretColor')).not().assertUndefined();
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedBackgroundColor'))
        .not().assertUndefined();
    });

  });
}
