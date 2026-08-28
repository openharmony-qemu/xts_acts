'use static';
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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ExtendableRelativeContainerBuiltInTest() {
  describe('ExtendableRelativeContainerBuiltInTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableRelativeContainerBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableRelativeContainerBuiltIn",
      }
      try {
        const ExtendableRelativeContainerBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableRelativeContainerBuiltInTest.clear();
        let pages: router.RouterState = ExtendableRelativeContainerBuiltInTest.getState();
        console.info("get ExtendableRelativeContainerBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableRelativeContainerBuiltIn" == pages.name)) {
          console.info("get ExtendableRelativeContainerBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableRelativeContainerBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableRelativeContainerBuiltInTest page error:" + err);
      }
      console.info("ExtendableRelativeContainerBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableRelativeContainerBuiltInTest after each called");
    });

    afterAll(async () => {
      console.info('ExtendableRelativeContainerBuiltInTest afterAll: all tests finished');
    });

    /**
     * @tc.name: ExtendableRelativeContainerBuiltIn_CustomAttribute_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_RELATIVE_CONTAINER_CUSTOM_ATTRIBUTE_0100
     * @tc.desc: Test ExtendableRelativeContainer custom newAttribute method that sets height and width to 50%
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableRelativeContainerBuiltIn_CustomAttribute_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableRelativeContainerBuiltIn_CustomAttribute_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableRelativeContainer_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let width = obj.getString('width');
      let height = obj.getString('height');
      console.info("[ExtendableRelativeContainerBuiltIn_CustomAttribute_0100] width is: " + width + ", height is: " + height);
      expect(width).assertEqual('50.00%');
      expect(height).assertEqual('50.00%');
      console.info('[ExtendableRelativeContainerBuiltIn_CustomAttribute_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableRelativeContainerBuiltIn_Border_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_RELATIVE_CONTAINER_BORDER_0200
     * @tc.desc: Test ExtendableRelativeContainer border property
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableRelativeContainerBuiltIn_Border_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableRelativeContainerBuiltIn_Border_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableRelativeContainer_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let borderWidth = obj.getString('borderWidth');
      let borderColor = obj.getString('borderColor');
      console.info("[ExtendableRelativeContainerBuiltIn_Border_0200] borderWidth is: " + borderWidth + ", borderColor is: " + borderColor);
      expect(borderWidth).assertEqual('2.00vp');
      expect(borderColor).assertEqual('#FF6699FF');
      console.info('[ExtendableRelativeContainerBuiltIn_Border_0200] END');
      done();
    });
  });
}