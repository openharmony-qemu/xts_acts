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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

export default function DrawingPathEffectPart3Test() {

  describe('DrawingPathEffectPart3Test', () => {
    let myColor: common2D.Color;
    
    beforeAll(() => {
      myColor = { alpha: 255, red: 255, green: 0, blue: 0 };
    })
    /**
     * @tc.name   testCreateDashPathEffectBoundary001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_0100
     * @tc.desc   createDashPathEffect intervals array boundary test with single element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary001';
      try {
        let effect = drawing.PathEffect.createDashPathEffect([10], 5);
        console.info(msg + ' createDashPathEffect with single element array should fail');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` createDashPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCreateDashPathEffectBoundary002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_0200
     * @tc.desc   createDashPathEffect intervals array boundary test with odd number elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary002';
      try {
        let effect = drawing.PathEffect.createDashPathEffect([10, 5, 8], 5);
        console.info(msg + ' createDashPathEffect with odd number elements array should fail');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` createDashPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testCreateDashPathEffectBoundary003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_0300
     * @tc.desc   createDashPathEffect intervals array boundary test with negative value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary003';
      try {
        let effect = drawing.PathEffect.createDashPathEffect([10, -5], 5);
        console.info(msg + ' createDashPathEffect with negative value success');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDashPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCreateDashPathEffectBoundary004
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_0400
     * @tc.desc   createDashPathEffect intervals array boundary test with zero value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary004';
      try {
        let effect = drawing.PathEffect.createDashPathEffect([10, 0], 5);
        console.info(msg + ' createDashPathEffect with zero value success');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDashPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateDashPathEffectBoundary005
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_0500
     * @tc.desc   createDashPathEffect intervals array test with multiple pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDashPathEffectBoundary005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateDashPathEffectBoundary005';
      try {
        let effect = drawing.PathEffect.createDashPathEffect([10, 5, 20, 10], 5);
        console.info(msg + ' createDashPathEffect with multiple pairs succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDashPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateDashPathEffectBoundary006
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_0600
     * @tc.desc   createDashPathEffect phase parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary006', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary006';
      try {
        let effect = drawing.PathEffect.createDashPathEffect([10, 5], Number.MAX_VALUE);
        console.info(msg + ' createDashPathEffect with MAX_VALUE phase succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDashPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateDashPathEffectBoundary007
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_0700
     * @tc.desc   createDashPathEffect phase parameter boundary test with min value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary007', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary007';
      try {
        let effect = drawing.PathEffect.createDashPathEffect([10, 5], Number.MIN_VALUE);
        console.info(msg + ' createDashPathEffect with MIN_VALUE phase succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDashPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateDashPathEffectBoundary008
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_0800
     * @tc.desc   createDashPathEffect phase parameter boundary test with negative value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDashPathEffectBoundary008', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateDashPathEffectBoundary008';
      try {
        let effect = drawing.PathEffect.createDashPathEffect([10, 5], -10);
        console.info(msg + ' createDashPathEffect with negative phase succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDashPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreatePathDashEffectBoundary001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_1100
     * @tc.desc   createPathDashEffect advance parameter boundary test with zero.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePathDashEffectBoundary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreatePathDashEffectBoundary001';
      const path1 = new drawing.Path();
      path1.moveTo(0, 0);
      path1.lineTo(10, 0);
      try {
        let effect = drawing.PathEffect.createPathDashEffect(path1, 0, -30, drawing.PathDashStyle.MORPH);
        console.info(msg + ' createPathDashEffect with zero advance should fail');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` createPathDashEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCreatePathDashEffectBoundary002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_1200
     * @tc.desc   createPathDashEffect advance parameter boundary test with negative value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePathDashEffectBoundary002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreatePathDashEffectBoundary002';
      const path1 = new drawing.Path();
      path1.moveTo(0, 0);
      path1.lineTo(10, 0);
      try {
        let effect = drawing.PathEffect.createPathDashEffect(path1, -50, -30, drawing.PathDashStyle.MORPH);
        console.info(msg + ' createPathDashEffect with negative advance should fail');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` createPathDashEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCreatePathDashEffectBoundary003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_1300
     * @tc.desc   createPathDashEffect advance parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePathDashEffectBoundary003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreatePathDashEffectBoundary003';
      const path1 = new drawing.Path();
      path1.moveTo(0, 0);
      path1.lineTo(10, 0);
      try {
        let effect = drawing.PathEffect.createPathDashEffect(path1, Number.MAX_VALUE, -30, drawing.PathDashStyle.MORPH);
        console.info(msg + ' createPathDashEffect with MAX_VALUE advance succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createPathDashEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreatePathDashEffectBoundary004
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_1400
     * @tc.desc   createPathDashEffect phase parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePathDashEffectBoundary004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreatePathDashEffectBoundary004';
      const path1 = new drawing.Path();
      path1.moveTo(0, 0);
      path1.lineTo(10, 0);
      try {
        let effect = drawing.PathEffect.createPathDashEffect(path1, 50, Number.MAX_VALUE, drawing.PathDashStyle.MORPH);
        console.info(msg + ' createPathDashEffect with MAX_VALUE phase succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createPathDashEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreatePathDashEffectBoundary005
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_1500
     * @tc.desc   createPathDashEffect phase parameter boundary test with min value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePathDashEffectBoundary005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreatePathDashEffectBoundary005';
      const path1 = new drawing.Path();
      path1.moveTo(0, 0);
      path1.lineTo(10, 0);
      try {
        let effect = drawing.PathEffect.createPathDashEffect(path1, 50, Number.MIN_VALUE, drawing.PathDashStyle.MORPH);
        console.info(msg + ' createPathDashEffect with MIN_VALUE phase succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createPathDashEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreatePathDashEffectReturn001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_1600
     * @tc.desc   createPathDashEffect return value verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePathDashEffectReturn001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      const msg = 'testCreatePathDashEffectReturn001';
      const path1 = new drawing.Path();
      path1.moveTo(0, 0);
      path1.lineTo(10, 0);
      path1.lineTo(20, 10);
      path1.lineTo(0, 10);
      try {
        let effect = drawing.PathEffect.createPathDashEffect(path1, 50, 30, drawing.PathDashStyle.TRANSLATE);
        console.info(msg + ' createPathDashEffect succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
        done();
      } catch (e) {
        console.info(msg + ` createPathDashEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCreatePathDashEffectPathBoundary001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_1800
     * @tc.desc   createPathDashEffect path parameter boundary test with empty path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePathDashEffectPathBoundary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreatePathDashEffectPathBoundary001';
      const emptyPath = new drawing.Path();
      try {
        let effect = drawing.PathEffect.createPathDashEffect(emptyPath, 50, 30, drawing.PathDashStyle.MORPH);
        console.info(msg + ' createPathDashEffect with empty path succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createPathDashEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateCornerPathEffectReturn001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_1900
     * @tc.desc   createCornerPathEffect return value verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateCornerPathEffectReturn001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateCornerPathEffectReturn001';
      try {
        let effect = drawing.PathEffect.createCornerPathEffect(30);
        console.info(msg + ' createCornerPathEffect succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createCornerPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateCornerPathEffectBoundary001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_2000
     * @tc.desc   createCornerPathEffect radius parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateCornerPathEffectBoundary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateCornerPathEffectBoundary001';
      try {
        let effect = drawing.PathEffect.createCornerPathEffect(Number.MAX_VALUE);
        console.info(msg + ' createCornerPathEffect with MAX_VALUE radius succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createCornerPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateCornerPathEffectBoundary002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_2100
     * @tc.desc   createCornerPathEffect radius parameter boundary test with min positive value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateCornerPathEffectBoundary002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateCornerPathEffectBoundary002';
      try {
        let effect = drawing.PathEffect.createCornerPathEffect(Number.MIN_VALUE);
        console.info(msg + ' createCornerPathEffect with MIN_VALUE radius succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createCornerPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCreateDiscretePathEffectBoundary001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_2300
     * @tc.desc   createDiscretePathEffect segLength parameter boundary test with zero.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDiscretePathEffectBoundary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDiscretePathEffectBoundary001';
      try {
        let effect = drawing.PathEffect.createDiscretePathEffect(0, -50, 0);
        console.info(msg + ' createDiscretePathEffect with zero segLength succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDiscretePathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateDiscretePathEffectBoundary002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_2400
     * @tc.desc   createDiscretePathEffect segLength parameter boundary test with negative value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDiscretePathEffectBoundary002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDiscretePathEffectBoundary002';
      try {
        let effect = drawing.PathEffect.createDiscretePathEffect(-100, -50, 0);
        console.info(msg + ' createDiscretePathEffect with negative segLength succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDiscretePathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateDiscretePathEffectBoundary003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_2500
     * @tc.desc   createDiscretePathEffect dev parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDiscretePathEffectBoundary003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDiscretePathEffectBoundary003';
      try {
        let effect = drawing.PathEffect.createDiscretePathEffect(100, Number.MAX_VALUE, 0);
        console.info(msg + ' createDiscretePathEffect with MAX_VALUE dev succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDiscretePathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateDiscretePathEffectBoundary004
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_2600
     * @tc.desc   createDiscretePathEffect dev parameter boundary test with min value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDiscretePathEffectBoundary004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDiscretePathEffectBoundary004';
      try {
        let effect = drawing.PathEffect.createDiscretePathEffect(100, Number.MIN_VALUE, 0);
        console.info(msg + ' createDiscretePathEffect with MIN_VALUE dev succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDiscretePathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateDiscretePathEffectBoundary005
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_2700
     * @tc.desc   createDiscretePathEffect seedAssist parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDiscretePathEffectBoundary005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDiscretePathEffectBoundary005';
      try {
        let effect = drawing.PathEffect.createDiscretePathEffect(100, -50, Number.MAX_SAFE_INTEGER);
        console.info(msg + ' createDiscretePathEffect with MAX_SAFE_INTEGER seedAssist succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDiscretePathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateDiscretePathEffectBoundary006
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_2800
     * @tc.desc   createDiscretePathEffect seedAssist parameter boundary test without optional param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDiscretePathEffectBoundary006', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateDiscretePathEffectBoundary006';
      try {
        let effect = drawing.PathEffect.createDiscretePathEffect(100, -50);
        console.info(msg + ' createDiscretePathEffect without seedAssist succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDiscretePathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateDiscretePathEffectReturn001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_2900
     * @tc.desc   createDiscretePathEffect return value verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDiscretePathEffectReturn001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateDiscretePathEffectReturn001';
      try {
        let effect = drawing.PathEffect.createDiscretePathEffect(100, 50, 0);
        console.info(msg + ' createDiscretePathEffect succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDiscretePathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateComposePathEffectReturn001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_3000
     * @tc.desc   createComposePathEffect return value verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateComposePathEffectReturn001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateComposePathEffectReturn001';
      let pathEffect1 = drawing.PathEffect.createCornerPathEffect(100);
      let pathEffect2 = drawing.PathEffect.createCornerPathEffect(10);
      try {
        let effect = drawing.PathEffect.createComposePathEffect(pathEffect1, pathEffect2);
        console.info(msg + ' createComposePathEffect succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createComposePathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateComposePathEffectCombine001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_3100
     * @tc.desc   createComposePathEffect with different PathEffect types combination test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateComposePathEffectCombine001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateComposePathEffectCombine001';
      let pathEffect1 = drawing.PathEffect.createDashPathEffect([10, 5], 5);
      let pathEffect2 = drawing.PathEffect.createCornerPathEffect(30);
      try {
        let effect = drawing.PathEffect.createComposePathEffect(pathEffect1, pathEffect2);
        console.info(msg + ' createComposePathEffect with different types succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createComposePathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateComposePathEffectCombine002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_3200
     * @tc.desc   createComposePathEffect with DiscretePathEffect combination test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateComposePathEffectCombine002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateComposePathEffectCombine002';
      let pathEffect1 = drawing.PathEffect.createDiscretePathEffect(100, 50, 0);
      let pathEffect2 = drawing.PathEffect.createCornerPathEffect(30);
      try {
        let effect = drawing.PathEffect.createComposePathEffect(pathEffect1, pathEffect2);
        console.info(msg + ' createComposePathEffect with DiscretePathEffect succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createComposePathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateSumPathEffectReturn001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_3300
     * @tc.desc   createSumPathEffect return value verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSumPathEffectReturn001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateSumPathEffectReturn001';
      let intervals = [10, 5];
      let pathEffectOne = drawing.PathEffect.createDashPathEffect(intervals, 5);
      let pathEffectTwo = drawing.PathEffect.createDashPathEffect(intervals, 10);
      try {
        let effect = drawing.PathEffect.createSumPathEffect(pathEffectOne, pathEffectTwo);
        console.info(msg + ' createSumPathEffect succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createSumPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateSumPathEffectCombine001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_3400
     * @tc.desc   createSumPathEffect with different PathEffect types combination test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSumPathEffectCombine001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateSumPathEffectCombine001';
      let pathEffectOne = drawing.PathEffect.createDashPathEffect([10, 5], 5);
      let pathEffectTwo = drawing.PathEffect.createCornerPathEffect(30);
      try {
        let effect = drawing.PathEffect.createSumPathEffect(pathEffectOne, pathEffectTwo);
        console.info(msg + ' createSumPathEffect with different types succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createSumPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateSumPathEffectCombine002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_3500
     * @tc.desc   createSumPathEffect with DiscretePathEffect combination test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSumPathEffectCombine002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateSumPathEffectCombine002';
      let pathEffectOne = drawing.PathEffect.createDiscretePathEffect(100, 50, 0);
      let pathEffectTwo = drawing.PathEffect.createCornerPathEffect(30);
      try {
        let effect = drawing.PathEffect.createSumPathEffect(pathEffectOne, pathEffectTwo);
        console.info(msg + ' createSumPathEffect with DiscretePathEffect succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createSumPathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}