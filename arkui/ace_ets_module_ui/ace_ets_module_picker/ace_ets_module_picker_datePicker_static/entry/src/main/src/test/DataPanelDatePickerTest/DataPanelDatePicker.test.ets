'use static';

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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function DataPanelDatePickerTest() {
  describe('DataPanelDatePickerTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('DataPanelDatePickerTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.picker.datePicker.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('DataPanelDatePickerTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanelDatePicker/DataPanelDatePicker',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('DataPanelDatePickerTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'DataPanelDatePicker') {
          routerInstance.replaceUrl(options);
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('DataPanelDatePickerTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('DataPanelDatePickerTest after each called');
    });

    /**
     * @tc.number DataPanelDatePickerTest_001
     * @tc.name colorStopColor
     * @tc.desc Test ColorStop color property on page, verify node exists and page text reflects configured color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('colorStopColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DataPanelDatePickerTest execute: colorStopColor START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('colorStopColorCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(nodeRaw.includes('color')).assertEqual(true);
        expect((AppStorage.get<string>('DataPanelDatePickerPageState') ?? '').includes('colorStopColor')).assertEqual(true);

        console.info('DataPanelDatePickerTest execute: colorStopColor END');
        done();
      } catch (error) {
        console.error('DataPanelDatePickerTest execute: colorStopColor error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DataPanelDatePickerTest_002
     * @tc.name colorStopOffset
     * @tc.desc Test ColorStop offset property on page, verify node exists and page text reflects configured offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('colorStopOffset', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DataPanelDatePickerTest execute: colorStopOffset START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('colorStopOffsetCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(nodeRaw.includes('20')).assertEqual(true);
        expect((AppStorage.get<string>('DataPanelDatePickerPageState') ?? '').includes('colorStopOffset=20')).assertEqual(true);

        console.info('DataPanelDatePickerTest execute: colorStopOffset END');
        done();
      } catch (error) {
        console.error('DataPanelDatePickerTest execute: colorStopOffset error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DataPanelDatePickerTest_003
     * @tc.name datePickerDialogOptionsCanLoop
     * @tc.desc Test DatePickerDialogOptions canLoop property on page, verify node exists and page text reflects canLoop value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('datePickerDialogOptionsCanLoop', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DataPanelDatePickerTest execute: datePickerDialogOptionsCanLoop START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('datePickerCanLoopCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(nodeRaw.includes('true')).assertEqual(true);
        expect((AppStorage.get<string>('DataPanelDatePickerPageState') ?? '').includes('datePickerCanLoop=true')).assertEqual(true);

        console.info('DataPanelDatePickerTest execute: datePickerDialogOptionsCanLoop END');
        done();
      } catch (error) {
        console.error('DataPanelDatePickerTest execute: datePickerDialogOptionsCanLoop error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
