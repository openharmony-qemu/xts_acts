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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function SearchEnableSelectedDataDetectorTest() {
  describe('SearchEnableSelectedDataDetectorTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('SearchEnableSelectedDataDetectorTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.search.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('SearchEnableSelectedDataDetectorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi26/SearchEnableSelectedDataDetector',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('SearchEnableSelectedDataDetectorTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'SearchEnableSelectedDataDetector') {
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error('SearchEnableSelectedDataDetectorTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('SearchEnableSelectedDataDetectorTest afterEach');
    });

    afterAll(async (): Promise<void> => {
      console.info('SearchEnableSelectedDataDetectorTest afterAll');
    });

    /**
     * @tc.name   searchEnableSelectedDataDetector_true_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLESELECTEDDATADETECTOR_PARAM_0100
     * @tc.desc   Test Search enableSelectedDataDetector property with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableSelectedDataDetector_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchEnableSelectedDataDetector_true_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('search_enableSelectedDataDetector_true');
        expect(strJson.length > 0).assertTrue();

        let enableValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector');
        console.info('[searchEnableSelectedDataDetector_true_0100] enableSelectedDataDetector: ' + enableValue);
        expect(enableValue).assertEqual('true');

        console.info('[searchEnableSelectedDataDetector_true_0100] END');
        done();
      } catch (error) {
        console.error('[searchEnableSelectedDataDetector_true_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   searchEnableSelectedDataDetector_false_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLESELECTEDDATADETECTOR_PARAM_0200
     * @tc.desc   Test Search enableSelectedDataDetector property with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableSelectedDataDetector_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchEnableSelectedDataDetector_false_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('search_enableSelectedDataDetector_false');
        expect(strJson.length > 0).assertTrue();

        let enableValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector');
        console.info('[searchEnableSelectedDataDetector_false_0100] enableSelectedDataDetector: ' + enableValue);
        expect(enableValue).assertEqual('false');

        console.info('[searchEnableSelectedDataDetector_false_0100] END');
        done();
      } catch (error) {
        console.error('[searchEnableSelectedDataDetector_false_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   searchEnableSelectedDataDetector_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLESELECTEDDATADETECTOR_PARAM_0300
     * @tc.desc   Test Search enableSelectedDataDetector property with undefined value, should equal default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableSelectedDataDetector_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchEnableSelectedDataDetector_undefined_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJsonUndefined: string = inspector.getInspectorByKey('search_enableSelectedDataDetector_undefined');
        let strJsonDefault: string = inspector.getInspectorByKey('search_enableSelectedDataDetector_default');

        let enableUndefined: string = JSON.parseJsonElement(strJsonUndefined).getElement('$attrs').getString('enableSelectedDataDetector');
        let enableDefault: string = JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('enableSelectedDataDetector');
        console.info('[searchEnableSelectedDataDetector_undefined_0100] enableUndefined: ' + enableUndefined);
        console.info('[searchEnableSelectedDataDetector_undefined_0100] enableDefault: ' + enableDefault);

        expect(enableUndefined).assertEqual(enableDefault);

        console.info('[searchEnableSelectedDataDetector_undefined_0100] END');
        done();
      } catch (error) {
        console.error('[searchEnableSelectedDataDetector_undefined_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   searchEnableSelectedDataDetector_modifier_true_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLESELECTEDDATADETECTOR_MODIFIER_0100
     * @tc.desc   Test Search enableSelectedDataDetector property set via AttributeModifier with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableSelectedDataDetector_modifier_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchEnableSelectedDataDetector_modifier_true_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('search_enableSelectedDataDetector_modifier_true');
        expect(strJson.length > 0).assertTrue();

        let enableValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector');
        console.info('[searchEnableSelectedDataDetector_modifier_true_0100] enableSelectedDataDetector: ' + enableValue);
        expect(enableValue).assertEqual('true');

        console.info('[searchEnableSelectedDataDetector_modifier_true_0100] END');
        done();
      } catch (error) {
        console.error('[searchEnableSelectedDataDetector_modifier_true_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   searchEnableSelectedDataDetector_modifier_false_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLESELECTEDDATADETECTOR_MODIFIER_0200
     * @tc.desc   Test Search enableSelectedDataDetector property set via AttributeModifier with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableSelectedDataDetector_modifier_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchEnableSelectedDataDetector_modifier_false_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('search_enableSelectedDataDetector_modifier_false');
        expect(strJson.length > 0).assertTrue();

        let enableValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector');
        console.info('[searchEnableSelectedDataDetector_modifier_false_0100] enableSelectedDataDetector: ' + enableValue);
        expect(enableValue).assertEqual('false');

        console.info('[searchEnableSelectedDataDetector_modifier_false_0100] END');
        done();
      } catch (error) {
        console.error('[searchEnableSelectedDataDetector_modifier_false_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
