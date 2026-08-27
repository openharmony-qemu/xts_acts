'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll, Size, afterEach, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
const SLEEP_TIME_L = 1000;
export default function CalendarPickerAttributeModifierTest() {
  describe('CalendarPickerAttributeModifierTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("CalendarPickerAttributeModifierTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.container.static", "EntryAbility")
      await UtilsTest.msSleep(SLEEP_TIME_L)
    });

    beforeEach(async () => {
      console.info('CalendarPickerAttributeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CalendarPicker/CalendarPickerAttributeModifier',
      }
      await UtilsTest.msSleep(SLEEP_TIME_L);
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CalendarPickerAttributeModifierTest state pages:' + JSON.stringify(pages));
        if (!('CalendarPickerAttributeModifier' == pages.name)) {
          console.info('get CalendarPickerAttributeModifierTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push CalendarPickerAttributeModifierTest page error:' + err);
      }
      console.info('CalendarPickerAttributeModifierTest beforeEach end');
    });

    afterEach(() => {
      console.info('CalendarPickerAttributeModifierTest afterEach');
    });

    /**
     * @tc.number   SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0001
     * @tc.name     SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0001
     * @tc.desc     Set the edgeAlign property to CalendarAlign.START via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('calendarPicker1');
      let obj = JSON.parseJsonElement(strJson);
      let edgeAlign: string = obj.getElement('$attrs').getElement('edgeAlign').getString('alignType');
      expect(edgeAlign).assertEqual('CalendarAlign.START');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0002
     * @tc.name     SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0002
     * @tc.desc     Set the edgeAlign property to CalendarAlign.CENTER via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('calendarPicker2');
      let obj = JSON.parseJsonElement(strJson);
      let edgeAlign: string = obj.getElement('$attrs').getElement('edgeAlign').getString('alignType');
      expect(edgeAlign).assertEqual('CalendarAlign.CENTER');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0003
     * @tc.name     SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0003
     * @tc.desc     Set the edgeAlign property to CalendarAlign.END via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('calendarPicker3');
      let obj = JSON.parseJsonElement(strJson);
      let edgeAlign: string = obj.getElement('$attrs').getElement('edgeAlign').getString('alignType');
      expect(edgeAlign).assertEqual('CalendarAlign.END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0004
     * @tc.name     SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0004
     * @tc.desc     Set the edgeAlign property to undefined via modifier, verify default value CalendarAlign.END
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0004 START');
      let strJson = inspector.getInspectorByKey('calendarPicker4');
      let obj = JSON.parseJsonElement(strJson);
      let edgeAlign: string = obj.getElement('$attrs').getElement('edgeAlign').getString('alignType');
      expect(edgeAlign).assertEqual('CalendarAlign.END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0005
     * @tc.name     SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0005
     * @tc.desc     Set the edgeAlign property with offset via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_CALENDARPICKER_EDGEALIGN_MODIFIER_0005 START');
      let strJson = inspector.getInspectorByKey('calendarPicker5');
      let obj = JSON.parseJsonElement(strJson);
      let edgeAlign: string = obj.getElement('$attrs').getElement('edgeAlign').getString('alignType');
      expect(edgeAlign).assertEqual('CalendarAlign.START');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0001
     * @tc.desc     Set the textStyle property with color, fontSize and fontWeight via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('calendarPicker6');
      let obj = JSON.parseJsonElement(strJson);
      let textStyle = obj.getElement('$attrs').getElement('textStyle');
      expect(textStyle.getString('color')).assertEqual('#FF0000FF');
      expect(textStyle.getElement('font').getString('size')).assertEqual('20.00vp');
      expect(textStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Bold');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0002
     * @tc.desc     Set the textStyle property with different color, fontSize and fontWeight via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('calendarPicker7');
      let obj = JSON.parseJsonElement(strJson);
      let textStyle = obj.getElement('$attrs').getElement('textStyle');
      expect(textStyle.getString('color')).assertEqual('#FFFF0000');
      expect(textStyle.getElement('font').getString('size')).assertEqual('30.00vp');
      expect(textStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0003
     * @tc.name     SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0003
     * @tc.desc     Set the textStyle property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_CALENDARPICKER_TEXTSTYLE_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('calendarPicker8');
      let obj = JSON.parseJsonElement(strJson);
      let textStyle = obj.getElement('$attrs').getElement('textStyle');
      expect(textStyle.getString('color')).assertEqual('#FF182431');
      expect(textStyle.getElement('font').getString('size')).assertEqual('16.00fp');
      expect(textStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0001
     * @tc.name     SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0001
     * @tc.desc     Set the markToday property to true via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('calendarPicker9');
      let obj = JSON.parseJsonElement(strJson);
      let markToday: string = obj.getElement('$attrs').getString('markToday');
      expect(markToday).assertEqual('true');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0002
     * @tc.name     SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0002
     * @tc.desc     Set the markToday property to false via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('calendarPicker10');
      let obj = JSON.parseJsonElement(strJson);
      let markToday: string = obj.getElement('$attrs').getString('markToday');
      expect(markToday).assertEqual('false');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0003
     * @tc.name     SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0003
     * @tc.desc     Set the markToday property to undefined via modifier, verify default value false
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_CALENDARPICKER_MARKTODAY_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('calendarPicker11');
      let obj = JSON.parseJsonElement(strJson);
      let markToday: string = obj.getElement('$attrs').getString('markToday');
      expect(markToday).assertEqual('false');
      done();
    });
  })
}
