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
import { Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const PAGE = 'MainAbility/pages/subHeaderV2EndIcon/subHeaderV2EndIcon';
const SLEEP_TIME = 500;
const SUITE = 'SubHeaderV2EndIconTest';

function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

export default function SubHeaderV2EndIconTest() {
  describe('SubHeaderV2EndIconTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.acts.arkui.subHeader.nowear.test.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      const options: router.RouterOptions = {
        url: PAGE,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await Utils.sleep(600);
      } catch (err) {
        arkuiNewErr(SUITE, 'beforeEach', 'replaceUrl error: ' + err);
        expect().assertFail();
      }
      arkuiNewLog(SUITE, 'beforeEach', 'end');
    });

    afterEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'afterEach', 'start');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    // ========================================================================
    // 基础属性覆盖 (Basic Property Coverage) - 分类 2.1
    // 检查点：检查组件对应属性值符合预期
    // 验证方法：通过id获取到组件，断言目标组件属性值符合预期
    // ========================================================================

    /**
     * @tc.number SUB_ARKUI_SUBHEADERV2_ENDICON_0100
     * @tc.name SUB_ARKUI_SUBHEADERV2_ENDICON_0100
     * @tc.desc Test SubHeaderV2 endIcon with image resource, verify endIcon property is set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_SUBHEADERV2_ENDICON_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'endIcon_image_resource START');
      try {
        let strJson = inspector.getInspectorByKey('subheaderv2_endicon_image');
        let jsonObj = JSON.parseJsonElement(strJson);
        expect(jsonObj != null).assertTrue();
        let attrs = jsonObj.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let endIcon = attrs.getElement('endIcon');
        expect(endIcon != null).assertTrue();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADERV2_ENDICON_0200
     * @tc.name SUB_ARKUI_SUBHEADERV2_ENDICON_0200
     * @tc.desc Test SubHeaderV2 endIcon with SymbolGlyphModifier, verify endIcon property is set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_SUBHEADERV2_ENDICON_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'endIcon_symbol_modifier START');
      try {
        let strJson = inspector.getInspectorByKey('subheaderv2_endicon_symbol');
        let jsonObj = JSON.parseJsonElement(strJson);
        expect(jsonObj != null).assertTrue();
        let attrs = jsonObj.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let endIcon = attrs.getElement('endIcon');
        expect(endIcon != null).assertTrue();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADERV2_ENDICON_0300
     * @tc.name SUB_ARKUI_SUBHEADERV2_ENDICON_0300
     * @tc.desc Test SubHeaderV2 endIcon not set, verify endIcon is undefined by default
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_SUBHEADERV2_ENDICON_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'endIcon_default START');
      try {
        let strJson = inspector.getInspectorByKey('subheaderv2_endicon_default');
        let jsonObj = JSON.parseJsonElement(strJson);
        expect(jsonObj != null).assertTrue();
        let attrs = jsonObj.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let endIconExists = false;
        try {
          let endIcon = attrs.getElement('endIcon');
          endIconExists = (endIcon != null);
        } catch (e2) {
          endIconExists = false;
        }
        expect(endIconExists).assertFalse();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADERV2_ENDICON_0400
     * @tc.name SUB_ARKUI_SUBHEADERV2_ENDICON_0400
     * @tc.desc Test SubHeaderV2 primaryTitle + secondaryTitle + endIcon(image) — scenario 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_SUBHEADERV2_ENDICON_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'endIcon_primary_secondary START');
      try {
        let strJson = inspector.getInspectorByKey('subheaderv2_endicon_primary_secondary');
        let jsonObj = JSON.parseJsonElement(strJson);
        expect(jsonObj != null).assertTrue();
        let attrs = jsonObj.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let endIcon = attrs.getElement('endIcon');
        expect(endIcon != null).assertTrue();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADERV2_ENDICON_0500
     * @tc.name SUB_ARKUI_SUBHEADERV2_ENDICON_0500
     * @tc.desc Test SubHeaderV2 endIcon + operationItems coexist
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_SUBHEADERV2_ENDICON_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'endIcon_operation_coexist START');
      try {
        let strJson = inspector.getInspectorByKey('subheaderv2_endicon_operation');
        let jsonObj = JSON.parseJsonElement(strJson);
        expect(jsonObj != null).assertTrue();
        let attrs = jsonObj.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let endIcon = attrs.getElement('endIcon');
        expect(endIcon != null).assertTrue();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
      }
      done();
    });
  });
}
