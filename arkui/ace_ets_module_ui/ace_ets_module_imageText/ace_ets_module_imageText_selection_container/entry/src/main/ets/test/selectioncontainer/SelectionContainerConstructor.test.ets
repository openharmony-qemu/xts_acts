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

export default function SelectionContainerConstructorTest() {
  describe('SelectionContainerConstructorTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerConstructorTest] beforeAll called');
    });

    beforeEach(async (done: Function) => {
      console.info('[SelectionContainerConstructorTest] beforeEach called');
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerConstructor'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!("SelectionContainerConstructor" == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[SelectionContainerConstructorTest] push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      console.info('[SelectionContainerConstructorTest] afterEach called');
      await Utils.sleep(1000);
    });

    afterAll(async () => {
      console.info('[SelectionContainerConstructorTest] afterAll called');
      router.clear();
    });

    /**
     * @tc.name   selectionContainerConstructor_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CONSTRUCTOR_0100
     * @tc.desc   Test SelectionContainer constructor, verify the component exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerConstructor_0100', Level.LEVEL0, async () => {
      console.info('[selectionContainerConstructor_0100] START');
      let strJson: string = getInspectorByKey('selectioncontainer_constructor');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerConstructor_0100] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SelectionContainer');
      console.info('[selectionContainerConstructor_0100] END');
    });
  });
}
