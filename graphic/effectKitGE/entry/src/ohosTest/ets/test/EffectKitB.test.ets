/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import image from '@ohos.multimedia.image';
import effectKit from '@ohos.effectKit';
import { testPng, testJpg } from '../model/testImg';
import { BusinessError } from '@ohos.base';

export default function effectKitBTest() {
  describe('effectKitBTest', () => {
    console.log('describe effectKitBTest start!!!');

    /**
     * @tc.name   testInvert
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_effectKitTest_Method_0200
     * @tc.desc   Read the first color value of the image. The number is specified by colorCount. The result is written into the Color array and returned in synchronization mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInvert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'www data testInvert'
      console.log(msgStr + ' begin');
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.info(msgStr + ' Succeed in createPixelMap. ');
        try{
          let headFilter = effectKit.createEffect(pixelMap);
          console.info(msgStr + ' Succeed in createEffect. ');
          if (headFilter != null) {
            try{
              headFilter.invert();
              console.info(msgStr + ' Succeed in invert. ');
              done()
            }catch(err){
              console.info(msgStr + ' Failed in invert. ' + JSON.stringify(err));
              expect(true).assertFail();
              done()
            }
          }else{
            console.log(msgStr + ' headFilter = null. ')
            expect(true).assertFail();
            done()
          }
        }catch(err){
          console.info(msgStr + ' Failed in createEffect. ' + JSON.stringify(err));
          expect(true).assertFail();
          done()
        }
      }).catch((err:BusinessError) => {
        console.info(msgStr + ' Failed in createPixelMap. ' + JSON.stringify(err));
        expect(true).assertFail();
        done()
      })
    })

    /**
     * @tc.name   testSetColorMatrix
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_effectKitTest_Method_0300
     * @tc.desc   Read the first color value of the image. The number is specified by colorCount. The result is written into the Color array and returned in synchronization mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetColorMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'www data testSetColorMatrix'
      console.log(msgStr + ' begin');
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.info(msgStr + ' Succeed in createPixelMap. ');
        try{
          let colorMatrix:Array<number> = [
            0.2126,0.7152,0.0722,0,0,
            0.2126,0.7152,0.0722,0,0,
            0.2126,0.7152,0.0722,0,0,
            0,0,0,1,0
          ];
          let headFilter = effectKit.createEffect(pixelMap);
          console.info(msgStr + ' Succeed in createEffect. ');
          if (headFilter != null) {
            try{
              headFilter.setColorMatrix(colorMatrix);
              console.info(msgStr + ' Succeed in setColorMatrix. ');
              done()
            }catch(err){
              console.info(msgStr + ' Failed in setColorMatrix. ' + JSON.stringify(err));
              expect(true).assertFail();
              done()
            }
          }else{
            console.log(msgStr + ' headFilter = null. ')
            expect(true).assertFail();
            done()
          }
        }catch(err){
          console.info(msgStr + ' Failed in createEffect. ' + JSON.stringify(err));
          expect(true).assertFail();
          done()
        }
      }).catch((err:BusinessError) => {
        console.info(msgStr + ' Failed in createPixelMap. ' + JSON.stringify(err));
        expect(true).assertFail();
        done()
      })
    })

    /**
     * @tc.name   testTileMode
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_effectKitTest_Method_0400
     * @tc.desc   Enumeration of the shader effect tile mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTileMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msg = 'www data testTileMode'
      console.log(msg + ' begin')
      expect(effectKit.TileMode.CLAMP).assertEqual(0)
      expect(effectKit.TileMode.REPEAT).assertEqual(1)
      expect(effectKit.TileMode.MIRROR).assertEqual(2)
      expect(effectKit.TileMode.DECAL).assertEqual(3)
      done()
    })
    
    /**
     * @tc.name   testBlurTileMode
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_effectKitTest_Method_0500
     * @tc.desc   Adds the blur effect to the effect list. The result is returned to the first node of the effect list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlurTileMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'www data testBlurTileMode'
      console.log(msgStr + ' begin');
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.info(msgStr + ' Succeed in createPixelMap. ');
        let radius = 30;
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter != null) {
          headFilter.blur(radius, effectKit.TileMode.DECAL);
          console.info(msgStr + ' Succeed in headFilter.blur. ');
          done()
        }
      }).catch((err:BusinessError) => {
        console.info(msgStr + ' Failed in createPixelMap. ' + JSON.stringify(err));
        expect(true).assertFail();
        done()
      })
    })
    
    /**
     * @tc.name   testGetEffectPixelMap_useCpuRender1
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_effectKitTest_Method_0600
     * @tc.desc   test getEffectPixelMap useCpuRender
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetEffectPixelMap_useCpuRender1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        effectKit.createEffect(pixelMap).grayscale().getEffectPixelMap(false).then(data => {
          console.info('www data  getPixelBytesNumber = ', data.getPixelBytesNumber());
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        })
      })
    })
    
    /**
     * @tc.name   testGetEffectPixelMap_useCpuRender2
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_effectKitTest_Method_0700
     * @tc.desc   test getEffectPixelMap useCpuRender
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetEffectPixelMap_useCpuRender2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        effectKit.createEffect(pixelMap).grayscale().getEffectPixelMap(true).then(data => {
          console.info('www data getPixelBytesNumber = ', data.getPixelBytesNumber());
          done();
        }).catch((err: BusinessError) => {
          expect(true).assertFail();
          done();
        })
      })
    })
    
    
    
    /**
     * @tc.name   effectKitBTestCreateEffectEnum001
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_effectKitTest_Method_1200
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTestCreateEffectEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTestCreateEffectEnum001 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let pixel = effectKit.createEffect(pixelMap);
          expect(pixel !== undefined).assertTrue();
          console.log("effectKitTest" + msgStr + 'end');
          done();
        })
      })

    /**
     * @tc.name   effectKitBTestCreateEffectEnum002
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_effectKitTest_Method_1300
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTestCreateEffectEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTestCreateEffectEnum002 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let pixel = effectKit.createEffect(pixelMap);
          expect(pixel !== undefined).assertTrue();
          console.log("effectKitTest" + msgStr + 'end');
          done();
        })
      })

    /**
     * @tc.name   effectKitBTestCreateEffectEnum003
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_effectKitTest_Method_1400
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTestCreateEffectEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTestCreateEffectEnum003 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'alloc pixelMap isEditable ', pixelMap.isEditable)  // false
        console.info(msgStr + 'alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        let pixel = effectKit.createEffect(pixelMap);
        expect(pixel !== undefined).assertTrue();
        console.log("effectKitTest" + msgStr + 'end');
        done();
      })

    /**
     * @tc.name   effectKitBTestCreateEffectEnum004
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_effectKitTest_Method_1500
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTestCreateEffectEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTestCreateEffectEnum004 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'alloc pixelMap isEditable ', pixelMap.isEditable)  // true
        console.info(msgStr + 'alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertTrue();
        let pixel = effectKit.createEffect(pixelMap);
        expect(pixel !== undefined).assertTrue();
        console.log("effectKitTest" + msgStr + 'end');
        done();
      })

  })
}