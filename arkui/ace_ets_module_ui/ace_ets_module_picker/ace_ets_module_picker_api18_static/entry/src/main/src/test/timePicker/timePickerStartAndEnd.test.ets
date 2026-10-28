'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function TimePickerStartAndEnd() {
  describe('TimePickerStartAndEnd', () => {
    beforeEach(async () => {
      console.info('TimePickerAddApi beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker/timePickerStartAndEnd',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TimePickerAddApi state pages:' + JSON.stringify(pages));
        if (!('timePickerStartAndEnd' == pages.name)) {
          console.info('get TimePickerAddApi pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await Utils.sleep(2500);
          // console.info('push TimePickerAddApi page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TimePickerAddApi page error:' + err);
      }
      console.info('TimePickerAddApi beforeEach end');
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0001
     * @tc.name     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0001
     * @tc.desc     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0001
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('TimePicker');
      console.log('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0001')
      await Utils.sleep(1000)
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0001 ' + obj.getElement('$attrs').getString('start'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual('8:0');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0002
     * @tc.name     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0002
     * @tc.desc     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0002
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('TimePicker');
      console.log('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0002')
      await Utils.sleep(1000)
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0002 ' + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('end')).assertEqual('10:0');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0003
     * @tc.name     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0003
     * @tc.desc     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0003
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('TimePicker2');
      console.log('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0003')
      await Utils.sleep(1000)
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0003 ' + obj.getElement('$attrs').getString('start'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual('0:0');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0004
     * @tc.name     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0004
     * @tc.desc     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0004
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('TimePicker2');
      console.log('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0004')
      await Utils.sleep(1000)
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0004 ' + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('end')).assertEqual('23:59');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0005
     * @tc.name     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0005
     * @tc.desc     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0005
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('TimePicker3');
      console.log('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0005')
      await Utils.sleep(1000)
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0005 ' + obj.getElement('$attrs').getString('start'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual('0:0');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0006
     * @tc.name     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0006
     * @tc.desc     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0006
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('TimePicker3');
      console.log('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0006')
      await Utils.sleep(1000)
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_STARTANDEND_0006 ' + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('end')).assertEqual('23:59');
      done();
    });
  })
}
