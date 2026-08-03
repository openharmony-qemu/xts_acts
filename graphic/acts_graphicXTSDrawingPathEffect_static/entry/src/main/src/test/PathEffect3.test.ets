'use static';
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

export default function DrawingPathEffectPart3Test(): void {

  describe('DrawingPathEffectPart3Test', (): void => {
    let myColor: common2D.Color;

    beforeAll(() => {
      myColor = { alpha: 255, red: 255, green: 0, blue: 0 };
    })
    /**
     * @tc.name   testCreateDashPathEffectBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_0100
     * @tc.desc   createDashPathEffect intervals array boundary test with single element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary001Static';
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
     * @tc.name   testCreateDashPathEffectBoundary002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_0200
     * @tc.desc   createDashPathEffect intervals array boundary test with odd number elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary002Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary002Static';
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
     * @tc.name   testCreateDashPathEffectBoundary003Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_0300
     * @tc.desc   createDashPathEffect intervals array boundary test with negative value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary003Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary003Static';
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
     * @tc.name   testCreateDashPathEffectBoundary004Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_0400
     * @tc.desc   createDashPathEffect intervals array boundary test with zero value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary004Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary004Static';
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
     * @tc.name   testCreateDashPathEffectBoundary005Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_0500
     * @tc.desc   createDashPathEffect intervals array test with multiple pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDashPathEffectBoundary005Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateDashPathEffectBoundary005Static';
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
     * @tc.name   testCreateDashPathEffectBoundary006Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_0600
     * @tc.desc   createDashPathEffect phase parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary006Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary006Static';
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
     * @tc.name   testCreateDashPathEffectBoundary007Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_0700
     * @tc.desc   createDashPathEffect phase parameter boundary test with min value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectBoundary007Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectBoundary007Static';
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
     * @tc.name   testCreateDashPathEffectBoundary008Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_0800
     * @tc.desc   createDashPathEffect phase parameter boundary test with negative value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDashPathEffectBoundary008Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateDashPathEffectBoundary008Static';
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
     * @tc.name   testCreatePathDashEffectBoundary003Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_1300
     * @tc.desc   createPathDashEffect advance parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePathDashEffectBoundary003Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreatePathDashEffectBoundary003Static';
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
     * @tc.name   testCreatePathDashEffectBoundary004Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_1400
     * @tc.desc   createPathDashEffect phase parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePathDashEffectBoundary004Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreatePathDashEffectBoundary004Static';
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
     * @tc.name   testCreatePathDashEffectBoundary005Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_1500
     * @tc.desc   createPathDashEffect phase parameter boundary test with min value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePathDashEffectBoundary005Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreatePathDashEffectBoundary005Static';
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
     * @tc.name   testCreatePathDashEffectReturn001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_1600
     * @tc.desc   createPathDashEffect return value verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePathDashEffectReturn001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      const msg = 'testCreatePathDashEffectReturn001Static';
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
     * @tc.name   testCreatePathDashEffectPathBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_1800
     * @tc.desc   createPathDashEffect path parameter boundary test with empty path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePathDashEffectPathBoundary001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreatePathDashEffectPathBoundary001Static';
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
     * @tc.name   testCreateCornerPathEffectReturn001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_1900
     * @tc.desc   createCornerPathEffect return value verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateCornerPathEffectReturn001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateCornerPathEffectReturn001Static';
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
     * @tc.name   testCreateCornerPathEffectBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_2000
     * @tc.desc   createCornerPathEffect radius parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateCornerPathEffectBoundary001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateCornerPathEffectBoundary001Static';
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
     * @tc.name   testCreateCornerPathEffectBoundary002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_2100
     * @tc.desc   createCornerPathEffect radius parameter boundary test with min positive value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateCornerPathEffectBoundary002Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateCornerPathEffectBoundary002Static';
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
     * @tc.name   testCreateDiscretePathEffectBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_2300
     * @tc.desc   createDiscretePathEffect segLength parameter boundary test with zero.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDiscretePathEffectBoundary001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDiscretePathEffectBoundary001Static';
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
     * @tc.name   testCreateDiscretePathEffectBoundary002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_2400
     * @tc.desc   createDiscretePathEffect segLength parameter boundary test with negative value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDiscretePathEffectBoundary002Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDiscretePathEffectBoundary002Static';
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
     * @tc.name   testCreateDiscretePathEffectBoundary003Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_2500
     * @tc.desc   createDiscretePathEffect dev parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDiscretePathEffectBoundary003Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDiscretePathEffectBoundary003Static';
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
     * @tc.name   testCreateDiscretePathEffectBoundary004Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_2600
     * @tc.desc   createDiscretePathEffect dev parameter boundary test with min value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDiscretePathEffectBoundary004Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateDiscretePathEffectBoundary004Static';
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
     * @tc.name   testCreateDiscretePathEffectBoundary005Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_2700
     * @tc.desc   createDiscretePathEffect seedAssist parameter boundary test with max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDiscretePathEffectBoundary005Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testCreateDiscretePathEffectBoundary005Static';
      try {
        let effect = drawing.PathEffect.createDiscretePathEffect(100, -50, (Number.MAX_SAFE_INTEGER).toInt());
        console.info(msg + ' createDiscretePathEffect with MAX_SAFE_INTEGER seedAssist succeeded');
        expect(effect != null).assertTrue();
        expect(effect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` createDiscretePathEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCreateDiscretePathEffectBoundary006Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_2800
     * @tc.desc   createDiscretePathEffect seedAssist parameter boundary test without optional param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDiscretePathEffectBoundary006Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateDiscretePathEffectBoundary006Static';
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
     * @tc.name   testCreateDiscretePathEffectReturn001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_2900
     * @tc.desc   createDiscretePathEffect return value verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDiscretePathEffectReturn001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateDiscretePathEffectReturn001Static';
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
     * @tc.name   testCreateComposePathEffectReturn001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_3000
     * @tc.desc   createComposePathEffect return value verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateComposePathEffectReturn001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateComposePathEffectReturn001Static';
      let pathEffect1: drawing.PathEffect = drawing.PathEffect.createCornerPathEffect(100)!;
      let pathEffect2: drawing.PathEffect = drawing.PathEffect.createCornerPathEffect(10)!;
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
     * @tc.name   testCreateComposePathEffectCombine001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_3100
     * @tc.desc   createComposePathEffect with different PathEffect types combination test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateComposePathEffectCombine001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateComposePathEffectCombine001Static';
      let pathEffect1: drawing.PathEffect = drawing.PathEffect.createDashPathEffect([10.0, 5.0], 5)!;
      let pathEffect2: drawing.PathEffect = drawing.PathEffect.createCornerPathEffect(30)!;
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
     * @tc.name   testCreateComposePathEffectCombine002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_3200
     * @tc.desc   createComposePathEffect with DiscretePathEffect combination test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateComposePathEffectCombine002Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateComposePathEffectCombine002Static';
      let pathEffect1: drawing.PathEffect = drawing.PathEffect.createDiscretePathEffect(100, 50, 0)!;
      let pathEffect2: drawing.PathEffect = drawing.PathEffect.createCornerPathEffect(30)!;
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
     * @tc.name   testCreateSumPathEffectReturn001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_3300
     * @tc.desc   createSumPathEffect return value verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSumPathEffectReturn001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateSumPathEffectReturn001Static';
      let intervals: number[] = [10.0, 5.0];
      let pathEffectOne: drawing.PathEffect = drawing.PathEffect.createDashPathEffect(intervals, 5)!;
      let pathEffectTwo: drawing.PathEffect = drawing.PathEffect.createDashPathEffect(intervals, 10)!;
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
     * @tc.name   testCreateSumPathEffectCombine001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_3400
     * @tc.desc   createSumPathEffect with different PathEffect types combination test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSumPathEffectCombine001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateSumPathEffectCombine001Static';
      let pathEffectOne: drawing.PathEffect = drawing.PathEffect.createDashPathEffect([10.0, 5.0], 5)!;
      let pathEffectTwo: drawing.PathEffect = drawing.PathEffect.createCornerPathEffect(30)!;
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
     * @tc.name   testCreateSumPathEffectCombine002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHEFFECT_STATIC_3500
     * @tc.desc   createSumPathEffect with DiscretePathEffect combination test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSumPathEffectCombine002Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateSumPathEffectCombine002Static';
      let pathEffectOne: drawing.PathEffect = drawing.PathEffect.createDiscretePathEffect(100, 50, 0)!;
      let pathEffectTwo: drawing.PathEffect = drawing.PathEffect.createCornerPathEffect(30)!;
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
