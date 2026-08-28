'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, Level, Size, afterEach, TestType } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function TextPickerPage() {
  describe('TextPickerPage', () => {

    beforeEach(async () => {
      console.info('TextPickerPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/textpickerselectedBackgroundStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextPickerPage state pages:' + JSON.stringify(pages));
        if (!('textpickerselectedBackgroundStyle' == pages.name)) {
          console.info('get TextPickerPage pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await Utils.sleep(2500);
          // console.info('push TextPickerPage page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerPage page error:' + err);
      }
      console.info('TextPickerPage beforeEach end');
    });

    
    
    
    /**
     * @tc.number   textPickerselectedBackgroundStyle_static_001
     * @tc.name     textPickerselectedBackgroundStyle_static_001
     * @tc.desc     textPickerselectedBackgroundStyle_static_001
     * @tc.level    Level.LEVEL0
     */
it('textPickerselectedBackgroundStyle_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textPicker1');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      let obj1 :string = obj.getElement('$attrs').getElement('selectedBackgroundStyle').getString('color');
      expect(obj1).assertEqual(Color.Red);
      done();
    });
  })
}