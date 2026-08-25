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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import CommonFunc from '../../MainAbility/utils/Common';

export default function TextPickerSelectedIndexEmptyArrayTest() {
  describe('TextPickerSelectedIndexEmptyArrayTest', () => {

    beforeEach(async (done: Function) => {
      console.info('TextPickerSelectedIndexEmptyArrayTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/textPickerSelectedIndexEmptyArray',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerSelectedIndexEmptyArrayTest state pages: ' + JSON.stringify(pages));
        if (!('textPickerSelectedIndexEmptyArray' == pages.name)) {
          console.info('get TextPickerSelectedIndexEmptyArrayTest pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push TextPickerSelectedIndexEmptyArrayTest page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerSelectedIndexEmptyArrayTest page error: ' + JSON.stringify(err));
      }
      console.info('TextPickerSelectedIndexEmptyArrayTest beforeEach end');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0100
     * @tc.number SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0100
     * @tc.desc   Test selectedIndex(0) with empty range array, verify default value is applied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0100] START');
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('textPicker_emptyRange_selectedIndex_0');
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0100] strJson: ' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0100] selectedIndex: '
          + JSON.stringify(obj.$attrs.selectedIndex));
        // When range is empty array, selectedIndex(0) should use default value 0
        expect(JSON.stringify(obj.$attrs.selectedIndex)).assertEqual('["0"]');
      } catch (err) {
        console.error('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0100] error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0200
     * @tc.number SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0200
     * @tc.desc   Test selectedIndex(2) with empty range array, exceeds max index, should use default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0200] START');
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('textPicker_emptyRange_selectedIndex_2');
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0200] strJson: ' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0200] selectedIndex: '
          + JSON.stringify(obj.$attrs.selectedIndex));
        // When range is empty array, selectedIndex(2) exceeds max index, should use default value 0
        expect(JSON.stringify(obj.$attrs.selectedIndex)).assertEqual('["0"]');
      } catch (err) {
        console.error('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0200] error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0300
     * @tc.number SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0300
     * @tc.desc   Test selectedIndex(-1) with empty range array, negative value, should use default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0300] START');
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('textPicker_emptyRange_selectedIndex_negative');
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0300] strJson: ' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0300] selectedIndex: '
          + JSON.stringify(obj.$attrs.selectedIndex));
        // When range is empty array, selectedIndex(-1) is negative, should use default value 0
        expect(JSON.stringify(obj.$attrs.selectedIndex)).assertEqual('["0"]');
      } catch (err) {
        console.error('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0300] error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0300] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0400
     * @tc.number SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0400
     * @tc.desc   Test selectedIndex([]) with empty multi-column range array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0400] START');
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('textPicker_emptyMultiRange_selectedIndex_emptyArray');
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0400] strJson: ' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0400] selectedIndex: '
          + JSON.stringify(obj.$attrs.selectedIndex));
        // Multi-column with empty range and empty selectedIndex array, result should be empty array
        expect(JSON.stringify(obj.$attrs.selectedIndex)).assertEqual('[]');
      } catch (err) {
        console.error('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0400] error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0400] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0500
     * @tc.number SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0500
     * @tc.desc   Test selectedIndex keeps current value when range dynamically changes to empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0500] START');
        await CommonFunc.sleep(1000);
        // Verify initial selectedIndex value before dynamic change
        let strJson = getInspectorByKey('textPicker_dynamicRange_selectedIndex');
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0500] initial strJson: ' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0500] initial selectedIndex: '
          + JSON.stringify(obj.$attrs.selectedIndex));
        // Initial selectedIndex(1) with valid range, should be ["1"]
        expect(JSON.stringify(obj.$attrs.selectedIndex)).assertEqual('["1"]');

        // Dynamically change range to empty array
        globalThis.value.message.notify({
          name: 'dynamicRange', value: []
        });
        await CommonFunc.sleep(2000);

        // Verify selectedIndex keeps current value after range changes to empty
        strJson = getInspectorByKey('textPicker_dynamicRange_selectedIndex');
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0500] after change strJson: ' + JSON.stringify(strJson));
        obj = JSON.parse(strJson);
        console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0500] after change selectedIndex: '
          + JSON.stringify(obj.$attrs.selectedIndex));
        // According to docs: when range dynamically changes to empty array, keeps current normal value display
        expect(JSON.stringify(obj.$attrs.selectedIndex)).assertEqual('["1"]');
      } catch (err) {
        console.error('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0500] error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[SUB_ARKUI_TEXTPICKER_SELECTEDINDEX_EMPTYARRAY_0500] END');
      done();
    });
  })
}
