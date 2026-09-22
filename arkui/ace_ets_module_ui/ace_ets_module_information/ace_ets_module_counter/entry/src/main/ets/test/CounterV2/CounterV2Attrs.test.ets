/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, afterEach, it, expect, Level, afterAll } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

const TAB_KEY: number = 2049;

type InspectorNode = Record<string, ESObject>;

function parseInspector(id: string): InspectorNode {
  return JSON.parse(getInspectorByKey(id)) as InspectorNode;
}

function attrContent(id: string): string {
  let attrs = parseInspector(id)['$attrs'] as InspectorNode;
  return `${attrs['content']}`;
}

async function labelCenterX(driver: Driver, counterId: string, labelText: string): Promise<number> {
  let counter: Component = await driver.findComponent(ON.id(counterId));
  let label: Component = await driver.findComponent(ON.text(labelText));
  let labelRect = await label.getBounds();
  return (labelRect.left + labelRect.right) / 2;
}

async function counterCenterX(driver: Driver, counterId: string): Promise<number> {
  let counter: Component = await driver.findComponent(ON.id(counterId));
  let rect = await counter.getBounds();
  return (rect.left + rect.right) / 2;
}

async function tabUntilFocusText(textId: string, maxTabs: number): Promise<string> {
  let driver = Driver.create();
  for (let i = 0; i < maxTabs; i++) {
    await driver.triggerKey(TAB_KEY);
    await CommonFunc.sleep(300);
    let text = attrContent(textId);
    if (text !== 'focus_idle') {
      return text;
    }
  }
  return attrContent(textId);
}

export default function CounterV2AttrsTest() {
  describe('CounterV2AttrsTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = { url: 'MainAbility/pages/CounterV2/CounterV2Attrs' };
      try {
        router.clear();
        if (router.getState().name !== 'CounterV2Attrs') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.log('[ARKUI_DYN] push CounterV2Attrs error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.log('CounterV2AttrsTest afterEach error: ' + err);
      }
    });
    afterAll(async () => {
      AppStorage.delete('isActive');
      console.info("afterAll case");
    });

    /**
     * @tc.name      SUB_ARKUI_API_CounterV2Attrs_0100
     * @tc.number    SUB_ARKUI_API_COUNTER_V2_ATTRS_0100
     * @tc.desc      CounterV2Attrs rtl layout label alignment test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level0
     */
    it('SUB_ARKUI_API_CounterV2Attrs_0100', Level.LEVEL0, async () => {
      try {
        if(AppStorage.get('isActive')) {
          let driver = Driver.create();
          let labelX = await labelCenterX(driver, 'cv2_attr_list_rtl', '价格');
          let counterX = await counterCenterX(driver, 'cv2_attr_list_rtl');
          expect(labelX > counterX).assertTrue();
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2Attrs_0100 error: ' + err);
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_API_CounterV2Attrs_0200
     * @tc.number    SUB_ARKUI_API_COUNTER_V2_ATTRS_0200
     * @tc.desc      CounterV2Attrs compact ltr counter and label existence test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level0
     */
    it('SUB_ARKUI_API_CounterV2Attrs_0200', Level.LEVEL0, async () => {
      try {
        if(AppStorage.get('isActive')) {
          let driver = Driver.create();
          let counter = await driver.findComponent(ON.id('cv2_attr_compact_ltr'));
          let label = await driver.findComponent(ON.text('数量'));
          expect(counter !== null).assertTrue();
          expect(label !== null).assertTrue();
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2Attrs_0200 error: ' + err);
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_API_CounterV2Attrs_0300
     * @tc.number    SUB_ARKUI_API_COUNTER_V2_ATTRS_0300
     * @tc.desc      CounterV2Attrs inline auto counter existence test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level0
     */
    it('SUB_ARKUI_API_CounterV2Attrs_0300', Level.LEVEL0, async () => {
      try {
        if(AppStorage.get('isActive')) {
          let driver = Driver.create();
          let counter = await driver.findComponent(ON.id('cv2_attr_inline_auto'));
          expect(counter !== null).assertTrue();
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2Attrs_0300 error: ' + err);
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_API_CounterV2Attrs_0400
     * @tc.number    SUB_ARKUI_API_COUNTER_V2_ATTRS_0400
     * @tc.desc      CounterV2Attrs date ymd counter existence test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level0
     */
    it('SUB_ARKUI_API_CounterV2Attrs_0400', Level.LEVEL0, async () => {
      try {
        if(AppStorage.get('isActive')) {
          let driver = Driver.create();
          let counter = await driver.findComponent(ON.id('cv2_attr_date_ymd'));
          expect(counter !== null).assertTrue();
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2Attrs_0400 error: ' + err);
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_API_CounterV2Attrs_0500
     * @tc.number    SUB_ARKUI_API_COUNTER_V2_ATTRS_0500
     * @tc.desc      CounterV2Attrs default date hint content test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level0
     */
    it('SUB_ARKUI_API_CounterV2Attrs_0500', Level.LEVEL0, async () => {
      try {
        if(AppStorage.get('isActive')) {
          await CommonFunc.sleep(800);
          let hint = attrContent('cv2_attr_date_default_hint');
          console.info('[ARKUI_DYN] defaultDate hint=' + hint);
          expect(hint).assertContain('1年');
          expect(hint).assertContain('1月');
          expect(hint).assertContain('1日');
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2Attrs_0500 error: ' + err);
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_API_CounterV2Attrs_0600
     * @tc.number    SUB_ARKUI_API_COUNTER_V2_ATTRS_0600
     * @tc.desc      CounterV2Attrs ymd date hint content test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level0
     */
    it('SUB_ARKUI_API_CounterV2Attrs_0600', Level.LEVEL0, async () => {
      try {
        if(AppStorage.get('isActive')) {
          await CommonFunc.sleep(800);
          let hint = attrContent('cv2_attr_date_ymd_hint');
          console.info('[ARKUI_DYN] ymdDate hint=' + hint);
          expect(hint).assertContain('2025');
          expect(hint).assertContain('18');
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2Attrs_0600 error: ' + err);
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_API_CounterV2Attrs_0700
     * @tc.number    SUB_ARKUI_API_COUNTER_V2_ATTRS_0700
     * @tc.desc      CounterV2Attrs focus true event trigger test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level0
     */
    it('SUB_ARKUI_API_CounterV2Attrs_0700', Level.LEVEL0, async () => {
      try {
        if(AppStorage.get('isActive')) {
          let text = await tabUntilFocusText('cv2_attr_focus_true_text', 15);
          expect(text.indexOf('onFocus') >= 0 || text.indexOf('onBlur') >= 0).assertTrue();
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2Attrs_0700 error: ' + err);
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_API_CounterV2Attrs_0800
     * @tc.number    SUB_ARKUI_API_COUNTER_V2_ATTRS_0800
     * @tc.desc      CounterV2Attrs focus false no event test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level0
     */
    it('SUB_ARKUI_API_CounterV2Attrs_0800', Level.LEVEL0, async () => {
      try {
        if(AppStorage.get('isActive')) {
          let text = await tabUntilFocusText('cv2_attr_focus_false_text', 15);
          expect(text).assertEqual('focus_idle');
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2Attrs_0800 error: ' + err);
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_API_CounterV2Attrs_0900
     * @tc.number    SUB_ARKUI_API_COUNTER_V2_ATTRS_0900
     * @tc.desc      CounterV2Attrs focus undefined event trigger test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level0
     */
    it('SUB_ARKUI_API_CounterV2Attrs_0900', Level.LEVEL0, async () => {
      try {
        if(AppStorage.get('isActive')) {
          let text = await tabUntilFocusText('cv2_attr_focus_undef_text', 20);
          expect(text.indexOf('onFocus') >= 0 || text.indexOf('onBlur') >= 0).assertTrue();
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2Attrs_0900 error: ' + err);
        expect(true).assertEqual(false);
      }
    });
  });
}
