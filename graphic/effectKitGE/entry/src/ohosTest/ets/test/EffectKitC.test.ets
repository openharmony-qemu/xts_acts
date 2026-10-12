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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium-dynamic"
import image from '@ohos.multimedia.image';
import effectKit from '@ohos.effectKit';
import { testPng, testJpg } from '../model/testImg';
import { BusinessError } from '@ohos.base';

export default function effectKitCTest() {
  describe('effectKitCTest', () => {
    console.log('describe effectKitCTest start!!!');
    
    /**
     * @tc.name   testEffectKitC_0100
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0100
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info('www data testEffectKitC_0100 begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        let headFilter = effectKit.createEffect(pixelMap);

        let filter1 = headFilter.blur(null);
        console.info('www data filter 111 ', JSON.stringify(filter1));
        expect(filter1 != undefined).assertTrue();

        let filter2 = headFilter.blur(undefined);
        console.info('www data filter 222 ', JSON.stringify(filter2));
        expect(filter2 != undefined).assertTrue();
        console.info('www data testEffectKitC_0100 end');
        done();
      }).catch((err: BusinessError) => {
        console.info('www data failed to pixelMap', JSON.stringify(err));
        expect(true).assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_0200
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0200
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info('www data testEffectKitC_0200 begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        let headFilter = effectKit.createEffect(pixelMap);

        let filter1 = headFilter.blur(30, effectKit.TileMode.CLAMP);
        console.info('www data filter 111 ', JSON.stringify(filter1));
        expect(filter1 != undefined).assertTrue();

        let filter2 = headFilter.blur(30, effectKit.TileMode.REPEAT);
        console.info('www data filter 222 ', JSON.stringify(filter2));
        expect(filter2 != undefined).assertTrue();

        let filter3 = headFilter.blur(30, effectKit.TileMode.MIRROR);
        console.info('www data filter 333 ', JSON.stringify(filter3));
        expect(filter3 != undefined).assertTrue();

        let filter4 = headFilter.blur(30, effectKit.TileMode.DECAL);
        console.info('www data filter 444 ', JSON.stringify(filter4));
        expect(filter4 != undefined).assertTrue();

        let filter5 = headFilter.blur(null, effectKit.TileMode.DECAL);
        console.info('www data filter 555 ', JSON.stringify(filter5));
        expect(filter5 != undefined).assertTrue();

        let filter6 = headFilter.blur(undefined, effectKit.TileMode.DECAL);
        console.info('www data filter 666 ', JSON.stringify(filter6));
        expect(filter6 != undefined).assertTrue();
        console.info('www data testEffectKitC_0200 end');
        done();
      }).catch((err: BusinessError) => {
        console.info('www data failed to pixelMap', JSON.stringify(err));
        expect(true).assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_0300
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0300
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info('www data testEffectKitC_0300 begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        let headFilter = effectKit.createEffect(pixelMap);

        let brightness1 = headFilter.brightness(null);
        console.info('www data brightness 111 ', JSON.stringify(brightness1));
        expect(brightness1 != undefined).assertTrue();

        let brightness2 = headFilter.brightness(undefined);
        console.info('www data brightness 222 ', JSON.stringify(brightness2));
        expect(brightness2 != undefined).assertTrue();

        let brightness3 = headFilter.brightness(-1);
        console.info('www data brightness 333 ', JSON.stringify(brightness3));
        expect(brightness3 != undefined).assertTrue();

        let brightness4 = headFilter.brightness(0);
        console.info('www data brightness 444 ', JSON.stringify(brightness4));
        expect(brightness4 != undefined).assertTrue();

        let brightness5 = headFilter.brightness(0.5);
        console.info('www data brightness 555 ', JSON.stringify(brightness5));
        expect(brightness5 != undefined).assertTrue();

        let brightness6 = headFilter.brightness(1);
        console.info('www data brightness 666 ', JSON.stringify(brightness6));
        expect(brightness6 != undefined).assertTrue();

        let brightness7 = headFilter.brightness(2);
        console.info('www data brightness 777 ', JSON.stringify(brightness7));
        expect(brightness7 != undefined).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.info('www data failed to pixelMap', JSON.stringify(err));
        expect(true).assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_0400
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0400
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        let colorMatrix:Array<number> = [
          0.2126,0.7152,0.0722,0,0,
          0.2126,0.7152,0.0722,0,0,
          0.2126,0.7152,0.0722,0,0,
          0,0,0,1,0
        ];
        let headFilter = effectKit.createEffect(pixelMap);

        let setColorMatrix1 = headFilter.setColorMatrix(null);
        console.info('www data setColorMatrix 111 ', JSON.stringify(setColorMatrix1));
        expect(setColorMatrix1 == undefined).assertTrue();

        let setColorMatrix2 = headFilter.setColorMatrix(undefined);
        console.info('www data setColorMatrix 222 ', JSON.stringify(setColorMatrix2));
        expect(setColorMatrix2 == undefined).assertTrue();

        let setColorMatrix3 = headFilter.setColorMatrix(colorMatrix);
        console.info('www data setColorMatrix 333 ', JSON.stringify(setColorMatrix3));
        expect(setColorMatrix3 != undefined).assertTrue();

        let setColorMatrix4 = headFilter.setColorMatrix([]);
        console.info('www data setColorMatrix 444 ', JSON.stringify(setColorMatrix4));
        expect(setColorMatrix4 == undefined).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.info('www data failed to pixelMap', JSON.stringify(err));
        expect(true).assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_0700
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0700
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        let headFilter1 = effectKit.createEffect(null);
        console.info('www data createEffect 111 ', JSON.stringify(headFilter1));
        expect(headFilter1 == undefined).assertTrue();
        
        let headFilter2 = effectKit.createEffect(undefined);
        console.info('www data createEffect 222 ', JSON.stringify(headFilter2));
        expect(headFilter2 == undefined).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.info('www data testEffectKitC_0700 failed to pixelMap', JSON.stringify(err));
        expect(true).assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   getPixelMapEnum001
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETPIXELMAP_JSAPI_0004
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMapEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'www data getPixelMap4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        console.info('www data getPixelMapEnum001 pixelMap isEditable ', pixelMap.isEditable);
        console.info('www data getPixelMapEnum001 pixelMap isEditable ', pixelMap.isStrideAlignment);
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertFalse();
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "createEffect failed");
          expect(true).assertFail();
          done();
        }
        let resultPixel = headFilter.blur(10).getPixelMap();
        expect(resultPixel != null).assertTrue();

        // 验证 isEditable 属性
        let isEditable = resultPixel.isEditable;
        console.info(msgStr + "isEditable = " + isEditable);
        expect(typeof isEditable === 'boolean').assertTrue();
        expect(isEditable).assertTrue();

        // 验证 isStrideAlignment 属性
        let isStrideAlignment = resultPixel.isStrideAlignment;
        console.info(msgStr + "isStrideAlignment = " + isStrideAlignment);
        expect(typeof isStrideAlignment === 'boolean').assertTrue();
        expect(isStrideAlignment).assertFalse();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getPixelMapEnum002
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETPIXELMAP_JSAPI_0005
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMapEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const color = new ArrayBuffer(96);
        let opts : image.InitializationOptions = {
          editable: false,
          pixelFormat: 3,
          size: {
            height: 4,
            width: 6
          }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info('www data pixelMap getPixelMapEnum002 isEditable 111 ', pixelMap.isEditable)
          console.info('www data pixelMap getPixelMapEnum002 isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let pixel = effectKit.createEffect(pixelMap).getPixelMap();
          console.info('getPixelBytesNumber = ', pixel.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixel.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixel.isStrideAlignment)
          expect(pixel.isEditable).assertTrue();
          expect(pixel.isStrideAlignment).assertFalse();
          done();
        })
      })

    /**
     * @tc.name   getPixelMapEnum003
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETPIXELMAP_JSAPI_0006
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMapEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info('www data alloc pixelMap isEditable ', pixelMap.isEditable)  // false
        console.info('www data alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        let pixel2 = effectKit.createEffect(pixelMap).getPixelMap();
        console.info('getPixelBytesNumber = ', pixel2.getPixelBytesNumber());
        console.info('www data pixelMap isEditable ', pixel2.isEditable)
        console.info('www data pixelMap isStrideAlignment ', pixel2.isStrideAlignment)
        expect(pixel2.isEditable).assertTrue();
        expect(pixel2.isStrideAlignment).assertFalse();
        done();
      })

    /**
     * @tc.name   getEffectPixelMapEnum001
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_0001
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getEffectPixelMapEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info('www data alloc pixelMap isEditable ', pixelMap.isEditable)  // false
        console.info('www data alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createEffect(pixelMap).getEffectPixelMap().then((pixelMap)=>{
          console.info('www data getPixelBytesNumber = ', pixelMap.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixelMap.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.info('www data error ', err);
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   getEffectPixelMapEnum002
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_0002
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getEffectPixelMapEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info('www data alloc pixelMap isEditable ', pixelMap.isEditable)  // false
        console.info('www data alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createEffect(pixelMap).getEffectPixelMap(true).then((pixelMap)=>{
          console.info('www data getPixelBytesNumber = ', pixelMap.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixelMap.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.info('www data error ', err);
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   getEffectPixelMapEnum003
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_0003
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getEffectPixelMapEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info('www data alloc pixelMap isEditable ', pixelMap.isEditable)  // false
        console.info('www data alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createEffect(pixelMap).getEffectPixelMap(false).then((pixelMap)=>{
          console.info('www data getPixelBytesNumber = ', pixelMap.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixelMap.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.info('www data error ', err);
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   getEffectPixelMapEnum004
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_0004
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getEffectPixelMapEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {

        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info('www data alloc pixelMap isEditable ', pixelMap.isEditable)  // true
        console.info('www data alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createEffect(pixelMap).getEffectPixelMap(true).then((pixelMap)=>{
          console.info('getPixelBytesNumber = ', pixelMap.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixelMap.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.info('www data error ', err);
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   getEffectPixelMapEnum005
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_0005
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getEffectPixelMapEnum005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          console.info('www data pixelMap getPixelMapEnum002 isEditable 111 ', pixelMap.isEditable)
          console.info('www data pixelMap getPixelMapEnum002 isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let pixel = effectKit.createEffect(pixelMap).getPixelMap();
          console.info('www data getPixelBytesNumber = ', pixel.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixel.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixel.isStrideAlignment)
          expect(pixel.isEditable).assertTrue();
          expect(pixel.isStrideAlignment).assertFalse();
          done();
        })
      })

  })
}