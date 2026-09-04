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
import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function gridEditModeOptions() {
  describe('gridEditModeOptions', () => {

    beforeEach(async () => {
      console.info('gridEditModeOptions beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/gridEditModeOptions',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get gridEditModeOptions state pages:' + JSON.stringify(pages));
        if (!('gridEditModeOptions' == pages.name)) {
          console.info('get gridEditModeOptions pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push gridEditModeOptions page error:' + err);
      }
      console.info('gridEditModeOptions beforeEach end');
    });

    /**
     * @tc.name   gridEditModeOptions_static_0100
     * @tc.number SUB_ARKUI_GRID_EDITMODEOPTIONS_STATIC_0100
     * @tc.desc   Test Grid editModeOptions parameter property with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEditModeOptions_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[gridEditModeOptions_static_0100] START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('grid_editModeOptions_true');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getElement('editModeOptions');
      console.log('[gridEditModeOptions_static_0100] editModeOptions: '+ content)
      console.log('[gridEditModeOptions_static_0100] useDefaultMultiSelectStyle: '+
        content.getString('useDefaultMultiSelectStyle'))
      console.log('[gridEditModeOptions_static_0100] enableGatherSelectedItemsAnimation: '+
        content.getString('enableGatherSelectedItemsAnimation'))
      console.log('[gridEditModeOptions_static_0100] enableFingerMultiSelect: '+
        content.getString('enableFingerMultiSelect'))
      expect(content.getString('useDefaultMultiSelectStyle')).assertEqual('true');
      expect(content.getString('enableGatherSelectedItemsAnimation')).assertEqual('true');
      expect(content.getString('enableFingerMultiSelect')).assertEqual('true');
      console.info('[gridEditModeOptions_static_0100] END');
      done();
    });

    /**
     * @tc.name   gridEditModeOptions_static_0200
     * @tc.number SUB_ARKUI_GRID_EDITMODEOPTIONS_STATIC_0200
     * @tc.desc   Test Grid editModeOptions parameter property with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEditModeOptions_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[gridEditModeOptions_static_0200] START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('grid_editModeOptions_false');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getElement('editModeOptions');
      console.log('[gridEditModeOptions_static_0200] editModeOptions: '+ content)
      console.log('[gridEditModeOptions_static_0200] useDefaultMultiSelectStyle: '+
        content.getString('useDefaultMultiSelectStyle'))
      console.log('[gridEditModeOptions_static_0200] enableGatherSelectedItemsAnimation: '+
        content.getString('enableGatherSelectedItemsAnimation'))
      console.log('[gridEditModeOptions_static_0200] enableFingerMultiSelect: '+
        content.getString('enableFingerMultiSelect'))
      expect(content.getString('useDefaultMultiSelectStyle')).assertEqual('false');
      expect(content.getString('enableGatherSelectedItemsAnimation')).assertEqual('false');
      expect(content.getString('enableFingerMultiSelect')).assertEqual('false');
      console.info('[gridEditModeOptions_static_0200] END');
      done();
    });

    /**
     * @tc.name   gridEditModeOptions_static_0300
     * @tc.number SUB_ARKUI_GRID_EDITMODEOPTIONS_STATIC_0300
     * @tc.desc   Test Grid editModeOptions parameter property with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEditModeOptions_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[gridEditModeOptions_static_0300] START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('grid_editModeOptions_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getElement('editModeOptions');
      console.log('[gridEditModeOptions_static_0300] editModeOptions: '+ content)
      console.log('[gridEditModeOptions_static_0300] useDefaultMultiSelectStyle: '+
        content.getString('useDefaultMultiSelectStyle'))
      console.log('[gridEditModeOptions_static_0300] enableGatherSelectedItemsAnimation: '+
        content.getString('enableGatherSelectedItemsAnimation'))
      console.log('[gridEditModeOptions_static_0300] enableFingerMultiSelect: '+
        content.getString('enableFingerMultiSelect'))
      expect(content.getString('useDefaultMultiSelectStyle')).assertEqual('true');
      expect(content.getString('enableGatherSelectedItemsAnimation')).assertEqual('false');
      expect(content.getString('enableFingerMultiSelect')).assertEqual('true');
      console.info('[gridEditModeOptions_static_0300] END');
      done();
    });
  })
}