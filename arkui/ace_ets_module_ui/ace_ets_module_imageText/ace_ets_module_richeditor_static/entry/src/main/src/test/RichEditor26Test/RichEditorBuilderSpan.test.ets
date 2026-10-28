'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterAll, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const SLEEP_TIME = 500;

export default function richEditorBuilderSpanTest(): void {
  describe('richEditorBuilderSpanTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('richEditorBuilderSpanTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.richeditor.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('richEditorBuilderSpanTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor26/RichEditorBuilderSpan',
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info('richEditorBuilderSpanTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'RichEditorBuilderSpan') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('richEditorBuilderSpanTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterAll(() => {
      AppStorage.delete('builderSpan_add_with_info');
      AppStorage.delete('builderSpan_add_undefined_info');
      AppStorage.delete('builderSpan_get_all');
      AppStorage.delete('builderSpan_get_range');
      AppStorage.delete('builderSpan_get_undefined');
      AppStorage.delete('builderSpan_delete');
      AppStorage.delete('builderSpan_global_controller');
      AppStorage.delete('builderSpan_info_onAttach_id');
      AppStorage.delete('builderSpan_info_onAttach_offset');
      AppStorage.delete('builderSpan_info_onDetach_id');
      AppStorage.delete('builderSpan_info_onDetach_offset');
      AppStorage.delete('builderSpan_undef_onAttach_id');
      AppStorage.delete('builderSpan_undef_onAttach_offset');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0100
     * @tc.desc   Test addRichEditorBuilderSpan with BuilderSpanInfo id and offset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpan_add_with_info_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_builderSpan_add_with_info'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string | undefined = AppStorage.get<string>('builderSpan_add_with_info');
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(AppStorage.get<string>('builderSpan_info_onAttach_id')).assertEqual('span_a');
      console.info('[richEditorBuilderSpan_add_with_info_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0200
     * @tc.desc   Test addRichEditorBuilderSpan with undefined BuilderSpanInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0200', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpan_add_undefined_info_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_builderSpan_add_undefined_info'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string | undefined = AppStorage.get<string>('builderSpan_add_undefined_info');
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      console.info('[richEditorBuilderSpan_add_undefined_info_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0100
     * @tc.desc   Test getRichEditorBuilderSpans returns BuilderSpanInfo list
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpan_get_all_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let addBtn = await driver.findComponent(ON.id('btn_builderSpan_add_with_info'));
      await (addBtn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let getBtn = await driver.findComponent(ON.id('btn_builderSpan_get_all'));
      await (getBtn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('builderSpan_get_all');
      expect(result !== undefined && result !== 'failed' && result !== 'undefined').assertTrue();
      expect((result as string).includes('span_a')).assertTrue();
      console.info('[richEditorBuilderSpan_get_all_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0200
     * @tc.desc   Test getRichEditorBuilderSpans with RichEditorRange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0200', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpan_get_range_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let addBtn = await driver.findComponent(ON.id('btn_builderSpan_add_with_info'));
      await (addBtn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let getBtn = await driver.findComponent(ON.id('btn_builderSpan_get_range'));
      await (getBtn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('builderSpan_get_range');
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[richEditorBuilderSpan_get_range_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0300
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0300
     * @tc.desc   Test getRichEditorBuilderSpans with undefined range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0300', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpan_get_undefined_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let addBtn = await driver.findComponent(ON.id('btn_builderSpan_add_with_info'));
      await (addBtn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let getBtn = await driver.findComponent(ON.id('btn_builderSpan_get_undefined'));
      await (getBtn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('builderSpan_get_undefined');
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[richEditorBuilderSpan_get_undefined_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_DETACH_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_DETACH_0100
     * @tc.desc   Test RichEditorBuilderSpan onDetach after deleteSpans
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_DETACH_0100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpan_onDetach_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let addBtn = await driver.findComponent(ON.id('btn_builderSpan_add_with_info'));
      await (addBtn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let delBtn = await driver.findComponent(ON.id('btn_builderSpan_delete'));
      await (delBtn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(AppStorage.get<string>('builderSpan_delete')).assertEqual('success');
      expect(AppStorage.get<string>('builderSpan_info_onDetach_id')).assertEqual('span_a');
      console.info('[richEditorBuilderSpan_onDetach_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GLOBAL_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GLOBAL_0100
     * @tc.desc   Test global RichEditorController addTextSpan and getSpans
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GLOBAL_0100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpan_global_controller_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_builderSpan_global_controller'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let count: string | undefined = AppStorage.get<string>('builderSpan_global_controller');
      expect(count !== undefined && count !== 'failed').assertTrue();
      expect(Number(count as string) > 0).assertTrue();
      console.info('[richEditorBuilderSpan_global_controller_0100] END');
    });
  });
}
