/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';

export default function commonNullUndefined() {

  describe('commonNullUndefined', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/commonNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get commonNullUndefined state pages: ' + JSON.stringify(pages));
        if (!('commonNullUndefined' == pages.name)) {
          console.info('get commonNullUndefined state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push commonNullUndefined success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push commonNullUndefined page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('commonNullUndefined after each called');
    });

    /**
     * @tc.number commonNullUndefined_0100
     * @tc.name commonNullUndefined_0100
     * @tc.desc test foregroundEffect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0100', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0100] default is: " + JSON.parse(strJson1)?.$attrs?.foregroundEffect);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0100] undefined is: " + JSON.parse(strJson2)?.$attrs?.foregroundEffect);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0100] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0100] null is: " + JSON.parse(strJson3)?.$attrs?.foregroundEffect);
      expect(JSON.parse(strJson1)?.$attrs?.foregroundEffect)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.foregroundEffect);
      expect(JSON.parse(strJson1)?.$attrs?.foregroundEffect)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.foregroundEffect);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0200
     * @tc.name commonNullUndefined_0200
     * @tc.desc test visualEffect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0200', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0200] default is: " + JSON.parse(strJson1)?.$attrs?.visualEffect);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0200] undefined is: " + JSON.parse(strJson2)?.$attrs?.visualEffect);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0200] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0200] null is: " + JSON.parse(strJson3)?.$attrs?.visualEffect);
      expect(JSON.parse(strJson1)?.$attrs?.visualEffect)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.visualEffect);
      expect(JSON.parse(strJson1)?.$attrs?.visualEffect)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.visualEffect);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0300
     * @tc.name commonNullUndefined_0300
     * @tc.desc test backgroundFilter
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0300', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0300] default is: " + JSON.parse(strJson1)?.$attrs?.backgroundFilter);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0300] undefined is: " + JSON.parse(strJson2)?.$attrs?.backgroundFilter);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0300] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0300] null is: " + JSON.parse(strJson3)?.$attrs?.backgroundFilter);
      expect(JSON.parse(strJson1)?.$attrs?.backgroundFilter)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.backgroundFilter);
      expect(JSON.parse(strJson1)?.$attrs?.backgroundFilter)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.backgroundFilter);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0400
     * @tc.name commonNullUndefined_0400
     * @tc.desc test foregroundFilter
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0400', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0400] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0400] default is: " + JSON.parse(strJson1)?.$attrs?.foregroundFilter);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0400] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0400] undefined is: " + JSON.parse(strJson2)?.$attrs?.foregroundFilter);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0400] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0400] null is: " + JSON.parse(strJson3)?.$attrs?.foregroundFilter);
      expect(JSON.parse(strJson1)?.$attrs?.foregroundFilter)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.foregroundFilter);
      expect(JSON.parse(strJson1)?.$attrs?.foregroundFilter)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.foregroundFilter);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0500
     * @tc.name commonNullUndefined_0500
     * @tc.desc test compositingFilter
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0500', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0500] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0500] default is: " + JSON.parse(strJson1)?.$attrs?.compositingFilter);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0500] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0500] undefined is: " + JSON.parse(strJson2)?.$attrs?.compositingFilter);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0500] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0500] null is: " + JSON.parse(strJson3)?.$attrs?.compositingFilter);
      expect(JSON.parse(strJson1)?.$attrs?.compositingFilter)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.compositingFilter);
      expect(JSON.parse(strJson1)?.$attrs?.compositingFilter)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.compositingFilter);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0600
     * @tc.name commonNullUndefined_0600
     * @tc.desc test compositingFilter
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0600', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0600] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0600] default is: " + JSON.parse(strJson1)?.$attrs?.materialFilter);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0600] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0600] undefined is: " + JSON.parse(strJson2)?.$attrs?.materialFilter);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0600] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0600] null is: " + JSON.parse(strJson3)?.$attrs?.materialFilter);
      expect(JSON.parse(strJson1)?.$attrs?.materialFilter)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.materialFilter);
      expect(JSON.parse(strJson1)?.$attrs?.materialFilter)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.materialFilter);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0600
     * @tc.name commonNullUndefined_0600
     * @tc.desc test borderStyle
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0600', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0600] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0600] default is: " + JSON.parse(strJson1)?.$attrs?.borderStyle);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0600] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0600] undefined is: " + JSON.parse(strJson2)?.$attrs?.borderStyle);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0600] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0600] null is: " + JSON.parse(strJson3)?.$attrs?.borderStyle);
      expect(JSON.parse(strJson1)?.$attrs?.borderStyle)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.borderStyle);
      expect(JSON.parse(strJson1)?.$attrs?.borderStyle)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.borderStyle);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0700
     * @tc.name commonNullUndefined_0700
     * @tc.desc test borderRadius
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0700', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0700] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0700] default is: " + JSON.parse(strJson1)?.$attrs?.borderRadius);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0700] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0700] undefined is: " + JSON.parse(strJson2)?.$attrs?.borderRadius);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0700] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0700] null is: " + JSON.parse(strJson3)?.$attrs?.borderRadius);
      expect(JSON.parse(strJson1)?.$attrs?.borderRadius)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.borderRadius);
      expect(JSON.parse(strJson1)?.$attrs?.borderRadius)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.borderRadius);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0800
     * @tc.name commonNullUndefined_0800
     * @tc.desc test outline
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0800', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0800] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0800] default is: " + JSON.parse(strJson1)?.$attrs?.outline);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0800] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0800] undefined is: " + JSON.parse(strJson2)?.$attrs?.outline);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0800] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0800] null is: " + JSON.parse(strJson3)?.$attrs?.outline);
      expect(JSON.parse(strJson1)?.$attrs?.outline)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.outline);
      expect(JSON.parse(strJson1)?.$attrs?.outline)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.outline);
      done();
    });

    /**
     * @tc.number commonNullUndefined_0900
     * @tc.name commonNullUndefined_0900
     * @tc.desc test outlineStyle
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_0900', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_0900] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_0900] default is: " + JSON.parse(strJson1)?.$attrs?.outlineStyle);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_0900] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_0900] undefined is: " + JSON.parse(strJson2)?.$attrs?.outlineStyle);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_0900] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_0900] null is: " + JSON.parse(strJson3)?.$attrs?.outlineStyle);
      expect(JSON.parse(strJson1)?.$attrs?.outlineStyle)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.outlineStyle);
      expect(JSON.parse(strJson1)?.$attrs?.outlineStyle)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.outlineStyle);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1000
     * @tc.name commonNullUndefined_1000
     * @tc.desc test outlineWidth
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1000', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1000] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1000] default is: " + JSON.parse(strJson1)?.$attrs?.outlineWidth);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1000] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1000] undefined is: " + JSON.parse(strJson2)?.$attrs?.outlineWidth);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1000] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1000] null is: " + JSON.parse(strJson3)?.$attrs?.outlineWidth);
      expect(JSON.parse(strJson1)?.$attrs?.outlineWidth)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.outlineWidth);
      expect(JSON.parse(strJson1)?.$attrs?.outlineWidth)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.outlineWidth);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1100
     * @tc.name commonNullUndefined_1100
     * @tc.desc test outlineWidth
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1100', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1100] default is: " + JSON.parse(strJson1)?.$attrs?.outlineColor);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1100] undefined is: " + JSON.parse(strJson2)?.$attrs?.outlineColor);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1100] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1100] null is: " + JSON.parse(strJson3)?.$attrs?.outlineColor);
      expect(JSON.parse(strJson1)?.$attrs?.outlineColor)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.outlineColor);
      expect(JSON.parse(strJson1)?.$attrs?.outlineColor)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.outlineColor);
      done();
    });

    /**
     * @tc.number commonNullUndefined_1200
     * @tc.name commonNullUndefined_1200
     * @tc.desc test outlineRadius
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('commonNullUndefined_1200', Level.LEVEL2, async (done: Function) => {
      console.info('commonNullUndefined_1200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('commonDefaultId');
      console.info("[commonNullUndefined_1200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[commonNullUndefined_1200] default is: " + JSON.parse(strJson1)?.$attrs?.outlineRadius);

      let strJson2 = getInspectorByKey('commonUndefinedId');
      console.info("[commonNullUndefined_1200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[commonNullUndefined_1200] undefined is: " + JSON.parse(strJson2)?.$attrs?.outlineRadius);

      let strJson3 = getInspectorByKey('commonNullId');
      console.info("[commonNullUndefined_1200] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[commonNullUndefined_1200] null is: " + JSON.parse(strJson3)?.$attrs?.outlineRadius);
      expect(JSON.parse(strJson1)?.$attrs?.outlineRadius)
        .assertEqual(JSON.parse(strJson2)?.$attrs?.outlineRadius);
      expect(JSON.parse(strJson1)?.$attrs?.outlineRadius)
        .assertEqual(JSON.parse(strJson3)?.$attrs?.outlineRadius);
      done();
    });

    /**
    * @tc.number commonNullUndefined_1300
    * @tc.name commonNullUndefined_1300
    * @tc.desc test foregroundColor
    * @tc.level: Level 2
    * @tc.type :
    * @tc.size :
    */
    it('commonNullUndefined_1300', Level.LEVEL2, async (done: Function) => {
        console.info('commonNullUndefined_1300 START');
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson1 = getInspectorByKey('commonDefaultId');
        console.info("[commonNullUndefined_1300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
        console.info("[commonNullUndefined_1300] default is: " + JSON.parse(strJson1)?.$attrs?.foregroundColor);

        let strJson2 = getInspectorByKey('commonUndefinedId');
        console.info("[commonNullUndefined_1300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
        console.info("[commonNullUndefined_1300] undefined is: " + JSON.parse(strJson2)?.$attrs?.foregroundColor);

        let strJson3 = getInspectorByKey('commonNullId');
        console.info("[commonNullUndefined_1300] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
        console.info("[commonNullUndefined_1300] null is: " + JSON.parse(strJson3)?.$attrs?.foregroundColor);
        expect(JSON.parse(strJson1)?.$attrs?.foregroundColor)
            .assertEqual(JSON.parse(strJson2)?.$attrs?.foregroundColor);
        expect(JSON.parse(strJson1)?.$attrs?.foregroundColor)
            .assertEqual(JSON.parse(strJson3)?.$attrs?.foregroundColor);
        done();
    }); 
    
    /**
    * @tc.number commonNullUndefined_1400
    * @tc.name commonNullUndefined_1400
    * @tc.desc test foregroundColor
    * @tc.level: Level 2
    * @tc.type :
    * @tc.size :
    */
    it('commonNullUndefined_1400', Level.LEVEL2, async (done: Function) => {
        console.info('commonNullUndefined_1400 START');
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson1 = getInspectorByKey('commonDefaultId');
        console.info("[commonNullUndefined_1400] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
        console.info("[commonNullUndefined_1400] default is: " + JSON.parse(strJson1)?.$attrs?.transition);

        let strJson2 = getInspectorByKey('commonUndefinedId');
        console.info("[commonNullUndefined_1400] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
        console.info("[commonNullUndefined_1400] undefined is: " + JSON.parse(strJson2)?.$attrs?.foregroundColor);

        let strJson3 = getInspectorByKey('commonNullId');
        console.info("[commonNullUndefined_1400] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
        console.info("[commonNullUndefined_1400] null is: " + JSON.parse(strJson3)?.$attrs?.foregroundColor);
        expect(JSON.parse(strJson1)?.$attrs?.foregroundColor)
            .assertEqual(JSON.parse(strJson2)?.$attrs?.foregroundColor);
        expect(JSON.parse(strJson1)?.$attrs?.foregroundColor)
            .assertEqual(JSON.parse(strJson3)?.$attrs?.foregroundColor);
        done();
    });

    /**
    * @tc.number commonNullUndefined_1500
    * @tc.name commonNullUndefined_1500
    * @tc.desc test motionBlur
    * @tc.level: Level 2
    * @tc.type :
    * @tc.size :
    */
    it('commonNullUndefined_1500', Level.LEVEL2, async (done: Function) => {
        console.info('commonNullUndefined_1500 START');
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson1 = getInspectorByKey('commonDefaultId');
        console.info("[commonNullUndefined_1500] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
        console.info("[commonNullUndefined_1500] default is: " + JSON.parse(strJson1)?.$attrs?.motionBlur);

        let strJson2 = getInspectorByKey('commonUndefinedId');
        console.info("[commonNullUndefined_1500] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
        console.info("[commonNullUndefined_1500] undefined is: " + JSON.parse(strJson2)?.$attrs?.motionBlur);

        let strJson3 = getInspectorByKey('commonNullId');
        console.info("[commonNullUndefined_1500] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
        console.info("[commonNullUndefined_1500] null is: " + JSON.parse(strJson3)?.$attrs?.motionBlur);
        expect(JSON.parse(strJson1)?.$attrs?.motionBlur)
            .assertEqual(JSON.parse(strJson2)?.$attrs?.motionBlur);
        expect(JSON.parse(strJson1)?.$attrs?.motionBlur)
            .assertEqual(JSON.parse(strJson3)?.$attrs?.motionBlur);
        done();
    });

    /**
    * @tc.number commonNullUndefined_1600
    * @tc.name commonNullUndefined_1600
    * @tc.desc test brightness
    * @tc.level: Level 2
    * @tc.type :
    * @tc.size :
    */
    it('commonNullUndefined_1600', Level.LEVEL2, async (done: Function) => {
        console.info('commonNullUndefined_1600 START');
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson1 = getInspectorByKey('commonDefaultId');
        console.info("[commonNullUndefined_1600] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
        console.info("[commonNullUndefined_1600] default is: " + JSON.parse(strJson1)?.$attrs?.brightness);

        let strJson2 = getInspectorByKey('commonUndefinedId');
        console.info("[commonNullUndefined_1600] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
        console.info("[commonNullUndefined_1600] undefined is: " + JSON.parse(strJson2)?.$attrs?.brightness);

        let strJson3 = getInspectorByKey('commonNullId');
        console.info("[commonNullUndefined_1600] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
        console.info("[commonNullUndefined_1600] null is: " + JSON.parse(strJson3)?.$attrs?.brightness);
        expect(JSON.parse(strJson1)?.$attrs?.brightness)
            .assertEqual(JSON.parse(strJson2)?.$attrs?.brightness);
        expect(JSON.parse(strJson1)?.$attrs?.brightness)
            .assertEqual(JSON.parse(strJson3)?.$attrs?.brightness);
    done();
}); 

  })
}
