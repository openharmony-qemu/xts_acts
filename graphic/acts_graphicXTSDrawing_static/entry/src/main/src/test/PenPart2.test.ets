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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { getRandomNumber } from './Util.test';
import { BusinessError } from '@ohos.base';

export default function penPart2Test() {
  describe('DrawingTsPenPart2Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1400
     * @tc.name      : testPenSetImageFilterNormalStatic
     * @tc.desc      : Test for testPenSetImageFilterNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetImageFilterNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetImageFilterNormalStatic';
      const pen = new drawing.Pen();
      let colorfilter = drawing.ColorFilter.createSRGBGammaToLinear();
      if (colorfilter) {
        let imgFilter = drawing.ImageFilter.createFromColorFilter(colorfilter);
        if (imgFilter) {
          try {
            pen.setImageFilter(imgFilter);
            console.info(msg + ' setImageFilter successed');
          } catch (e: BusinessError) {
            console.info(msg + ` setImageFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
            expect().assertFail();
          }
        }
      }
      try {
        pen.setImageFilter(null);
        console.info(msg + ' setImageFilter(null) succeeded');
      } catch (e: BusinessError) {
        console.info(msg + ` setImageFilter(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1403
     * @tc.name      : testPenSetImageFilterMultipleCallsStatic
     * @tc.desc      : Test for testPenSetImageFilterMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetImageFilterMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetImageFilterMultipleCallsStatic';
      const pen = new drawing.Pen();
      let colorfilter = drawing.ColorFilter.createSRGBGammaToLinear();
      if (colorfilter) {
        let imgFilter = drawing.ImageFilter.createFromColorFilter(colorfilter);
        if (imgFilter) {
          for (let i = 0; i < 20; i++) {
            try {
              pen.setImageFilter(imgFilter);
              console.info(msg + ' setImageFilter succeeded');
            } catch (e: BusinessError) {
              console.info(msg + ` setImageFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
              expect().assertFail();
            }
          }
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1500
     * @tc.name      : testPenGetColorFilterNormalStatic
     * @tc.desc      : Test for testPenGetColorFilterNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenGetColorFilterNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenGetColorFilterNormalStatic';
      const pen = new drawing.Pen();
      try {
        let cf = drawing.ColorFilter.createLumaColorFilter();
        let cf2 = pen.getColorFilter();
        console.info(msg + ' getColorFilter successed,colorFilter:' + cf2);
      } catch (e: BusinessError) {
        console.info(msg + ` getColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1502
     * @tc.name      : testPenGetColorFilterMultipleCallsStatic
     * @tc.desc      : Test for testPenGetColorFilterMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenGetColorFilterMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenGetColorFilterMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          let cf2 = pen.getColorFilter();
          console.info(msg + ' getColorFilter succeeded,colorFilter:' + cf2);
        } catch (e: BusinessError) {
          console.info(msg + ` getColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1600
     * @tc.name      : testPenGetFillPathNormalStatic
     * @tc.desc      : Test for testPenGetFillPathNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenGetFillPathNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenGetFillPathNormalStatic';
      const pen = new drawing.Pen();
      let pathSrc: drawing.Path = new drawing.Path();
      let pathDst: drawing.Path = new drawing.Path();

      try {
        let fillPath = pen.getFillPath(pathSrc, pathDst);
        expect(fillPath == false).assertTrue();
        console.info(msg + ' getFillPath successed,fillPath:' + fillPath);
      } catch (e: BusinessError) {
        console.info(msg + ` getFillPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pathSrc.moveTo(0, 0);
        pathSrc.lineTo(100, 100);
        let fillPath = pen.getFillPath(pathSrc, pathDst);
        expect(fillPath == false).assertTrue();
        console.info(msg + ' getFillPath successed,fillPath:' + fillPath);
      } catch (e: BusinessError) {
        console.info(msg + ` getFillPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        pen.setStrokeWidth(5);
        let fillPath = pen.getFillPath(pathSrc, pathDst);
        expect(fillPath == true).assertTrue();
        console.info(msg + ' getFillPath successed, 3 fillPath:' + fillPath);
      } catch (e: BusinessError) {
        console.info(msg + ` getFillPath errorCode 3 is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1603
     * @tc.name      : testPenGetFillPathMultipleCallsStatic
     * @tc.desc      : Test for testPenGetFillPathMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenGetFillPathMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenGetFillPathMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        let pathSrc: drawing.Path = new drawing.Path();
        let pathDst: drawing.Path = new drawing.Path();
        try {
          let fillPath = pen.getFillPath(pathSrc, pathDst);
          expect(fillPath == false).assertTrue();
          console.info(msg + ' getFillPath successed,fillPath:' + fillPath);
        } catch (e: BusinessError) {
          console.info(msg + ` getFillPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1700
     * @tc.name      : testPenConstructorNormalStatic
     * @tc.desc      : Test for testPenConstructorNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenConstructorNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenConstructorNormalStatic';
      const pen = new drawing.Pen();

      try {
        const pen = new drawing.Pen();
        console.info(msg + ' drawing.Pen() successed');
      } catch (e: BusinessError) {
        console.info(msg + ` drawing.Pen() errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        const newpen = new drawing.Pen(pen);
        console.info(msg + ' drawing.Pen(pen) successed');
      } catch (e: BusinessError) {
        console.info(msg + ` drawing.Pen(pen) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let penColor: common2D.Color = ({
          alpha: 0,
          red: 0,
          green: 0,
          blue: 0
        });
        pen.setColor(penColor);
        let newpen = new drawing.Pen(pen);
        console.info(msg + ' drawing.Pen(pen) successed');
      } catch (e: BusinessError) {
        console.info(msg + ` drawing.Pen(pen) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1703
     * @tc.name      : testPenConstructorMultipleCallsStatic
     * @tc.desc      : Test for testPenConstructorMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenConstructorMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenConstructorMultipleCallsStatic';

      for (let i = 0; i < 20; i++) {
        try {
          const pen = new drawing.Pen();
          const newpen = new drawing.Pen(pen);
          console.info(msg + ' drawing.Pen(pen) succeeded');
        } catch (e: BusinessError) {
          console.info(msg + ` drawing.Pen(pen) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1800
     * @tc.name      : testPenGetAlphaNormalStatic
     * @tc.desc      : Test for testPenGetAlphaNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenGetAlphaNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenGetAlphaNormalStatic';
      const pen = new drawing.Pen();
      try {
        let alpha = pen.getAlpha();
        expect(alpha == 255).assertTrue();
        console.info(msg + ' pen.getAlpha() successed,alpha:' + alpha);
      } catch (e: BusinessError) {
        console.info(msg + ` pen.getAlpha() errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setAlpha(128);
        let alpha = pen.getAlpha();
        expect(alpha == 128).assertTrue();
        console.info(msg + ' pen.getAlpha() successed,alpha:' + alpha);
      } catch (e: BusinessError) {
        console.info(msg + ` pen.getAlpha() errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setAlpha(255);
        let alpha = pen.getAlpha();
        expect(alpha == 255).assertTrue();
        console.info(msg + ' pen.getAlpha() successed,alpha:' + alpha);
      } catch (e: BusinessError) {
        console.info(msg + ` pen.getAlpha() errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1802
     * @tc.name      : testPenGetAlphaMultipleCallsStatic
     * @tc.desc      : Test for testPenGetAlphaMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenGetAlphaMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenGetAlphaMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          let alpha = pen.getAlpha();
          console.info(msg + ' pen.getAlpha() successed,alpha:' + alpha);
        } catch (e: BusinessError) {
          console.info(msg + ` pen.getAlpha() errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1900
     * @tc.name      : testPenIsAntiAliasNormalStatic
     * @tc.desc      : Test for testPenIsAntiAliasNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenIsAntiAliasNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenIsAntiAliasNormalStatic';
      const pen = new drawing.Pen();

      try {
        let isAntiAlias = pen.isAntiAlias();
        expect(isAntiAlias == false).assertTrue();
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch (e: BusinessError) {
        console.info(msg + ` isAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setAntiAlias(true);
        let isAntiAlias = pen.isAntiAlias();
        expect(isAntiAlias == true).assertTrue()
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch (e: BusinessError) {
        console.info(msg + ` isAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setAntiAlias(false);
        let isAntiAlias = pen.isAntiAlias();
        expect(isAntiAlias == false).assertTrue()
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch (e: BusinessError) {
        console.info(msg + ` isAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1902
     * @tc.name      : testPenIsAntiAliasMultipleCallsStatic
     * @tc.desc      : Test for testPenIsAntiAliasMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenIsAntiAliasMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenIsAntiAliasMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          let isAntiAlias = pen.isAntiAlias();
          expect(isAntiAlias == false).assertTrue();
          console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
        } catch (e: BusinessError) {
          console.info(msg + ` isAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2000
     * @tc.name      : testPenGetColorNormalStatic
     * @tc.desc      : Test for testPenGetColorNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenGetColorNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenGetColorNormalStatic';
      const pen = new drawing.Pen();
      try {
        let colorGet = pen.getColor();
        expect(colorGet != null).assertTrue();
        console.info(msg + ' getColor successed,colorGet:' + JSON.stringify(colorGet));
      } catch (e: BusinessError) {
        console.info(msg + ` getColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        const colors: common2D.Color = {
          alpha: 0,
          red: 0,
          green: 0,
          blue: 0
        }
        pen.setColor(colors);
        let colorGet = pen.getColor();
        expect(JSON.stringify(colorGet) == JSON.stringify(colors)).assertTrue();
        console.info(msg + ' getColor2 successed,colorGet:' + JSON.stringify(colorGet));
      } catch (e: BusinessError) {
        console.info(msg + ` getColor2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        const colors: common2D.Color = {
          alpha: 255,
          red: 255,
          green: 255,
          blue: 255
        }
        pen.setColor(colors);
        let colorGet = pen.getColor();
        expect(JSON.stringify(colorGet) == JSON.stringify(colors)).assertTrue();
        console.info(msg + ' getColor2 successed,colorGet:' + JSON.stringify(colorGet));
      } catch (e: BusinessError) {
        console.info(msg + ` getColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2002
     * @tc.name      : testPenGetColorMultipleCallsStatic
     * @tc.desc      : Test for testPenGetColorMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenGetColorMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenGetColorMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          let colorGet = pen.getColor();
          console.info(msg + ' getColor successed,colorGet:' + JSON.stringify(colorGet));
        } catch (e: BusinessError) {
          console.info(msg + ` getColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2100
     * @tc.name      : testPenGetWidthNormalStatic
     * @tc.desc      : Test for testPenGetWidthNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenGetWidthNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenGetWidthNormalStatic';
      const pen = new drawing.Pen();

      try {
        let width = pen.getWidth();
        expect(width == 0).assertTrue();
        console.info(msg + ' getWidth successed,width:' + width);
      } catch (e: BusinessError) {
        console.info(msg + ` getWidth errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(30);
        let width = pen.getWidth();
        expect(width == 30).assertTrue();
        console.info(msg + ' getWidth successed,width:' + width);
      } catch (e: BusinessError) {
        console.info(msg + ` getWidth errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(50.1);
        let width = pen.getWidth();
        expect(Math.floor(width) == 50).assertTrue();
        console.info(msg + ' getWidth successed,width:' + width);
      } catch (e: BusinessError) {
        console.info(msg + ` getWidth errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2102
     * @tc.name      : testPenGetWidthMultipleCallsStatic
     * @tc.desc      : Test for testPenGetWidthMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenGetWidthMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenGetWidthMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          let width = pen.getWidth();
          expect(width == 0).assertTrue();
          console.info(msg + ' getWidth successed,width:' + width);
        } catch (e: BusinessError) {
          console.info(msg + ` getWidth errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2200
     * @tc.name      : testPenSetGetMiterLimitNormalStatic
     * @tc.desc      : Test for testPenSetGetMiterLimitNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetGetMiterLimitNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetGetMiterLimitNormalStatic';
      const pen = new drawing.Pen();

      try {
        let miter = pen.getMiterLimit();
        expect(miter != null).assertTrue();
        console.info(msg + ' getMiterLimit1 successed,miter:' + miter);
      } catch (e: BusinessError) {
        console.info(msg + ` getMiterLimit1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setMiterLimit(5);
        let miter = pen.getMiterLimit();
        expect(miter == 5).assertTrue();
        console.info(msg + ' getMiterLimit2 successed,miter:' + miter);
      } catch (e: BusinessError) {
        console.info(msg + ` getMiterLimit2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setMiterLimit(20.1);
        let miter = pen.getMiterLimit();
        expect(Math.floor(miter) == 20).assertTrue();
        console.info(msg + ' getMiterLimit3 successed,miter:' + miter);
      } catch (e: BusinessError) {
        console.info(msg + ` getMiterLimit3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setMiterLimit(0);
        let miter = pen.getMiterLimit();
        expect(miter == 0).assertTrue();
        console.info(msg + ' getMiterLimit4 successed,miter:' + miter);
      } catch (e: BusinessError) {
        console.info(msg + ` getMiterLimit4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setMiterLimit(-1);
        let miter = pen.getMiterLimit();
        expect(miter == -1).assertTrue();
        console.info(msg + ' getMiterLimit5 successed,miter:' + miter);
      } catch (e: BusinessError) {
        console.info(msg + ` getMiterLimit5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2203
     * @tc.name      : testPenSetGetMiterLimitMultipleCallsStatic
     * @tc.desc      : Test for testPenSetGetMiterLimitMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetGetMiterLimitMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetGetMiterLimitMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          pen.setMiterLimit(getRandomNumber(1, 100));
          console.info(msg + ' setMiterLimit succeeded');
        } catch (e: BusinessError) {
          console.info(msg + ` setMiterLimit errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          pen.getMiterLimit();
          console.info(msg + ' getMiterLimit succeeded');
        } catch (e: BusinessError) {
          console.info(msg + ` getMiterLimit errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        let randomNumber = getRandomNumber(1, 100)
        try {
          pen.setMiterLimit(randomNumber);
          let miter = pen.getMiterLimit();
          expect(miter == randomNumber).assertTrue();
          console.info(msg + ' setAndGetMiterLimit succeeded');
        } catch (e: BusinessError) {
          console.info(msg + ` setAndGetMiterLimit errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2300
     * @tc.name      : testPenSetShaderEffectNormalStatic
     * @tc.desc      : Test for testPenSetShaderEffectNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetShaderEffectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetShaderEffectNormalStatic';
      const pen = new drawing.Pen();
      let shaderEffect =
        drawing.ShaderEffect.createLinearGradient({ x: 100, y: 100 }, { x: 300, y: 300 }, [0xFF00FF00, 0xFFFF0000],
          drawing.TileMode.REPEAT);
      if (shaderEffect) {
        try {
          pen.setShaderEffect(shaderEffect);
          console.info(msg + ' setShaderEffect successed');
        } catch (e: BusinessError) {
          console.info(msg + ` setShaderEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
      try {
        pen.setShaderEffect(null);
        console.info(msg + ' setShaderEffect successed');
      } catch (e: BusinessError) {
        console.info(msg + ` setShaderEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2303
     * @tc.name      : testPenSetShaderEffectMultipleCallsStatic
     * @tc.desc      : Test for testPenSetShaderEffectMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetShaderEffectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetShaderEffectMultipleCallsStatic';
      const pen = new drawing.Pen();
      let shaderEffect =
        drawing.ShaderEffect.createLinearGradient({ x: 100, y: 100 }, { x: 300, y: 300 }, [0xFF00FF00, 0xFFFF0000],
          drawing.TileMode.REPEAT);
      if (shaderEffect) {
        for (let i = 0; i < 20; i++) {
          try {
            pen.setShaderEffect(shaderEffect);
            console.info(msg + ' setShaderEffect succeeded');
          } catch (e: BusinessError) {
            console.info(msg + ` setShaderEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
            expect().assertFail();
          }
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2400
     * @tc.name      : testPenResetNormalStatic
     * @tc.desc      : Test for testPenResetNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenResetNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenResetNormalStatic';
      const pen = new drawing.Pen();

      try {
        pen.reset();
        console.info(msg + ' reset successed');
      } catch (e: BusinessError) {
        console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        const brush_color: common2D.Color = {
          alpha: 255, // Alpha 透明度，完全不透明
          red: 255, // 红色分量
          green: 0, // 绿色分量
          blue: 0     // 蓝色分量
        };
        pen.setColor(brush_color);
        pen.reset();
        console.info(msg + ' reset successed');
      } catch (e: BusinessError) {
        console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2402
     * @tc.name      : testPenResetMultipleCallsStatic
     * @tc.desc      : Test for testPenResetMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenResetMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenResetMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          pen.reset();
          console.info(msg + ' reset succeeded');
        } catch (e: BusinessError) {
          console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
  });
}