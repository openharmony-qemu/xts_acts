/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function richEditorTest() {
  describe('richEditorTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextChangeObserver/richEditor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get richEditorTest state pages: ' + JSON.stringify(pages));
        if (!('shaderStyle' == pages.name)) {
          console.info('get richEditorTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push richEditorTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push richEditorTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('textChangeObserverTest after each called');
    });

    /**
     * @tc.number    richEditorTest_0010
     * @tc.name      richEditorTest_0010
     * @tc.desc      Global observer enabled or disabled, text change of the richEditor component, Expected: observed text is 'richEditorTest_0010'
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('richEditorTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[richEditorTest_0010] START');

      let driver:Driver = Driver.create();
      
      let globalObserverOpenButton: Component = await driver.findComponent(ON.id('全局监听(开)'));
      await globalObserverOpenButton.click();

      let richEditor: Component = await driver.findComponent(ON.id('richEditor'));
      await richEditor.inputText('richEditorTest_0010', { paste: true, addition: false });

      let globalOutputRichEditor: Component = await driver.findComponent(ON.id('globalOutputRichEditor'));
      let globalOutput = await globalOutputRichEditor.getText();
      
      console.info('[richEditorTest_0010] textContent: ' + globalOutput);
      expect(globalOutput).assertEqual('richEditorTest_0010');

      let globalObserverCloseButton: Component = await driver.findComponent(ON.id('全局监听(关)'));
      await globalObserverCloseButton.click();

      await richEditor.inputText('Add', { paste: true, addition: true });

      let globalOutput2 = await globalOutputRichEditor.getText();

      console.info('[richEditorTest_0010] textContent: ' + globalOutput2);
      expect(globalOutput2).assertEqual('richEditorTest_0010');

      console.info('[richEditorTest_0010] END');
      done();
    });

    /**
     * @tc.number    richEditorTest_0011
     * @tc.name      richEditorTest_0011
     * @tc.desc      Local observer enabled or disabled, text change of the richEditor component, Expected: observed text is 'richEditorTest_0011'
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('richEditorTest_0011', Level.LEVEL1, async (done: Function) => {
      console.info('[richEditorTest_0011] START');

      let driver:Driver = Driver.create();
      
      let localObserverOpenButton: Component = await driver.findComponent(ON.id('局部richEditor(开)'));
      await localObserverOpenButton.click();

      let richEditor: Component = await driver.findComponent(ON.id('richEditor'));
      await richEditor.inputText('richEditorTest_0011', { paste: true, addition: false });

      let localOutputRichEditor: Component = await driver.findComponent(ON.id('localOutputRichEditor'));
      let localOutput = await localOutputRichEditor.getText();

      console.info('[richEditorTest_0011] textContent: ' + localOutput);
      expect(localOutput).assertEqual('richEditorTest_0011');

      let localObserverCloseButton: Component = await driver.findComponent(ON.id('局部richEditor(关)'));
      await localObserverCloseButton.click();

      await richEditor.inputText('Add', { paste: true, addition: true });

      let localOutput2 = await localOutputRichEditor.getText();

      console.info('[richEditorTest_0011] textContent: ' + localOutput2);
      expect(localOutput2).assertEqual('richEditorTest_0011');

      console.info('[richEditorTest_0011] END');
      done();
    });
  })
}