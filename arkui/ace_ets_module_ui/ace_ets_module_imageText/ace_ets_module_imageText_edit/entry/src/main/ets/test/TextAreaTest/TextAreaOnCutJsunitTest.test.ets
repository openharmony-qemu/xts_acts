/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'

export default function TextAreaOnCutJsunitTest() {
  describe('TextAreaOnCutJsunitTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextArea/TextAreaOnCutJsunitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaOnCutJsunitTest state success " + JSON.stringify(pages));
        if (!("TextAreaOnCutJsunitTest" == pages.name)) {
          console.info("get TextAreaOnCutJsunitTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextAreaOnCutJsunitTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaOnCutJsunitTest page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("TextAreaOnCutJsunitTest after each called");
    });

    /*
     * @tc.number       testtextAreaOnCut0001
     * @tc.name         testtextAreaOnCut0001
     * @tc.desc         acetextAreaOnCutEtsTest0001
     * @tc.level:       Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testtextAreaOnCut0001', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutTextTextArea');
      console.info("[testtextAreaOnCut0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
      console.info("[testtextAreaOnCut0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /*
     * @tc.number       testtextAreaOnCut0002
     * @tc.name         testtextAreaOnCut0002
     * @tc.desc         acetextAreaOnCutEtsTest0002
     * @tc.level:       Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testtextAreaOnCut0002', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutTextTextArea');
      console.info("[testtextAreaOnCut0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("70.00vp");
      console.info("[testtextAreaOnCut0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /*
     * @tc.number       testtextAreaOnCut0003
     * @tc.name         testtextAreaOnCut0003
     * @tc.desc         acetextAreaOnCutEtsTest0003
     * @tc.level:       Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testtextAreaOnCut0003', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutTextTextArea');
      console.info("[testtextAreaOnCut0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testtextAreaOnCut0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);

    });

    /*
     * @tc.number       testtextAreaOnCut0004
     * @tc.name         testtextAreaOnCut0004
     * @tc.desc         acetextAreaOnCutEtsTest0004
     * @tc.level:       Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testtextAreaOnCut0004', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutTextTextArea');
      console.info("[testtextAreaOnCut0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testtextAreaOnCut0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /*
     * @tc.number       testtextAreaOnCut0005
     * @tc.name         testtextAreaOnCut0005
     * @tc.desc         acetextAreaOnCutEtsTest0005
     * @tc.level:       Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testtextAreaOnCut0005', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutTextTextArea');
      console.info("[testtextAreaOnCut0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testtextAreaOnCut0005] align value :" + JSON.parse(strJson).$attrs.align);

    });

    /*
     * @tc.number       testtextAreaOnCut0006
     * @tc.name         testtextAreaOnCut0006
     * @tc.desc         acetextAreaOnCutEtsTest0006
     * @tc.level:       Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testtextAreaOnCut0006', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutTextTextArea');
      console.info("[testtextAreaOnCut0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testtextAreaOnCut0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);

    });


    /*
     * @tc.number       testtextAreaOnCut0009
     * @tc.name         testtextAreaOnCut0009
     * @tc.desc         acetextAreaOnCutEtsTest0009
     * @tc.level:       Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testtextAreaOnCut0009', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutTextTextArea');
      console.info("[testtextAreaOnCut0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("10.00vp");
      console.info("[testtextAreaOnCut0009] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /*
     * @tc.number       testtextAreaOnCut0010
     * @tc.name         testtextAreaOnCut0010
     * @tc.desc         acetextAreaOnCutEtsTest0010
     * @tc.level:       Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testtextAreaOnCut0010', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutTextTextArea');
      console.info("[testtextAreaOnCut0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testtextAreaOnCut0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);

    });

    /*
     * @tc.number       testtextAreaCopyOption0011
     * @tc.name         testtextAreaCopyOption0011
     * @tc.desc         acetextAreaOnCutEtsTest0011
     * @tc.level:       Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testtextAreaCopyOption0011', Level.LEVEL0, async () => {
      console.info('textAreaCopyOption testtextAreaCopyOption0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textAreaCopyOptionText');
      console.info("[testtextAreaCopyOption0011] component copyOption strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.copyOption).assertEqual('CopyOptions.None');
      console.info("[testtextAreaCopyOption0011] copyOption value :" + JSON.parse(strJson).$attrs.copyOption);

    });


  })
}
