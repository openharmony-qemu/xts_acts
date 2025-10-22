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
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function latticeTest() {
  describe('DrawingTsLatticeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async() => {

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_STATIC_0100
     * @tc.name      : testLatticeCreateImageLatticeNormalStatic
     * @tc.desc      : Test for testLatticeCreateImageLatticeNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLatticeCreateImageLatticeNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testLatticeCreateImageLatticeNormalStatic';

      try {
        drawing.Lattice.createImageLattice([ 80, 150 ], [ 80, 150 ], 2, 2, null, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 310, 320, 340, 360, 400 ], [ 10, 20, 40, 60, 100 ], 5, 5, null, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 300 ], [ 200, 300 ], 0, 2, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null)3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 300 ], [ 200, 300 ], 2, 0, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null)4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 0 ], [ 0 ], 0, 0, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null)5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 200, top : 200, right : 200, bottom : 200
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 1000, top : 1000, right : 1000, bottom : 1000
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 2000, top : 2000, right : 2000, bottom : 2000
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        const color: common2D.Color = {
          alpha : 0,
          red : 0,
          green : 0,
          blue : 128,
        }
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 200, top : 400, right : 200, bottom : 400
        }, [ drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR ],
          [ color, color, color, color, color, color, color, color, color ]);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null,
          [ drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT,
            drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT,
            drawing.RectType.DEFAULT ], null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice10 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, [
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT,
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT,
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT ], null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice11 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, undefined, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice12 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
       let lattice =  drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2);
        expect(lattice != null || lattice != undefined).assertTrue();
        console.info(msg + ' createImageLattgitice 13 successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice 13 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_STATIC_0101
     * @tc.name      : testLatticeCreateImageLatticeAbnormalStatic
     * @tc.desc      : Test for testLatticeCreateImageLatticeAbnormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLatticeCreateImageLatticeAbnormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testLatticeCreateImageLatticeAbnormalStatic';

      try {
        drawing.Lattice.createImageLattice([ 100, 200 ], [ 100, 200 ], 2, 2, null, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 10, 50, 90, 110, 150, 180 ], [ 10, 50, 90, 110, 150, 180 ], 6, 6, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 0, 100, 200 ], [ 0, 100, 200 ], 2, 3, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 10, 80, 150 ], [ 10, 80, 150 ], 3, 4, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 2000, top : 2000, right : 2000, bottom : 2000
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 400.2, top : 400.4, right : 400.2, bottom : 400.4
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 200.5, top : 400.5, right : 200.5, bottom : 400.5
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        const color: common2D.Color = {
          alpha : 255,
          red : 255,
          green : 255,
          blue : 255,
        }
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, [ drawing.RectType.FIXEDCOLOR ], null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_STATIC_0103
     * @tc.name      : testLatticeCreateImageLatticeCallsStatic
     * @tc.desc      : Test for testLatticeCreateImageLatticeCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLatticeCreateImageLatticeCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testLatticeCreateImageLatticeCallsStatic';

      for ( let i = 0 ; i < 1000 ; i ++ ) {
        try {
          drawing.Lattice.createImageLattice([ 1, 50, 200 ], [ 1, 50, 200 ], 3, 3, null, null, null);
          console.info(msg + ' createImageLattice succeeded');
        } catch( e: BusinessError ) {
          console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect(e.code).assertEqual(401);
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_STATIC_0200
     * @tc.name      : testLatticecreateImageLatticeWithArrayIntNormalStatic
     * @tc.desc      : Test for testLatticecreateImageLatticeWithArrayIntNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testLatticecreateImageLatticeWithArrayIntNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticecreateImageLatticeWithArrayIntNormalStatic';
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt([ 80, 150 ], [ 80, 150 ], 2, 2, null, null, null);
        console.info(msg + ' createImageLatticeWithArrayInt 1 successed lattice: ' + lattice );
        expect(lattice != null || lattice != undefined).assertTrue();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt([ 310, 320, 340, 360, 400 ], [ 10, 20, 40, 60, 100 ], 5, 5, null, null, null);
        console.info(msg + ' createImageLatticeWithArrayInt 2 successed lattice: ' + lattice);
        expect(lattice != null || lattice != undefined).assertTrue();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 200, top : 200, right : 200, bottom : 200
        }, null, null);
        console.info(msg + ' createImageLatticeWithArrayInt 6 successed lattice: ' + lattice);
        expect(lattice != null || lattice != undefined).assertTrue();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 1000, top : 1000, right : 1000, bottom : 1000
        }, null, null);
        console.info(msg + ' createImageLatticeWithArrayInt 7 successed lattice: ' + lattice);
        expect(lattice != null || lattice != undefined).assertTrue();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 2000, top : 2000, right : 2000, bottom : 2000
        }, null, null);
        console.info(msg + ' createImageLatticeWithArrayInt 8 successed lattice: ' + lattice);
        expect(lattice != null || lattice != undefined).assertTrue();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let xDivs : Array<int> = [1, 2, 4];
        let yDivs : Array<int> = [1, 2, 4];
        let colorArray :Array<int>=[0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444];
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs, yDivs, 3, 3,null,null,colorArray);
        console.info(msg + ' createImageLatticeWithArrayInt 91 successed lattice: ' + lattice);
        expect(lattice != null || lattice != undefined).assertTrue();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 91 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt([ 200, 400 ], [ 200, 400 ], 2, 2, null,
          [ drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT,
            drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT,
            drawing.RectType.DEFAULT ], null);
        console.info(msg + ' createImageLatticeWithArrayInt 10 successed lattice: ' + lattice);
        expect(lattice != null || lattice != undefined).assertTrue();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 10 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt([ 200, 400 ], [ 200, 400 ], 2, 2, null, [
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT,
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT,
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT ], null);
        console.info(msg + ' createImageLatticeWithArrayInt  11 successed lattice: ' + lattice);
        expect(lattice != null || lattice != undefined).assertTrue();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 11 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt([ 200, 400 ], [ 200, 400 ], 2, 2, null, undefined, null);
        console.info(msg + ' createImageLatticeWithArrayInt 12 successed lattice: ' + lattice);
        expect(lattice != null || lattice != undefined).assertTrue();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 12 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let lattice =  drawing.Lattice.createImageLatticeWithArrayInt([ 200, 400 ], [ 200, 400 ], 2, 2);
        expect(lattice != null || lattice != undefined).assertTrue();
        console.info(msg + ' createImageLatticeWithArrayInt 13 successed lattice: ' + lattice);
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 13 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_STATIC_0201
     * @tc.name      : testLatticecreateImageLatticeWithArrayIntAbnormalStatic
     * @tc.desc      : Test for testLatticecreateImageLatticeWithArrayIntAbnormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLatticecreateImageLatticeWithArrayIntAbnormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testLatticecreateImageLatticeWithArrayIntAbnormalStatic';

      try {
        drawing.Lattice.createImageLatticeWithArrayInt([ 10, 50, 90, 110, 150, 180 ], [ 10, 50, 90, 110, 150, 180 ], 6, 6, null, null, null);
        console.info(msg + ' createImageLatticeWithArrayInt 1 succeeded');
        expect().assertFail();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLatticeWithArrayInt([ 0, 100, 200 ], [ 0, 100, 200 ], 2, 3, null, null, null);
        console.info(msg + ' createImageLatticeWithArrayInt 2 succeeded');
        expect().assertFail();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLatticeWithArrayInt([ 10, 80, 150 ], [ 10, 80, 150 ], 3, 4, null, null, null);
        console.info(msg + ' createImageLatticeWithArrayInt 3  succeeded');
        expect().assertFail();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLatticeWithArrayInt([ 200, 400 ], [ 200, 400 ], 2, 2, null, [ drawing.RectType.FIXEDCOLOR ], null);
        console.info(msg + ' createImageLatticeWithArrayInt 4 succeeded');
        expect().assertFail();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice 4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLatticeWithArrayInt([ 200, 300 ], [ 200, 300 ], 0, 2, null, null, null);
        console.info(msg + ' createImageLatticeWithArrayInt 5 succeeded');
        expect().assertFail();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLatticeWithArrayInt([ 0 ], [ 0 ], 0, 0, null, null, null);
        console.info(msg + ' createImageLatticeWithArrayInt 6 succeeded');
        expect().assertFail();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let xDivs : Array<int> = [1, 2, 4];
        let yDivs : Array<int> = [1, 2, 4];
        let colorArray :Array<int>=[0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444];
        drawing.Lattice.createImageLatticeWithArrayInt([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 200, top : 400, right : 200, bottom : 400
        }, [ drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR ], colorArray);
        console.info(msg + ' createImageLatticeWithArrayInt 7 successed');
        expect().assertFail();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_STATIC_0203
     * @tc.name      : testLatticeCreateImageLatticeWithArrayIntCallsStatic
     * @tc.desc      : Test for testLatticeCreateImageLatticeWithArrayIntCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLatticeCreateImageLatticeWithArrayIntCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testLatticeCreateImageLatticeWithArrayIntCallsStatic';
      for ( let i = 0 ; i < 1000 ; i ++ ) {
        try {
          let xDivs : Array<int> = [1, 2, 4];
          let yDivs : Array<int> = [1, 2, 4];
          let colorArray :Array<int>=[0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444];
          let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs, yDivs, 3, 3,null,null,colorArray);
          console.info(msg + ' createImageLatticeWithArrayInt succeeded lattice: ' + lattice + 'step: ' + i);
          expect(lattice != null || lattice != undefined).assertTrue();
        } catch( e: BusinessError ) {
          console.info(msg + ` createImageLatticeWithArrayInt errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
  });
}