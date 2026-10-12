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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import nativeFunc from 'libnativefunc.so'

export default function TextStrokeTest() {
  describe('TextStrokeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextStrokeTest beforeEach start");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0100
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0100
     * @tc.desc   Test NODE_TEXT_STROKE_WIDTH setAttribute with positive value and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0100 START');
      expect(nativeFunc.TextStrokeTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0200
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0200
     * @tc.desc   Test NODE_TEXT_STROKE_WIDTH setAttribute with zero value (default) and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0200 START');
      expect(nativeFunc.TextStrokeTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0300
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0300
     * @tc.desc   Test NODE_TEXT_STROKE_WIDTH setAttribute with negative value (solid text) and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0300', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0300 START');
      expect(nativeFunc.TextStrokeTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0400
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0400
     * @tc.desc   Test NODE_TEXT_STROKE_WIDTH setAttribute with large value and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0400', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0400 START');
      expect(nativeFunc.TextStrokeTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0500
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0500
     * @tc.desc   Test NODE_TEXT_STROKE_WIDTH setAttribute with extreme large value and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0500', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0500 START');
      expect(nativeFunc.TextStrokeTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0600
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0600
     * @tc.desc   Test NODE_TEXT_STROKE_WIDTH setAttribute with empty item (size=0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0600', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0600 START');
      expect(nativeFunc.TextStrokeTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0700
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0700
     * @tc.desc   Test NODE_TEXT_STROKE_WIDTH setAttribute with nullptr item
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0700', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0700 START');
      expect(nativeFunc.TextStrokeTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0700 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0800
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0800
     * @tc.desc   Test NODE_TEXT_STROKE_WIDTH resetAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0800', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0800 START');
      expect(nativeFunc.TextStrokeTest_008()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0800 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0900
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0900
     * @tc.desc   Test NODE_TEXT_STROKE_WIDTH getAttribute default value without setting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0900', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0900 START');
      expect(nativeFunc.TextStrokeTest_009()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_0900 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_1000
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_1000
     * @tc.desc   Test NODE_TEXT_STROKE_WIDTH setAttribute then resetAttribute and getAttribute default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_1000', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_1000 START');
      expect(nativeFunc.TextStrokeTest_010()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_WIDTH_1000 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0100
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0100
     * @tc.desc   Test NODE_TEXT_STROKE_COLOR setAttribute with red color and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0100 START');
      expect(nativeFunc.TextStrokeTest_011()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0200
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0200
     * @tc.desc   Test NODE_TEXT_STROKE_COLOR setAttribute with blue color and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0200 START');
      expect(nativeFunc.TextStrokeTest_012()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0300
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0300
     * @tc.desc   Test NODE_TEXT_STROKE_COLOR setAttribute with black color and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0300 START');
      expect(nativeFunc.TextStrokeTest_013()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0400
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0400
     * @tc.desc   Test NODE_TEXT_STROKE_COLOR setAttribute with white color and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0400 START');
      expect(nativeFunc.TextStrokeTest_014()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0500
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0500
     * @tc.desc   Test NODE_TEXT_STROKE_COLOR setAttribute with abnormal color (transparent) and verify default used
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0500', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0500 START');
      expect(nativeFunc.TextStrokeTest_015()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0600
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0600
     * @tc.desc   Test NODE_TEXT_STROKE_COLOR setAttribute with empty item (size=0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0600', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0600 START');
      expect(nativeFunc.TextStrokeTest_016()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0700
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0700
     * @tc.desc   Test NODE_TEXT_STROKE_COLOR setAttribute with nullptr item
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0700', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0700 START');
      expect(nativeFunc.TextStrokeTest_017()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0700 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0800
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0800
     * @tc.desc   Test NODE_TEXT_STROKE_COLOR resetAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0800', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0800 START');
      expect(nativeFunc.TextStrokeTest_018()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0800 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0900
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0900
     * @tc.desc   Test NODE_TEXT_STROKE_COLOR getAttribute default value without setting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0900', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0900 START');
      expect(nativeFunc.TextStrokeTest_019()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_0900 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_COLOR_1000
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_COLOR_1000
     * @tc.desc   Test NODE_TEXT_STROKE_COLOR setAttribute then resetAttribute and getAttribute default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_1000', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_1000 START');
      expect(nativeFunc.TextStrokeTest_020()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_COLOR_1000 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0100
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0100
     * @tc.desc   Test NODE_TEXT_STROKE_JOIN_STYLE setAttribute with MITER_JOIN(0) and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0100 START');
      expect(nativeFunc.TextStrokeTest_021()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0200
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0200
     * @tc.desc   Test NODE_TEXT_STROKE_JOIN_STYLE setAttribute with ROUND_JOIN(1) and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0200 START');
      expect(nativeFunc.TextStrokeTest_022()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0300
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0300
     * @tc.desc   Test NODE_TEXT_STROKE_JOIN_STYLE setAttribute with BEVEL_JOIN(2) and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0300 START');
      expect(nativeFunc.TextStrokeTest_023()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0400
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0400
     * @tc.desc   Test NODE_TEXT_STROKE_JOIN_STYLE setAttribute with invalid value(-1) and verify default used
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0400', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0400 START');
      expect(nativeFunc.TextStrokeTest_024()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0500
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0500
     * @tc.desc   Test NODE_TEXT_STROKE_JOIN_STYLE setAttribute with out-of-range value(100) and verify default used
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0500', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0500 START');
      expect(nativeFunc.TextStrokeTest_025()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0600
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0600
     * @tc.desc   Test NODE_TEXT_STROKE_JOIN_STYLE setAttribute with empty item (size=0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0600', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0600 START');
      expect(nativeFunc.TextStrokeTest_026()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0700
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0700
     * @tc.desc   Test NODE_TEXT_STROKE_JOIN_STYLE setAttribute with nullptr item
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0700', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0700 START');
      expect(nativeFunc.TextStrokeTest_027()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0700 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0800
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0800
     * @tc.desc   Test NODE_TEXT_STROKE_JOIN_STYLE resetAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0800', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0800 START');
      expect(nativeFunc.TextStrokeTest_028()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0800 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0900
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0900
     * @tc.desc   Test NODE_TEXT_STROKE_JOIN_STYLE getAttribute default value without setting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0900', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0900 START');
      expect(nativeFunc.TextStrokeTest_029()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_0900 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_1000
     * @tc.number SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_1000
     * @tc.desc   Test NODE_TEXT_STROKE_JOIN_STYLE setAttribute then resetAttribute and getAttribute default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_1000', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_1000 START');
      expect(nativeFunc.TextStrokeTest_030()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_STROKE_JOIN_STYLE_1000 END');
    });
  });
}
