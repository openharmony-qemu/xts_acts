/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { ItemFillPolicy } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function WaterFlowAttributeTest() {
  describe('WaterFlowAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('WaterFlowAttributeTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.waterFlow.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('WaterFlowAttributeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowAttributeIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('WaterFlowAttributeTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'WaterFlowAttributeIndex') {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('WaterFlowAttributeTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(200);
    });

    // ============================================================
    // WaterFlowAttribute.columnsTemplate - string value
    // ============================================================

    /**
     * @tc.number WaterFlowAttributeTest_001
     * @tc.name waterFlowColTemplateStr2fr
     * @tc.desc Test WaterFlowAttribute.columnsTemplate with '1fr 1fr'
     */
    it('waterFlowColTemplateStr2fr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('WaterFlowAttributeTest execute: waterFlowColTemplateStr2fr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('waterFlowColTemplateStr'));
        expect(node !== null).assertTrue();
        let attrs = node.getElement('$attrs');
        let colTemplate = attrs.getString('columnsTemplate');
        console.info('WaterFlowAttributeTest: waterFlowColTemplateStr2fr columnsTemplate = ' + colTemplate);
        expect(colTemplate !== null && colTemplate.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error('WaterFlowAttributeTest execute: waterFlowColTemplateStr2fr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number WaterFlowAttributeTest_002
     * @tc.name waterFlowColTemplateStr3fr
     * @tc.desc Test WaterFlowAttribute.columnsTemplate with '1fr 1fr 1fr'
     */
    it('waterFlowColTemplateStr3fr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('WaterFlowAttributeTest execute: waterFlowColTemplateStr3fr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('waterFlowColTemplate3fr'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('WaterFlowAttributeTest execute: waterFlowColTemplateStr3fr error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // WaterFlowAttribute.columnsTemplate - ItemFillPolicy
    // ============================================================

    /**
     * @tc.number WaterFlowAttributeTest_003
     * @tc.name waterFlowColTemplateItemFillPolicy
     * @tc.desc Test WaterFlowAttribute.columnsTemplate with ItemFillPolicy
     */
    it('waterFlowColTemplateItemFillPolicy', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('WaterFlowAttributeTest execute: waterFlowColTemplateItemFillPolicy START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('waterFlowColTemplateItemFill'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('WaterFlowAttributeTest execute: waterFlowColTemplateItemFillPolicy error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number WaterFlowAttributeTest_004
     * @tc.name waterFlowColTemplateItemFillPolicyJS
     * @tc.desc Test ItemFillPolicy.fillType is optional (undefined when not set)
     */
    it('waterFlowColTemplateItemFillPolicyJS', Level.LEVEL1, (done: () => void): void => {
      console.info('WaterFlowAttributeTest execute: waterFlowColTemplateItemFillPolicyJS START');
      // fillType is ?ResponsiveFillType (= PresetFillType enum) — verify property is optional in SDK type
      let policy: ItemFillPolicy = {};
      expect(policy.fillType === undefined).assertTrue();
      done();
    });

    /**
     * @tc.number WaterFlowAttributeTest_005
     * @tc.name waterFlowColTemplateItemFillPolicyUndefined
     * @tc.desc Test ItemFillPolicy.fillType explicitly set to undefined
     */
    it('waterFlowColTemplateItemFillPolicyUndefined', Level.LEVEL1, (done: () => void): void => {
      console.info('WaterFlowAttributeTest execute: waterFlowColTemplateItemFillPolicyUndefined START');
      let policy: ItemFillPolicy = { fillType: undefined };
      expect(policy.fillType === undefined).assertTrue();
      done();
    });

    // ============================================================
    // WaterFlowAttribute.columnsTemplate - undefined
    // ============================================================

    /**
     * @tc.number WaterFlowAttributeTest_006
     * @tc.name waterFlowColTemplateUndefined
     * @tc.desc Test WaterFlowAttribute.columnsTemplate with undefined
     */
    it('waterFlowColTemplateUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('WaterFlowAttributeTest execute: waterFlowColTemplateUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('waterFlowColTemplateUndefined'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('WaterFlowAttributeTest execute: waterFlowColTemplateUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
