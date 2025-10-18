/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import { getEnumCount } from './utils';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsPath4Test() {
  describe('DrawingTsPath4Test', () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3200
     * @tc.name      : testPathOpNormalStatic
     * @tc.desc      : testPathOpNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathOpNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testPathOpNormalStatic';
      try {
        expect(drawing.PathOp.DIFFERENCE + '').assertEqual('0');
        expect(drawing.PathOp.INTERSECT + '').assertEqual('1');
        expect(drawing.PathOp.UNION + '').assertEqual('2');
        expect(drawing.PathOp.XOR + '').assertEqual('3');
        expect(drawing.PathOp.REVERSE_DIFFERENCE + '').assertEqual('4');
        console.info(msg + 'PathOp successes');
      } catch (e: BusinessError) {
        console.info(msg + `PathOp errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3800
     * @tc.name      : testPathIsRectNormalStatic
     * @tc.desc      : testPathIsRectNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathIsRectNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsRectNormalStatic';
      let path = new drawing.Path();
      try {
        let isRect = path.isRect(null);
        console.info(msg + `path isRect success`);
        expect(isRect).assertEqual(false);
      } catch (e: BusinessError) {
        console.info(msg + `path isRect error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      let rect: common2D.Rect = { left : 0, top : 0, right : 100, bottom : 100 };
      // canvas.save()
      // path.moveTo(100, 100)
      // path.lineTo(100, 300);
      // path.lineTo(300, 300);
      try {
        let isRect2 = path.isRect(rect);
        console.info(msg + `path isRect2 success  isRect2: ${isRect2}`);
        expect(isRect2).assertEqual(false);
      } catch (e: BusinessError) {
        console.info(msg + `path isRect2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2500
     * @tc.name      : testPenSetAndGetColor4fNormalStatic
     * @tc.desc      : Test for testPenSetAndGetColor4fNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetAndGetColor4fNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetAndGetColor4fNormalStatic';
      let color4f: common2D.Color4f = {
        alpha: 0.8,
        red: 0.5,
        green: 0.4,
        blue: 0.7
      };
    })
  })
}