'use static';
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function RichEditorEnableSelectedDataDetectorTest() {
  describe('RichEditorEnableSelectedDataDetectorTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RichEditorEnableSelectedDataDetectorTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.richeditor.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      console.info("RichEditorEnableSelectedDataDetectorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor26/RichEditorEnableSelectedDataDetector',
      }
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info('RichEditorEnableSelectedDataDetectorTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'RichEditorEnableSelectedDataDetector') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('RichEditorEnableSelectedDataDetectorTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   richEditorEnableSelectedDataDetector_true_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLESELECTEDDATADETECTOR_TRUE_0100
     * @tc.desc   Test RichEditor enableSelectedDataDetector property with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorEnableSelectedDataDetector_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorEnableSelectedDataDetector_true_0100] START');

      let strJson = inspector.getInspectorByKey('richEditor_enableSelectedDataDetector_true');

      console.info("[richEditorEnableSelectedDataDetector_true_0100] enableSelectedDataDetector is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector')).assertEqual('true');
      console.info('[richEditorEnableSelectedDataDetector_true_0100] END');
      done();
    })

    /**
     * @tc.name   richEditorEnableSelectedDataDetector_false_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLESELECTEDDATADETECTOR_FALSE_0100
     * @tc.desc   Test RichEditor enableSelectedDataDetector property with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorEnableSelectedDataDetector_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorEnableSelectedDataDetector_false_0100] START');

      let strJson = inspector.getInspectorByKey('richEditor_enableSelectedDataDetector_false');

      console.info("[richEditorEnableSelectedDataDetector_false_0100] enableSelectedDataDetector is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector')).assertEqual('false');
      console.info('[richEditorEnableSelectedDataDetector_false_0100] END');
      done();
    })

    /**
     * @tc.name   richEditorEnableSelectedDataDetector_undefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLESELECTEDDATADETECTOR_UNDEFINED_0100
     * @tc.desc   Test RichEditor enableSelectedDataDetector property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorEnableSelectedDataDetector_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorEnableSelectedDataDetector_undefined_0100] START');

      let strJsonCompare = inspector.getInspectorByKey('richEditor_enableSelectedDataDetector_default');
      let strJson = inspector.getInspectorByKey('richEditor_enableSelectedDataDetector_undefined');

      console.info("[richEditorEnableSelectedDataDetector_undefined_0100] default enableSelectedDataDetector is: "
        + JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector'));
      console.info("[richEditorEnableSelectedDataDetector_undefined_0100] undefined enableSelectedDataDetector is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector'));
      console.info('[richEditorEnableSelectedDataDetector_undefined_0100] END');
      done();
    })
  })
}
