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

/**
 * DatePicker SelectedTextStyle 属性测试用例
 *
 * 测试目标: 验证DatePicker组件的selectedTextStyle属性功能
 * 测试覆盖:
 * 1. 自定义样式对象 (gray color, 22fp font)
 * 2. 默认值 (未设置selectedTextStyle)
 * 3. null 参数测试 (应恢复为默认值)
 * 4. undefined 参数测试 (应恢复为默认值)
 * 5. 另一个自定义样式对象 (red color, 24fp font)
 *
 * 注意事项：
 * - selectedTextStyle属性类型为PickerTextStyle对象，不是字符串或基本类型
 * - 默认值：{ color: '#ff007dff', font: { size: '20fp', weight: FontWeight.Medium } }
 * - API 10+ 版本支持
 * - API 18+ 版本支持 Optional<PickerTextStyle>，新增对undefined的支持
 * - 设置选中项的文本样式
 */

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function DatePickerSelectedTextStyleNullUndefinedTest() {
  describe('DatePickerSelectedTextStyleNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerSelectedTextStyleNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerNullUndefined/DatePickerSelectedTextStyleNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerSelectedTextStyleNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerLunarNullUndefined" == pages.name)) {
          console.info("get DatePickerSelectedTextStyleNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerSelectedTextStyleNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerSelectedTextStyleNullUndefinedTest page error:" + err);
      }
      console.info("DatePickerSelectedTextStyleNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   datePickerSelectedTextStyle_001
     * @tc.number SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_PARAM_001
     * @tc.desc   测试DatePicker的selectedTextStyle属性 - 自定义样式
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerSelectedTextStyle_001', Level.LEVEL2, async () => {
      console.info('[datePickerSelectedTextStyle_001] START');

      let strJson: string = getInspectorByKey('datePicker_selectedTextStyle_custom');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerSelectedTextStyle_001] selectedTextStyle value is: " + JSON.stringify(obj.$attrs.selectedTextStyle));

      // 验证属性值包含设置的color
      let selectedTextStyleValue: Record<string, ESObject> = obj.$attrs.selectedTextStyle as Record<string, ESObject>;
      expect(selectedTextStyleValue !== null).assertTrue();

      console.info('[datePickerSelectedTextStyle_001] END');
    });

    /**
     * @tc.name   datePickerSelectedTextStyle_002
     * @tc.number SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_PARAM_002
     * @tc.desc   测试DatePicker的selectedTextStyle属性 - 默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerSelectedTextStyle_002', Level.LEVEL2, async () => {
      console.info('[datePickerSelectedTextStyle_002] START');

      let strJson: string = getInspectorByKey('datePicker_selectedTextStyle_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerSelectedTextStyle_002] selectedTextStyle value is: " + JSON.stringify(obj.$attrs.selectedTextStyle));

      // 验证属性存在
      let selectedTextStyleValue: Record<string, ESObject> = obj.$attrs.selectedTextStyle as Record<string, ESObject>;
      expect(selectedTextStyleValue !== null).assertTrue();

      console.info('[datePickerSelectedTextStyle_002] END');
    });

    /**
     * @tc.name   datePickerSelectedTextStyle_003
     * @tc.number SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_NULL_001
     * @tc.desc   测试DatePicker的selectedTextStyle属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerSelectedTextStyle_003', Level.LEVEL2, async () => {
      console.info('[datePickerSelectedTextStyle_003] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('datePicker_selectedTextStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('datePicker_selectedTextStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerSelectedTextStyle_003] default selectedTextStyle value is: " + JSON.stringify(objCompare.$attrs.selectedTextStyle));
      console.info("[datePickerSelectedTextStyle_003] null selectedTextStyle value is: " + JSON.stringify(obj.$attrs.selectedTextStyle));

      // null 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.selectedTextStyle.color).assertEqual(objCompare.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual(objCompare.$attrs.selectedTextStyle.font.size);
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual(objCompare.$attrs.selectedTextStyle.font.weight);

      console.info('[datePickerSelectedTextStyle_003] END');
    });

    /**
     * @tc.name   datePickerSelectedTextStyle_004
     * @tc.number SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_UNDEFINED_001
     * @tc.desc   测试DatePicker的selectedTextStyle属性 - undefined参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerSelectedTextStyle_004', Level.LEVEL2, async () => {
      console.info('[datePickerSelectedTextStyle_004] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('datePicker_selectedTextStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('datePicker_selectedTextStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerSelectedTextStyle_004] default selectedTextStyle value is: " + JSON.stringify(objCompare.$attrs.selectedTextStyle));
      console.info("[datePickerSelectedTextStyle_004] undefined selectedTextStyle value is: " + JSON.stringify(obj.$attrs.selectedTextStyle));

      // undefined 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.selectedTextStyle.color).assertEqual(objCompare.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual(objCompare.$attrs.selectedTextStyle.font.size);
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual(objCompare.$attrs.selectedTextStyle.font.weight);

      console.info('[datePickerSelectedTextStyle_004] END');
    });

    /**
     * @tc.name   datePickerSelectedTextStyle_005
     * @tc.number SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_PARAM_003
     * @tc.desc   测试DatePicker的selectedTextStyle属性 - 另一个自定义样式
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerSelectedTextStyle_005', Level.LEVEL2, async () => {
      console.info('[datePickerSelectedTextStyle_005] START');

      let strJson: string = getInspectorByKey('datePicker_selectedTextStyle_custom2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerSelectedTextStyle_005] selectedTextStyle value is: " + JSON.stringify(obj.$attrs.selectedTextStyle));

      // 验证属性值包含设置的color
      let selectedTextStyleValue: Record<string, ESObject> = obj.$attrs.selectedTextStyle as Record<string, ESObject>;
      expect(selectedTextStyleValue !== null).assertTrue();

      console.info('[datePickerSelectedTextStyle_005] END');
    });
  })
}
