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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@system.router';
import Utils from '../../MainAbility/common/Utils';

interface OptionsObj {
  uri: string
}

export default function SelectionContainerCopyOptionTest() {
  describe('SelectionContainerCopyOptionTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerCopyOptionTest] beforeAll called');
    });

    beforeEach(async (done: Function) => {
      console.info('[SelectionContainerCopyOptionTest] beforeEach called');
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerCopyOption'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!("SelectionContainerCopyOption" == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[SelectionContainerCopyOptionTest] push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      console.info('[SelectionContainerCopyOptionTest] afterEach called');
      await Utils.sleep(1000);
    });

    afterAll(async () => {
      console.info('[SelectionContainerCopyOptionTest] afterAll called');
      router.clear();
    });

    /**
     * @tc.name   selectionContainerCopyOptionDefault_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_COPYOPTION_PARAM_0100
     * @tc.desc   Test SelectionContainer copyOption default value is CopyOptions.InApp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerCopyOptionDefault_0100', Level.LEVEL0, async () => {
      console.info('[selectionContainerCopyOptionDefault_0100] START');
      let strJson: string = getInspectorByKey('selectioncontainer_copyoption_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerCopyOptionDefault_0100] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).not().assertUndefined();
      expect(obj.$attrs.copyOption).assertEqual('InApp');
      console.info('[selectionContainerCopyOptionDefault_0100] END');
    });

    /**
     * @tc.name   selectionContainerCopyOptionInApp_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_COPYOPTION_PARAM_0200
     * @tc.desc   Test SelectionContainer copyOption with CopyOptions.InApp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerCopyOptionInApp_0200', Level.LEVEL0, async () => {
      console.info('[selectionContainerCopyOptionInApp_0200] START');
      let strJson: string = getInspectorByKey('selectioncontainer_copyoption_inapp');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerCopyOptionInApp_0200] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).not().assertUndefined();
      expect(obj.$attrs.copyOption).assertEqual('InApp');
      console.info('[selectionContainerCopyOptionInApp_0200] END');
    });

    /**
     * @tc.name   selectionContainerCopyOptionLocalDevice_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_COPYOPTION_PARAM_0300
     * @tc.desc   Test SelectionContainer copyOption with CopyOptions.LocalDevice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerCopyOptionLocalDevice_0300', Level.LEVEL0, async () => {
      console.info('[selectionContainerCopyOptionLocalDevice_0300] START');
      let strJson: string = getInspectorByKey('selectioncontainer_copyoption_localDevice');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerCopyOptionLocalDevice_0300] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).not().assertUndefined();
      expect(obj.$attrs.copyOption).assertEqual('Local');
      console.info('[selectionContainerCopyOptionLocalDevice_0300] END');
    });

    /**
     * @tc.name   selectionContainerCopyOptionNull_0400
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_COPYOPTION_PARAM_0400
     * @tc.desc   Test SelectionContainer copyOption with null restores default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerCopyOptionNull_0400', Level.LEVEL0, async () => {
      console.info('[selectionContainerCopyOptionNull_0400] START');
      let strJsonCompare: string = getInspectorByKey('selectioncontainer_copyoption_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('selectioncontainer_copyoption_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerCopyOptionNull_0400] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).not().assertUndefined();
      expect(obj.$attrs.copyOption).assertEqual(objCompare.$attrs.copyOption);
      console.info('[selectionContainerCopyOptionNull_0400] END');
    });

    /**
     * @tc.name   selectionContainerCopyOptionUndefined_0500
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_COPYOPTION_PARAM_0500
     * @tc.desc   Test SelectionContainer copyOption with undefined restores default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerCopyOptionUndefined_0500', Level.LEVEL0, async () => {
      console.info('[selectionContainerCopyOptionUndefined_0500] START');
      let strJsonCompare: string = getInspectorByKey('selectioncontainer_copyoption_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('selectioncontainer_copyoption_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerCopyOptionUndefined_0500] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).not().assertUndefined();
      expect(obj.$attrs.copyOption).assertEqual(objCompare.$attrs.copyOption);
      console.info('[selectionContainerCopyOptionUndefined_0500] END');
    });
  });
}
