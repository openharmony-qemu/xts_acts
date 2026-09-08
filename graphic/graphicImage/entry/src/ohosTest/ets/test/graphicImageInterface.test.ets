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
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';

export default function graphicImageInterfaceTest() {
  describe('graphicImageInterfaceTest', (done:Function)=> {
    console.log('describe graphicImageInterfaceTest start!!!')

    beforeAll(async ()=> {
    })
    /**
     * @tc.name   testCreatePremultipliedPixelMap_callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_016
     * @tc.desc   The transparent channel non-premultiplied mode of PixelMap is changed to premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through the callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePremultipliedPixelMap_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = " =testCreatePremultipliedPixelMap_callback= "
      console.log(" www data 1" + msg + " begin ")
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts2: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 2}
      let opts3: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 3}
      console.log(" www data 1.1" + msg)
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts2);
        let dstPixelMap = image.createPixelMapSync(opts3);
        console.log(" www data 1.2" + msg)
        image.createPremultipliedPixelMap(dstPixelMap, srcPixelmap, (error: BusinessError) => {
          if(error) {
              console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message} `);
              expect().assertFail()
              done()
          } else {
              console.log(" www data 1.3" + msg)
              console.info(msg + ' Succeeded in converting pixelmap.');
              srcPixelmap.release();
              dstPixelMap.release();
              done()
          }
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCreatePremultipliedPixelMap_promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_017
     * @tc.desc   Convert PixelMap data into a pre-multiply format based on transparency, save the converted data to another PixelMap, and return the result through Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePremultipliedPixelMap_promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = " =testCreatePremultipliedPixelMap_promise= "
      console.log(" www data 2" + msg + " begin ")
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts2: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 2}
      let opts3: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 3}
      console.log(" www data 2.1" + msg)
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts2);
        let dstPixelMap = image.createPixelMapSync(opts3);
        console.log(" www data 2.2" + msg)
        image.createPremultipliedPixelMap(dstPixelMap, srcPixelmap).then(async () => {
            console.log(" www data 2.3" + msg)
            console.info(msg + ' Succeeded in converting pixelmap.');
            await srcPixelmap.release();
            await dstPixelMap.release();
            done()
        }).catch((error: BusinessError) => {
            console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail()
            done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCreateUnpremultipliedPixelMap_callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_018
     * @tc.desc   The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through the callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUnpremultipliedPixelMap_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = " =testCreateUnpremultipliedPixelMap_callback= "
      console.log(" www data 3" + msg + " begin ")
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts2: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 2}
      let opts3: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 3}
      console.log(" www data 3.1" + msg)
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts2);
        let dstPixelMap = image.createPixelMapSync(opts3);
        console.log(" www data 3.2" + msg)
        image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError) => {
          if(error) {
              console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message} `);
              expect().assertFail()
              done()
          } else {
              console.log(" www data 3.3" + msg)
              console.info(msg + ' Succeeded in converting pixelmap.');
              srcPixelmap.release();
              dstPixelMap.release();
              done()
          }
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCreateUnpremultipliedPixelMap_promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_019
     * @tc.desc   The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUnpremultipliedPixelMap_promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = " =testCreateUnpremultipliedPixelMap_promise= "
      console.log(" www data 4" + msg + " begin ")
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts2: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 2}
      let opts3: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 3}
      console.log(" www data 4.1" + msg)
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts2);
        let dstPixelMap = image.createPixelMapSync(opts3);
        console.log(" www data 4.2" + msg)
        image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap).then(async () => {
            console.log(" www data 4.3" + msg)
            console.info(msg + ' Succeeded in converting pixelmap.');
            await srcPixelmap.release();
            await dstPixelMap.release();
            done()
        }).catch((error: BusinessError) => {
            console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail()
            done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testWriteBufferToPixelsSync
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_020
     * @tc.desc   The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWriteBufferToPixelsSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testWriteBufferToPixelsSync= "

      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      image.createPixelMap(color, opts).then(async (pixelMap: image.PixelMap) => {
        try {
          console.info(msg + ' Succeeded in createPixelMap.');
          if (pixelMap != undefined) {
              pixelMap.writeBufferToPixelsSync(color);
              console.info(msg + ' Succeeded in writeBufferToPixelsSync.');
              await pixelMap.release();
              done()
          }else{
              console.info(msg + ' pixelMap == undefined');
              expect().assertFail()
              done()
          }
        } catch (err) {
          console.log(msg + " Faild in writeBufferToPixelsSync " + JSON.stringify(err))
          console.log(msg + " Faild in writeBufferToPixelsSync " + err)
          expect().assertFail()
          done()
        }
      }).catch((error: BusinessError) => {
          console.error(msg + ` Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
      })
    })

    /**
     * @tc.name   testReadPixelsSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_021
     * @tc.desc   Reads the image data in the area and returns the result synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReadPixelsSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testReadPixelsSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then(async (pixelMap: image.PixelMap) => {
          const area: image.PositionArea = {
            pixels: new ArrayBuffer(8),
            offset: 0,
            stride: 8,
            region: {
              size: {
                height: 1, width: 2
              }, x: 0, y: 0
            }
          };
          pixelMap.readPixelsSync(area);
          await pixelMap.release();
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testOpacitySync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_022
     * @tc.desc   Sets the transparency ratio of PixelMap, initializes PixelMap, and returns the result synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpacitySync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testOpacitySync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then(async (pixelMap: image.PixelMap) => {
          let rate : number = 0.5;
          pixelMap.opacitySync(rate);
          await pixelMap.release();
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCreateAlphaPixelmapSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_023
     * @tc.desc   Generate a PixelMap containing only the alpha channel information according to the alpha channel information. It can be used for shadow effect and the result of PixelMap type is returned synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAlphaPixelmapSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = " =testCreateAlphaPixelmapSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then(async (pixelMap: image.PixelMap) => {
          let pixelmap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          await pixelmap.release();
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testTranslateSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_024
     * @tc.desc   The image is transformed according to the input coordinates and the result is returned synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTranslateSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testTranslateSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then(async (pixelMap: image.PixelMap) => {
          let translateX : number = 50.0;
          let translateY : number = 10.0;
          pixelMap.translateSync(translateX, translateY);
          await pixelMap.release();
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testRotateSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_025
     * @tc.desc   Rotates the picture according to the angle entered and returns the result synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRotateSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testRotateSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then(async (pixelMap: image.PixelMap) => {
          let angle : number = 90.0;
          pixelMap.rotateSync(angle);
          await pixelMap.release();
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testFlipSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_026
     * @tc.desc   Flips the image based on the conditions entered and returns the result synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlipSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testFlipSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then(async (pixelMap: image.PixelMap) => {
          let horizontal : boolean = true;
          let vertical : boolean = false;
          pixelMap.flipSync(horizontal, vertical);
          await pixelMap.release();
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCropSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_027
     * @tc.desc   Crops the picture to the size you enter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCropSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testCropSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then(async (pixelMap: image.PixelMap) => {
          let region : image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
          pixelMap.cropSync(region);
          await pixelMap.release();
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testSrcPixelFormat
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_028
     * @tc.desc   Crops the picture to the size you enter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSrcPixelFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testSrcPixelFormat= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4, width: 6
        },
        srcPixelFormat: 2
      }
      image.createPixelMap(color, opts).then(async (pixelMap: image.PixelMap) => {
        console.log(msg + " Succeed in createPixelMap ")
        await pixelMap.release();
        done()
      }).catch((error: BusinessError) => {
        console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail()
        done()
      })
    })
    
    /**
     * @tc.name    createPixelMapCb_InvalidSrcPixelFormat_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapCb_InvalidSrcPixelFormat_0200
     * @tc.desc    Test createPixelMap callback with invalid srcPixelFormat (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapCb_InvalidSrcPixelFormat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: 9999,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await new Promise<void>((resolve, reject) => {
            image.createPixelMap(colors, options, (err: BusinessError, pixelMap: image.PixelMap) => {
              if (err) {
                reject(err);
              } else {
                resolve();
              }
            });
          });
          console.info('www data createPixelMapCb_InvalidSrcPixelFormat_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapCb_InvalidSrcPixelFormat_0200 error ' + err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapCb_InvalidAlphaType_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapCb_InvalidAlphaType_0200
     * @tc.desc    Test createPixelMap callback with invalid alphaType (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapCb_InvalidAlphaType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: 9999,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await new Promise<void>((resolve, reject) => {
            image.createPixelMap(colors, options, (err: BusinessError, pixelMap: image.PixelMap) => {
              if (err) {
                reject(err);
              } else {
                resolve();
              }
            });
          });
          console.info('www data createPixelMapCb_InvalidAlphaType_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapCb_InvalidAlphaType_0200 error ' + err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapCb_InvalidScaleMode_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapCb_InvalidScaleMode_0200
     * @tc.desc    Test createPixelMap callback with invalid scaleMode (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapCb_InvalidScaleMode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: 9999
          };
          await new Promise<void>((resolve, reject) => {
            image.createPixelMap(colors, options, (err: BusinessError, pixelMap: image.PixelMap) => {
              if (err) {
                reject(err);
              } else {
                resolve();
              }
            });
          });
          console.info('www data createPixelMapCb_InvalidScaleMode_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapCb_InvalidScaleMode_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMap_InvalidPixelFormat_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMap_InvalidPixelFormat_0200
     * @tc.desc    Test createPixelMap promise with invalid pixelFormat (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMap_InvalidPixelFormat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: 9999,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMap(colors, options);
          console.info('www data createPixelMap_InvalidPixelFormat_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMap_InvalidPixelFormat_0200 error ' + err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMap_InvalidAlphaType_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMap_InvalidAlphaType_0200
     * @tc.desc    Test createPixelMap promise with invalid alphaType (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMap_InvalidAlphaType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: 9999,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMap(colors, options);
          console.info('www data createPixelMap_InvalidAlphaType_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMap_InvalidAlphaType_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMap_InvalidScaleMode_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMap_InvalidScaleMode_0200
     * @tc.desc    Test createPixelMap promise with invalid scaleMode (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMap_InvalidScaleMode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: 9999
          };
          await image.createPixelMap(colors, options);
          console.info('www data createPixelMap_InvalidScaleMode_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMap_InvalidScaleMode_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSync_InvalidSrcPixelFormat_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSync_InvalidSrcPixelFormat_0200
     * @tc.desc    Test createPixelMapSync with invalid srcPixelFormat (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync_InvalidSrcPixelFormat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: 9999,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapSync(colors, options);
          console.info('www data createPixelMapSync_InvalidSrcPixelFormat_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapSync_InvalidSrcPixelFormat_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSync_InvalidAlphaType_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSync_InvalidAlphaType_0200
     * @tc.desc    Test createPixelMapSync with invalid alphaType (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync_InvalidAlphaType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: 9999,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapSync(colors, options);
          console.info('www data createPixelMapSync_InvalidAlphaType_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapSync_InvalidAlphaType_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSync_InvalidScaleMode_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSync_InvalidScaleMode_0200
     * @tc.desc    Test createPixelMapSync with invalid scaleMode (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync_InvalidScaleMode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: 9999
          };
          image.createPixelMapSync(colors, options);
          console.info('www data createPixelMapSync_InvalidScaleMode_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapSync_InvalidScaleMode_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocator_InvalidSrcPixelFormat_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocator_InvalidSrcPixelFormat_0200
     * @tc.desc    Test createPixelMapUsingAllocator with invalid srcPixelFormat (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator_InvalidSrcPixelFormat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: 9999,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapUsingAllocator(colors, options);
          console.info('www data createPixelMapUsingAllocator_InvalidSrcPixelFormat_0200 success');
          expect().assertFail();
          done();
        } catch (err) {
          console.info('www data createPixelMapUsingAllocator_InvalidSrcPixelFormat_0200 error ' + err.code);
          expect(err.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocator_InvalidPixelFormat_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocator_InvalidPixelFormat_0200
     * @tc.desc    Test createPixelMapUsingAllocator with invalid pixelFormat (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator_InvalidPixelFormat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: 9999,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapUsingAllocator(colors, options);
          console.info('www data createPixelMapUsingAllocator_InvalidPixelFormat_0200 success');
          expect().assertFail();
          done();
        } catch (err) {
          console.info('www data createPixelMapUsingAllocator_InvalidPixelFormat_0200 error ' + err.code);
          expect(err.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocator_InvalidAlphaType_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocator_InvalidAlphaType_0200
     * @tc.desc    Test createPixelMapUsingAllocator with invalid alphaType (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator_InvalidAlphaType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: 9999,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapUsingAllocator(colors, options);
          console.info('www data createPixelMapUsingAllocator_InvalidAlphaType_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapUsingAllocator_InvalidAlphaType_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocator_InvalidScaleMode_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocator_InvalidScaleMode_0200
     * @tc.desc    Test createPixelMapUsingAllocator with invalid scaleMode (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator_InvalidScaleMode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: 9999
          };
          await image.createPixelMapUsingAllocator(colors, options);
          console.info('www data createPixelMapUsingAllocator_InvalidScaleMode_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapUsingAllocator_InvalidScaleMode_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocatorSync_InvalidSrcPixelFormat_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocatorSync_InvalidSrcPixelFormat_0200
     * @tc.desc    Test createPixelMapUsingAllocatorSync with invalid srcPixelFormat (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync_InvalidSrcPixelFormat_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: 9999,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapUsingAllocatorSync(colors, options);
          console.info('www data createPixelMapUsingAllocatorSync_InvalidSrcPixelFormat_0200 success');
          expect().assertFail();
          done();
        } catch (err) {
          console.info('www data createPixelMapUsingAllocatorSync_InvalidSrcPixelFormat_0200 error ' + err.code);
          expect(err.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocatorSync_InvalidPixelFormat_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocatorSync_InvalidPixelFormat_0200
     * @tc.desc    Test createPixelMapUsingAllocatorSync with invalid pixelFormat (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync_InvalidPixelFormat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: 9999,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapUsingAllocatorSync(colors, options);
          console.info('www data createPixelMapUsingAllocatorSync_InvalidPixelFormat_0200 success');
          expect().assertFail();
          done();
        } catch (err) {
          console.info('www data createPixelMapUsingAllocatorSync_InvalidPixelFormat_0200 error ' + err.code);
          expect(err.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocatorSync_InvalidAlphaType_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocatorSync_InvalidAlphaType_0200
     * @tc.desc    Test createPixelMapUsingAllocatorSync with invalid alphaType (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync_InvalidAlphaType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: 9999,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapUsingAllocatorSync(colors, options);
          console.info('www data createPixelMapUsingAllocatorSync_InvalidAlphaType_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapUsingAllocatorSync_InvalidAlphaType_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocatorSync_InvalidScaleMode_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocatorSync_InvalidScaleMode_0200
     * @tc.desc    Test createPixelMapUsingAllocatorSync with invalid scaleMode (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync_InvalidScaleMode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: 9999
          };
          image.createPixelMapUsingAllocatorSync(colors, options);
          console.info('www data createPixelMapUsingAllocatorSync_InvalidScaleMode_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapUsingAllocatorSync_InvalidScaleMode_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSyncOpts_InvalidSrcPixelFormat_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSyncOpts_InvalidSrcPixelFormat_0200
     * @tc.desc    Test createPixelMapSync(options) with invalid srcPixelFormat (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSyncOpts_InvalidSrcPixelFormat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: 9999,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapSync(options);
          console.info('www data createPixelMapSyncOpts_InvalidSrcPixelFormat_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapSyncOpts_InvalidSrcPixelFormat_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSyncOpts_InvalidAlphaType_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSyncOpts_InvalidAlphaType_0200
     * @tc.desc    Test createPixelMapSync(options) with invalid alphaType (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSyncOpts_InvalidAlphaType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: 9999,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapSync(options);
          console.info('www data createPixelMapSyncOpts_InvalidAlphaType_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapSyncOpts_InvalidAlphaType_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSyncOpts_InvalidScaleMode_0200
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSyncOpts_InvalidScaleMode_0200
     * @tc.desc    Test createPixelMapSync(options) with invalid scaleMode (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSyncOpts_InvalidScaleMode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: 9999
          };
          image.createPixelMapSync(options);
          console.info('www data createPixelMapSyncOpts_InvalidScaleMode_0200 success');
          done();
        } catch (err) {
          console.info('www data createPixelMapSyncOpts_InvalidScaleMode_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    scaleSync_InvalidAntiAliasingLevel_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_scaleSync_InvalidAntiAliasingLevel_0200
     * @tc.desc    Test scaleSync with invalid AntiAliasingLevel (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('scaleSync_InvalidAntiAliasingLevel_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          const pixelMap = await image.createPixelMapFromPixels(pixels, options);
          pixelMap.scaleSync(2.0, 2.0, 9999);
          console.info('www data scaleSync_InvalidAntiAliasingLevel_0200 success');
          done();
        } catch (err) {
          console.info('www data scaleSync_InvalidAntiAliasingLevel_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createScaledPixelMap_InvalidAntiAliasingLevel_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_createScaledPixelMap_InvalidAntiAliasingLevel_0200
     * @tc.desc    Test createScaledPixelMap with invalid AntiAliasingLevel (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createScaledPixelMap_InvalidAntiAliasingLevel_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          const pixelMap = await image.createPixelMapFromPixels(pixels, options);
          await pixelMap.createScaledPixelMap(2.0, 2.0, 9999);
          console.info('www data createScaledPixelMap_InvalidAntiAliasingLevel_0200 success');
          done();
        } catch (err) {
          console.info('www data createScaledPixelMap_InvalidAntiAliasingLevel_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createScaledPixelMapSync_InvalidAntiAliasingLevel_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_createScaledPixelMapSync_InvalidAntiAliasingLevel_0200
     * @tc.desc    Test createScaledPixelMapSync with invalid AntiAliasingLevel (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createScaledPixelMapSync_InvalidAntiAliasingLevel_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          const pixelMap = await image.createPixelMapFromPixels(pixels, options);
          pixelMap.createScaledPixelMapSync(2.0, 2.0, 9999);
          console.info('www data createScaledPixelMapSync_InvalidAntiAliasingLevel_0200 success');
          done();
        } catch (err) {
          console.info('www data createScaledPixelMapSync_InvalidAntiAliasingLevel_0200 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    getMetadata_InvalidHdrMetadataKey_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_getMetadata_InvalidHdrMetadataKey_0200
     * @tc.desc    Test getMetadata with invalid HdrMetadataKey (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getMetadata_InvalidHdrMetadataKey_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          const pixelMap = await image.createPixelMapFromPixels(pixels, options);
          pixelMap.getMetadata(9999);
          console.info('www data getMetadata_InvalidHdrMetadataKey_0200 success');
          expect().assertFail();
          done();
        } catch (err) {
          console.info('www data getMetadata_InvalidHdrMetadataKey_0200 error ' + err.code);
          expect(err.code).assertEqual(62980173);
          done();
        }
      })

    /**
     * @tc.name    setMetadata_InvalidHdrMetadataKey_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_setMetadata_InvalidHdrMetadataKey_0200
     * @tc.desc    Test setMetadata with invalid HdrMetadataKey (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('setMetadata_InvalidHdrMetadataKey_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          const pixelMap = await image.createPixelMapFromPixels(pixels, options);
          await pixelMap.setMetadata(9999, new ArrayBuffer(0));
          console.info('www data setMetadata_InvalidHdrMetadataKey_0200 success');
          expect().assertFail();
          done();
        } catch (err) {
          console.info('www data setMetadata_InvalidHdrMetadataKey_0200 error ' + err);
          expect(err).assertEqual(62980173);
          done();
        }
      })

    /**
     * @tc.name    createCroppedAndScaledPixelMapSync_InvalidRegion_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_createCroppedAndScaledPixelMapSync_InvalidRegion_0200
     * @tc.desc    Test createCroppedAndScaledPixelMapSync with invalid region (size.width=-1, size.height=-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createCroppedAndScaledPixelMapSync_InvalidRegion_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          const pixelMap = await image.createPixelMapFromPixels(pixels, options);
          const region: image.Region = {
            size: { width: -1, height: -1 },
            x: 0,
            y: 0
          };
          pixelMap.createCroppedAndScaledPixelMapSync(region, 2.0, 2.0, -1);
          console.info('www data createCroppedAndScaledPixelMapSync_InvalidRegion_0200 success');
          expect().assertFail();
          done();
        } catch (err) {
          console.info('www data createCroppedAndScaledPixelMapSync_InvalidRegion_0200 error ' + err.code);
          expect(err.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name    createCroppedAndScaledPixelMapSync_InvalidRegion_0300
     * @tc.number  SUB_GRAPHIC_PixelMap_createCroppedAndScaledPixelMapSync_InvalidRegion_0300
     * @tc.desc    Test createCroppedAndScaledPixelMapSync with invalid region (size.width=-1, size.height=-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createCroppedAndScaledPixelMapSync_InvalidRegion_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          const pixelMap = await image.createPixelMapFromPixels(pixels, options);
          const region: image.Region = {
            size: { width: -1, height: -1 },
            x: 0,
            y: 0
          };
          pixelMap.createCroppedAndScaledPixelMapSync(region, 2.0, 2.0, 9999);
          console.info('www data createCroppedAndScaledPixelMapSync_InvalidRegion_0300 success');
          expect().assertFail();
          done();
        } catch (err) {
          console.info('www data createCroppedAndScaledPixelMapSync_InvalidRegion_0300 error ' + err.code);
          expect(err.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name    createCroppedAndScaledPixelMap_InvalidRegion_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_createCroppedAndScaledPixelMap_InvalidRegion_0200
     * @tc.desc    Test createCroppedAndScaledPixelMap with invalid region (size.width=-1, size.height=-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createCroppedAndScaledPixelMap_InvalidRegion_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          const pixelMap = await image.createPixelMapFromPixels(pixels, options);
          const region: image.Region = {
            size: { width: -1, height: -1 },
            x: 0,
            y: 0
          };
          await pixelMap.createCroppedAndScaledPixelMap(region, 2.0, 2.0, -1);
          console.info('www data createCroppedAndScaledPixelMap_InvalidRegion_0200 success');
          expect().assertFail();
          done();
        } catch (err) {
          console.info('www data createCroppedAndScaledPixelMap_InvalidRegion_0200 error ' + err.code);
          expect(err.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name    createCroppedAndScaledPixelMap_InvalidRegion_0300
     * @tc.number  SUB_GRAPHIC_PixelMap_createCroppedAndScaledPixelMap_InvalidRegion_0300
     * @tc.desc    Test createCroppedAndScaledPixelMap with invalid region (size.width=-1, size.height=-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createCroppedAndScaledPixelMap_InvalidRegion_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const pixels: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          const pixelMap = await image.createPixelMapFromPixels(pixels, options);
          const region: image.Region = {
            size: { width: -1, height: -1 },
            x: 0,
            y: 0
          };
          await pixelMap.createCroppedAndScaledPixelMap(region, 2.0, 2.0, 9999);
          console.info('www data createCroppedAndScaledPixelMap_InvalidRegion_0300 success');
          expect().assertFail();
          done();
        } catch (err) {
          console.info('www data createCroppedAndScaledPixelMap_InvalidRegion_0300 error ' + err.code);
          expect(err.code).assertEqual(7600201);
          done();
        }
      })

  })
}