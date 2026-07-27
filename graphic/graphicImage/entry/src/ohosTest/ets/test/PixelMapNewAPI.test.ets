/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';

export default function pixelMapNewAPI() {
  describe('pixelMapNewAPI', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("imagePixelMapTest beforeEach start");
      done();
    });

    /**
     * @tc.name   pixelMapNewAPI_0100
     * @tc.number pixelMapNewAPI_0100
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   pixelMapNewAPI_0200
     * @tc.number pixelMapNewAPI_0200
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.DMA)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   pixelMapNewAPI_0300
     * @tc.number pixelMapNewAPI_0300
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.SHARE_MEMORY)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   pixelMapNewAPI_0400
     * @tc.number pixelMapNewAPI_0400
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.SHARE_MEMORY)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   pixelMapNewAPI_0500
     * @tc.number pixelMapNewAPI_0500
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   pixelMapNewAPI_0600
     * @tc.number pixelMapNewAPI_0600
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   pixelMapNewAPI_0700
     * @tc.number pixelMapNewAPI_0700
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.SHARE_MEMORY)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   pixelMapNewAPI_0800
     * @tc.number pixelMapNewAPI_0800
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.DMA)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   pixelMapNewAPI_0900
     * @tc.number pixelMapNewAPI_0900
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   pixelMapNewAPI_1000
     * @tc.number pixelMapNewAPI_1000
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      try {
        image.createPixelMapUsingAllocatorSync(null, image.AllocatorType.AUTO)
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   pixelMapNewAPI_1100
     * @tc.number pixelMapNewAPI_1100
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(null, opts, image.AllocatorType.AUTO)
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   pixelMapNewAPI_1200
     * @tc.number pixelMapNewAPI_1200
     * @tc.desc   image pixelMap newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pixelMapNewAPI_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocator(null, opts, image.AllocatorType.AUTO)
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromPixels_InvalidSrcPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixels_InvalidSrcPixelFormat_001
     * @tc.desc    Test createPixelMapFromPixels with invalid srcPixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixels_InvalidSrcPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: -1,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapFromPixels(pixels, options);
          console.info('www data createPixelMapFromPixels_InvalidSrcPixelFormat_001 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixels_InvalidSrcPixelFormat_001 error ' + err.code);
          expect(err.code).assertEqual(7600206);
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixels_InvalidSrcPixelFormat_002
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixels_InvalidSrcPixelFormat_002
     * @tc.desc    Test createPixelMapFromPixels with invalid srcPixelFormat (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixels_InvalidSrcPixelFormat_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: 9999,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapFromPixels(pixels, options);
          console.info('www data createPixelMapFromPixels_InvalidSrcPixelFormat_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixels_InvalidSrcPixelFormat_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixels_InvalidPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixels_InvalidPixelFormat_001
     * @tc.desc    Test createPixelMapFromPixels with invalid pixelFormat (99999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixels_InvalidPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: 99999,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapFromPixels(pixels, options);
          console.info('www data createPixelMapFromPixels_InvalidPixelFormat_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixels_InvalidPixelFormat_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixels_InvalidPixelFormat_002
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixels_InvalidPixelFormat_002
     * @tc.desc    Test createPixelMapFromPixels with invalid pixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixels_InvalidPixelFormat_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: -1,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapFromPixels(pixels, options);
          console.info('www data createPixelMapFromPixels_InvalidPixelFormat_002 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixels_InvalidPixelFormat_002 error ' + err.code);
          expect(err.code).assertEqual(7600206);
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixels_InvalidAlphaType_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixels_InvalidAlphaType_001
     * @tc.desc    Test createPixelMapFromPixels with invalid alphaType (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixels_InvalidAlphaType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: 9999,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapFromPixels(pixels, options);
          console.info('www data createPixelMapFromPixels_InvalidAlphaType_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixels_InvalidAlphaType_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixels_InvalidAlphaType_002
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixels_InvalidAlphaType_002
     * @tc.desc    Test createPixelMapFromPixels with invalid alphaType (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixels_InvalidAlphaType_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: -1,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapFromPixels(pixels, options);
          console.info('www data createPixelMapFromPixels_InvalidAlphaType_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixels_InvalidAlphaType_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixels_InvalidScaleMode_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixels_InvalidScaleMode_001
     * @tc.desc    Test createPixelMapFromPixels with invalid scaleMode (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixels_InvalidScaleMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: -1
          };
          await image.createPixelMapFromPixels(pixels, options);
          console.info('www data createPixelMapFromPixels_InvalidScaleMode_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixels_InvalidScaleMode_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixels_InvalidScaleMode_002
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixels_InvalidScaleMode_002
     * @tc.desc    Test createPixelMapFromPixels with invalid scaleMode (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixels_InvalidScaleMode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: 9999
          };
          await image.createPixelMapFromPixels(pixels, options);
          console.info('www data createPixelMapFromPixels_InvalidScaleMode_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixels_InvalidScaleMode_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixelsSync_InvalidSrcPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixelsSync_InvalidSrcPixelFormat_001
     * @tc.desc    Test createPixelMapFromPixelsSync with invalid srcPixelFormat (99999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixelsSync_InvalidSrcPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: 99999,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapFromPixelsSync(pixels, options);
          console.info('www data createPixelMapFromPixelsSync_InvalidSrcPixelFormat_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixelsSync_InvalidSrcPixelFormat_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixelsSync_InvalidSrcPixelFormat_002
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixelsSync_InvalidSrcPixelFormat_002
     * @tc.desc    Test createPixelMapFromPixelsSync with invalid srcPixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixelsSync_InvalidSrcPixelFormat_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: -1,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapFromPixelsSync(pixels, options);
          console.info('www data createPixelMapFromPixelsSync_InvalidSrcPixelFormat_002 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixelsSync_InvalidSrcPixelFormat_002 error ' + err.code);
          expect(err.code).assertEqual(7600206);
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixelsSync_InvalidPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixelsSync_InvalidPixelFormat_001
     * @tc.desc    Test createPixelMapFromPixelsSync with invalid pixelFormat (99999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixelsSync_InvalidPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: 99999,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapFromPixelsSync(pixels, options);
          console.info('www data createPixelMapFromPixelsSync_InvalidPixelFormat_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixelsSync_InvalidPixelFormat_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixelsSync_InvalidPixelFormat_002
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixelsSync_InvalidPixelFormat_002
     * @tc.desc    Test createPixelMapFromPixelsSync with invalid pixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixelsSync_InvalidPixelFormat_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: -1,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapFromPixelsSync(pixels, options);
          console.info('www data createPixelMapFromPixelsSync_InvalidPixelFormat_002 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixelsSync_InvalidPixelFormat_002 error ' + err.code);
          expect(err.code).assertEqual(7600206);
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixelsSync_InvalidAlphaType_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixelsSync_InvalidAlphaType_001
     * @tc.desc    Test createPixelMapFromPixelsSync with invalid alphaType (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixelsSync_InvalidAlphaType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: -1,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapFromPixelsSync(pixels, options);
          console.info('www data createPixelMapFromPixelsSync_InvalidAlphaType_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixelsSync_InvalidAlphaType_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixelsSync_InvalidAlphaType_002
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixelsSync_InvalidAlphaType_002
     * @tc.desc    Test createPixelMapFromPixelsSync with invalid alphaType (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixelsSync_InvalidAlphaType_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: 9999,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapFromPixelsSync(pixels, options);
          console.info('www data createPixelMapFromPixelsSync_InvalidAlphaType_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixelsSync_InvalidAlphaType_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixelsSync_InvalidScaleMode_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixelsSync_InvalidScaleMode_001
     * @tc.desc    Test createPixelMapFromPixelsSync with invalid scaleMode (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixelsSync_InvalidScaleMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: 9999
          };
          image.createPixelMapFromPixelsSync(pixels, options);
          console.info('www data createPixelMapFromPixelsSync_InvalidScaleMode_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixelsSync_InvalidScaleMode_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createPixelMapFromPixelsSync_InvalidScaleMode_002
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromPixelsSync_InvalidScaleMode_002
     * @tc.desc    Test createPixelMapFromPixelsSync with invalid scaleMode (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createPixelMapFromPixelsSync_InvalidScaleMode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: -1
          };
          image.createPixelMapFromPixelsSync(pixels, options);
          console.info('www data createPixelMapFromPixelsSync_InvalidScaleMode_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromPixelsSync_InvalidScaleMode_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createEmptyPixelMap_InvalidSrcPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createEmptyPixelMap_InvalidSrcPixelFormat_001
     * @tc.desc    Test createEmptyPixelMap with invalid srcPixelFormat (99999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createEmptyPixelMap_InvalidSrcPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: 99999
          };
          image.createEmptyPixelMap(options);
          console.info('www data createEmptyPixelMap_InvalidSrcPixelFormat_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createEmptyPixelMap_InvalidSrcPixelFormat_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createEmptyPixelMap_InvalidSrcPixelFormat_002
     * @tc.number  SUB_GRAPHIC_Image_createEmptyPixelMap_InvalidSrcPixelFormat_002
     * @tc.desc    Test createEmptyPixelMap with invalid srcPixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createEmptyPixelMap_InvalidSrcPixelFormat_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: -1
          };
          image.createEmptyPixelMap(options);
          console.info('www data createEmptyPixelMap_InvalidSrcPixelFormat_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createEmptyPixelMap_InvalidSrcPixelFormat_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createEmptyPixelMap_InvalidPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createEmptyPixelMap_InvalidPixelFormat_001
     * @tc.desc    Test createEmptyPixelMap with invalid pixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createEmptyPixelMap_InvalidPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: -1
          };
          image.createEmptyPixelMap(options);
          console.info('www data createEmptyPixelMap_InvalidPixelFormat_001 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createEmptyPixelMap_InvalidPixelFormat_001 error ' + err.code);
          expect(err.code).assertEqual(7600301);
        }
        done();
      })

    /**
     * @tc.name    createEmptyPixelMap_InvalidPixelFormat_002
     * @tc.number  SUB_GRAPHIC_Image_createEmptyPixelMap_InvalidPixelFormat_002
     * @tc.desc    Test createEmptyPixelMap with invalid pixelFormat (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createEmptyPixelMap_InvalidPixelFormat_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: 9999
          };
          image.createEmptyPixelMap(options);
          console.info('www data createEmptyPixelMap_InvalidPixelFormat_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createEmptyPixelMap_InvalidPixelFormat_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createEmptyPixelMap_InvalidAlphaType_001
     * @tc.number  SUB_GRAPHIC_Image_createEmptyPixelMap_InvalidAlphaType_001
     * @tc.desc    Test createEmptyPixelMap with invalid alphaType (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createEmptyPixelMap_InvalidAlphaType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            alphaType: 9999
          };
          image.createEmptyPixelMap(options);
          console.info('www data createEmptyPixelMap_InvalidAlphaType_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createEmptyPixelMap_InvalidAlphaType_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createEmptyPixelMap_InvalidAlphaType_002
     * @tc.number  SUB_GRAPHIC_Image_createEmptyPixelMap_InvalidAlphaType_002
     * @tc.desc    Test createEmptyPixelMap with invalid alphaType (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createEmptyPixelMap_InvalidAlphaType_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            alphaType: -1
          };
          image.createEmptyPixelMap(options);
          console.info('www data createEmptyPixelMap_InvalidAlphaType_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createEmptyPixelMap_InvalidAlphaType_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createEmptyPixelMap_InvalidScaleMode_001
     * @tc.number  SUB_GRAPHIC_Image_createEmptyPixelMap_InvalidScaleMode_001
     * @tc.desc    Test createEmptyPixelMap with invalid scaleMode (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createEmptyPixelMap_InvalidScaleMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            scaleMode: 9999
          };
          image.createEmptyPixelMap(options);
          console.info('www data createEmptyPixelMap_InvalidScaleMode_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createEmptyPixelMap_InvalidScaleMode_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createEmptyPixelMap_InvalidScaleMode_002
     * @tc.number  SUB_GRAPHIC_Image_createEmptyPixelMap_InvalidScaleMode_002
     * @tc.desc    Test createEmptyPixelMap with invalid scaleMode (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createEmptyPixelMap_InvalidScaleMode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            scaleMode: -1
          };
          image.createEmptyPixelMap(options);
          console.info('www data createEmptyPixelMap_InvalidScaleMode_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createEmptyPixelMap_InvalidScaleMode_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    setOpacity_InvalidValue_001
     * @tc.number  SUB_GRAPHIC_Image_setOpacity_InvalidValue_001
     * @tc.desc    Test setOpacity with invalid value (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setOpacity_InvalidValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          await pixelMap.setOpacity(-1);
          console.info('www data setOpacity_InvalidValue_001 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setOpacity_InvalidValue_001 error ' + err.code);
          expect(err.code).assertEqual(7600206);
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    setOpacity_InvalidValue_002
     * @tc.number  SUB_GRAPHIC_Image_setOpacity_InvalidValue_002
     * @tc.desc    Test setOpacity with invalid value (0)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setOpacity_InvalidValue_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          await pixelMap.setOpacity(0);
          console.info('www data setOpacity_InvalidValue_002 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setOpacity_InvalidValue_002 error ' + err.code);
          expect(err.code).assertEqual(7600206);
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    setOpacity_ValidValue_001
     * @tc.number  SUB_GRAPHIC_Image_setOpacity_ValidValue_001
     * @tc.desc    Test setOpacity with valid value (0.5)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setOpacity_ValidValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          await pixelMap.setOpacity(0.5);
          console.info('www data setOpacity_ValidValue_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setOpacity_ValidValue_001 error ' + err.code);
          expect().assertFail();
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    setOpacity_ValidValue_002
     * @tc.number  SUB_GRAPHIC_Image_setOpacity_ValidValue_002
     * @tc.desc    Test setOpacity with valid value (1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setOpacity_ValidValue_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          await pixelMap.setOpacity(1);
          console.info('www data setOpacity_ValidValue_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setOpacity_ValidValue_002 error ' + err.code);
          expect().assertFail();
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    setOpacity_InvalidValue_003
     * @tc.number  SUB_GRAPHIC_Image_setOpacity_InvalidValue_003
     * @tc.desc    Test setOpacity with invalid value (3)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setOpacity_InvalidValue_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          await pixelMap.setOpacity(3);
          console.info('www data setOpacity_InvalidValue_003 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setOpacity_InvalidValue_003 error ' + err.code);
          expect(err.code).assertEqual(7600206);
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    setOpacitySync_InvalidValue_001
     * @tc.number  SUB_GRAPHIC_Image_setOpacitySync_InvalidValue_001
     * @tc.desc    Test setOpacitySync with invalid value (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setOpacitySync_InvalidValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          pixelMap.setOpacitySync(-1);
          console.info('www data setOpacitySync_InvalidValue_001 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setOpacitySync_InvalidValue_001 error ' + err.code);
          expect(err.code).assertEqual(7600206);
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    setOpacitySync_InvalidValue_002
     * @tc.number  SUB_GRAPHIC_Image_setOpacitySync_InvalidValue_002
     * @tc.desc    Test setOpacitySync with invalid value (0)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setOpacitySync_InvalidValue_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          pixelMap.setOpacitySync(0);
          console.info('www data setOpacitySync_InvalidValue_002 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setOpacitySync_InvalidValue_002 error ' + err.code);
          expect(err.code).assertEqual(7600206);
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    setOpacitySync_ValidValue_001
     * @tc.number  SUB_GRAPHIC_Image_setOpacitySync_ValidValue_001
     * @tc.desc    Test setOpacitySync with valid value (0.5)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setOpacitySync_ValidValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          pixelMap.setOpacitySync(0.5);
          console.info('www data setOpacitySync_ValidValue_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setOpacitySync_ValidValue_001 error ' + err.code);
          expect().assertFail();
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    setOpacitySync_ValidValue_002
     * @tc.number  SUB_GRAPHIC_Image_setOpacitySync_ValidValue_002
     * @tc.desc    Test setOpacitySync with valid value (1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setOpacitySync_ValidValue_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          pixelMap.setOpacitySync(1);
          console.info('www data setOpacitySync_ValidValue_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setOpacitySync_ValidValue_002 error ' + err.code);
          expect().assertFail();
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    setOpacitySync_InvalidValue_003
     * @tc.number  SUB_GRAPHIC_Image_setOpacitySync_InvalidValue_003
     * @tc.desc    Test setOpacitySync with invalid value (3)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setOpacitySync_InvalidValue_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          pixelMap.setOpacitySync(3);
          console.info('www data setOpacitySync_InvalidValue_003 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setOpacitySync_InvalidValue_003 error ' + err.code);
          expect(err.code).assertEqual(7600206);
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    applyScale_InvalidLevel_001
     * @tc.number  SUB_GRAPHIC_Image_applyScale_InvalidLevel_001
     * @tc.desc    Test applyScale with invalid level (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('applyScale_InvalidLevel_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          await pixelMap.applyScale(2, 2, -1);
          console.info('www data applyScale_InvalidLevel_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data applyScale_InvalidLevel_001 error ' + err.code);
          expect().assertFail();
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    applyScale_InvalidLevel_002
     * @tc.number  SUB_GRAPHIC_Image_applyScale_InvalidLevel_002
     * @tc.desc    Test applyScale with invalid level (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('applyScale_InvalidLevel_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          await pixelMap.applyScale(2, 2, 9999);
          console.info('www data applyScale_InvalidLevel_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data applyScale_InvalidLevel_002 error ' + err.code);
          expect().assertFail();
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    applyScaleSync_InvalidLevel_001
     * @tc.number  SUB_GRAPHIC_Image_applyScaleSync_InvalidLevel_001
     * @tc.desc    Test applyScaleSync with invalid level (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('applyScaleSync_InvalidLevel_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          pixelMap.applyScaleSync(2, 2, -1);
          console.info('www data applyScaleSync_InvalidLevel_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data applyScaleSync_InvalidLevel_001 error ' + err.code);
          expect().assertFail();
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name    applyScaleSync_InvalidLevel_002
     * @tc.number  SUB_GRAPHIC_Image_applyScaleSync_InvalidLevel_002
     * @tc.desc    Test applyScaleSync with invalid level (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('applyScaleSync_InvalidLevel_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let pixelMap: image.PixelMap | null = null;
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            pixelFormat: image.PixelMapFormat.RGBA_8888
          };
          pixelMap = image.createEmptyPixelMap(options);
          pixelMap.applyScaleSync(2, 2, 9999);
          console.info('www data applyScaleSync_InvalidLevel_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data applyScaleSync_InvalidLevel_002 error ' + err.code);
          expect().assertFail();
        }
        if (pixelMap) {
          await pixelMap.release();
        }
        done();
      })

  })
}