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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function imageSpanResizableTest() {
  describe('imageSpanResizableTest', () => {
    beforeEach(async (done: Function) => {
      console.info('imageSpanResizableTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi26/ImageSpanResizable',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageSpanResizable state pages: ' + JSON.stringify(pages));
        if (!('ImageSpanResizable' == pages.name)) {
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageSpanResizable success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageSpanResizable page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_SLICE_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_SLICE_0100
     * @tc.desc   Test ImageSpanAttribute.resizable with ResizableOptions.slice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_SLICE_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_SLICE_0100] START');
      let strJson: string = getInspectorByKey('imageSpan_resizable_slice');
      expect(strJson.length > 0).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[slice] type/attrs: ' + obj.$type + ' ' + JSON.stringify(obj.$attrs));
      expect(obj.$type !== undefined).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_SLICE_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_LATTICE_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_LATTICE_0100
     * @tc.desc   Test ImageSpanAttribute.resizable with ResizableOptions.lattice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_LATTICE_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_LATTICE_0100] START');
      let strJson: string = getInspectorByKey('imageSpan_resizable_lattice');
      expect(strJson.length > 0).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[lattice] type/attrs: ' + obj.$type + ' ' + JSON.stringify(obj.$attrs));
      expect(obj.$type !== undefined).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_LATTICE_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_NULL_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_NULL_0100
     * @tc.desc   Test ImageSpanAttribute.resizable with null equals default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_NULL_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_NULL_0100] START');
      let strDefault: string = getInspectorByKey('imageSpan_resizable_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strDefault);
      let strJson: string = getInspectorByKey('imageSpan_resizable_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[null] default: ' + JSON.stringify(objDefault.$attrs.resizable));
      console.info('[null] value: ' + JSON.stringify(obj.$attrs.resizable));
      expect(obj.$attrs.resizable).assertEqual(objDefault.$attrs.resizable);
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_NULL_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_UNDEFINED_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_UNDEFINED_0100
     * @tc.desc   Test ImageSpanAttribute.resizable with undefined equals default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_UNDEFINED_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_UNDEFINED_0100] START');
      let strDefault: string = getInspectorByKey('imageSpan_resizable_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strDefault);
      let strJson: string = getInspectorByKey('imageSpan_resizable_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[undefined] default: ' + JSON.stringify(objDefault.$attrs.resizable));
      console.info('[undefined] value: ' + JSON.stringify(obj.$attrs.resizable));
      expect(obj.$attrs.resizable).assertEqual(objDefault.$attrs.resizable);
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPAN_RESIZABLE_UNDEFINED_0100] END');
    });
  });
}
