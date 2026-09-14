/*
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

import { afterEach, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextAreaCalcWidthTest() {
  describe('TextAreaCalcWidthTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi15/TextAreaCalcWidth',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('[TextAreaCalcWidthTest] push page error: ' + JSON.stringify(err));
      }
      done();
    });

    afterEach(async () => {
      router.clear();
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_TextArea_CalcWidth_0001
     * @tc.number SUB_ACE_ARKUI_TextArea_CalcWidth_0001
     * @tc.desc   Verify that a calc width is resolved before Row lays out its trailing child.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_TextArea_CalcWidth_0001', Level.LEVEL1, async (done: Function) => {
      let row = CommonFunc.getComponentRect('textAreaCalcWidthRow');
      let textArea = CommonFunc.getComponentRect('textAreaCalcWidth');
      let trailing = CommonFunc.getComponentRect('textAreaCalcWidthTrailing');
      let rowWidth = row.right - row.left;
      let expectedTextAreaWidth = rowWidth - vp2px(80);

      console.info('[TextAreaCalcWidthTest_0001] row rect: ' + JSON.stringify(row));
      console.info('[TextAreaCalcWidthTest_0001] textArea rect: ' + JSON.stringify(textArea));
      console.info('[TextAreaCalcWidthTest_0001] trailing rect: ' + JSON.stringify(trailing));
      expect(Math.abs((textArea.right - textArea.left) - expectedTextAreaWidth) <= 1).assertTrue();
      expect(Math.abs(trailing.left - textArea.right) <= 1).assertTrue();
      expect(Math.abs(trailing.right - (row.right - vp2px(40))) <= 1).assertTrue();
      done();
    });
  });
}
