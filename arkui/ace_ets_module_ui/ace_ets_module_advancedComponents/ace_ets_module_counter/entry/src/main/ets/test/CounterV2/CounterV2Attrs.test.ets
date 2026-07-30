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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
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
        console.error('[ARKUI_DYN] push CounterV2Attrs error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
    });

    it('SUB_ARKUI_API_CounterV2Attrs_0100', Level.LEVEL0, async () => {
      let driver = Driver.create();
      let labelX = await labelCenterX(driver, 'cv2_attr_list_rtl', '价格');
      let counterX = await counterCenterX(driver, 'cv2_attr_list_rtl');
      expect(labelX > counterX).assertTrue();
    });

    it('SUB_ARKUI_API_CounterV2Attrs_0200', Level.LEVEL0, async () => {
      let driver = Driver.create();
      let counter = await driver.findComponent(ON.id('cv2_attr_compact_ltr'));
      let label = await driver.findComponent(ON.text('数量'));
      expect(counter !== null).assertTrue();
      expect(label !== null).assertTrue();
    });

    it('SUB_ARKUI_API_CounterV2Attrs_0300', Level.LEVEL0, async () => {
      let driver = Driver.create();
      let counter = await driver.findComponent(ON.id('cv2_attr_inline_auto'));
      expect(counter !== null).assertTrue();
    });

    it('SUB_ARKUI_API_CounterV2Attrs_0400', Level.LEVEL0, async () => {
      let driver = Driver.create();
      let counter = await driver.findComponent(ON.id('cv2_attr_date_ymd'));
      expect(counter !== null).assertTrue();
    });

    it('SUB_ARKUI_API_CounterV2Attrs_0500', Level.LEVEL0, async () => {
      await CommonFunc.sleep(800);
      let hint = attrContent('cv2_attr_date_default_hint');
      console.info('[ARKUI_DYN] defaultDate hint=' + hint);
      expect(hint).assertContain('1年');
      expect(hint).assertContain('1月');
      expect(hint).assertContain('1日');
    });

    it('SUB_ARKUI_API_CounterV2Attrs_0600', Level.LEVEL0, async () => {
      await CommonFunc.sleep(800);
      let hint = attrContent('cv2_attr_date_ymd_hint');
      console.info('[ARKUI_DYN] ymdDate hint=' + hint);
      expect(hint).assertContain('2025');
      expect(hint).assertContain('18');
    });

    it('SUB_ARKUI_API_CounterV2Attrs_0700', Level.LEVEL0, async () => {
      let text = await tabUntilFocusText('cv2_attr_focus_true_text', 15);
      expect(text.indexOf('onFocus') >= 0 || text.indexOf('onBlur') >= 0).assertTrue();
    });

    it('SUB_ARKUI_API_CounterV2Attrs_0800', Level.LEVEL0, async () => {
      let text = await tabUntilFocusText('cv2_attr_focus_false_text', 15);
      expect(text).assertEqual('focus_idle');
    });

    it('SUB_ARKUI_API_CounterV2Attrs_0900', Level.LEVEL0, async () => {
      let text = await tabUntilFocusText('cv2_attr_focus_undef_text', 20);
      expect(text.indexOf('onFocus') >= 0 || text.indexOf('onBlur') >= 0).assertTrue();
    });
  });
}
