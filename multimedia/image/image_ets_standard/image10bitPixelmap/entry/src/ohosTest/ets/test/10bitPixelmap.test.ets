/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import image from '@ohos.multimedia.image';
import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import colorSpaceManager from "@ohos.graphics.colorSpaceManager";
import rpc from '@ohos.rpc';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import resourceManager from '@ohos.resourceManager';
import common from '@ohos.app.ability.common';

let isSupportHdr: boolean = false;

interface WriteFile {
  fd: number,
  uri: string
}

interface HdrPicture {
  uri: string,
  fd: number,
  fileSize: number,
  fileData: ArrayBuffer
}


export default function image10bitPixelMap() {
  describe('image10bitPixelMap', () => {
    let globalPacker: image.ImagePacker | undefined;
    let globalPixelMap: image.PixelMap | undefined;
    const RGBA_1010102: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
    const YCBCR_P010: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
    const YCRCB_P010: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
    let filesDir: string | undefined;
    let cacheDir: string | undefined;
    let openHdrPic: HdrPicture;
    let isSupportHEICEncode: boolean;



    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0100
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0100');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToBuffer(done, logger, 'promise', "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0200
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0200');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToBuffer(done, logger, 'callback', "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0300
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0300');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToBuffer(done, logger, 'sync', "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0400
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0400');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToArea(done, logger, 'promise',"CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0500
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0500');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToArea(done, logger, 'callback',"HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0600
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0600');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToArea(done, logger, 'sync',"HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0700
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0700', 'device is not support hdr');
        done();
      } else {
        await getImageInfoTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0700', 'promise', "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0800
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0800', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0800', 'device is not support hdr');
        done();
      } else {
        await getImageInfoTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0800', 'callback', "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0900
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0900', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0900', 'device is not support hdr');
        done();
      } else {
        await getImageInfoTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0900', 'sync', "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1000
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1000', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1000', 'device is not support hdr');
        done();
      } else {
        await testGetBytesNumberPerRow(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1000", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1100
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1100', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1100', 'device is not support hdr');
        done();
      } else {
        await testGetBytesNumberPerRow(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1100", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1200
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1200', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1200', 'device is not support hdr');
        done();
      } else {
        await testGetBytesNumberPerRow(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1200", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1300
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1300', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1300', 'device is not support hdr');
        done();
      } else {
        await testGetPixelBytesNumber(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1300", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1400
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1400', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1400', 'device is not support hdr');
        done();
      } else {
        await testGetPixelBytesNumber(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1400", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_8800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_8800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_8800', Level.LEVEL0, async (done: Function) => {
      const surfaceId = null; 
      const region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let pixelMap:image.PixelMap = await image.createPixelMapFromSurface(surfaceId, region);
        console.info(`Successfully created the image source`); 
        done(); 
      }catch (error) {
        console.error(`failed to pack the image: ${error.code},error is ${error}`);
        expect(Number(error) == 62980178).assertTrue();
        done();}
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000', Level.LEVEL0, async (done: Function) => {
      const surfaceId = null; 
      try {
        let pixelMap: image.PixelMap = await image.createPixelMapFromSurface(surfaceId);
        console.error("Expected an ereeror but none was thrown");
        done();
      } catch (error) {
        console.error(`Failed to create the image: ${error.code},error is ${error}`);
        expect(Number(error) == 62980178).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0200"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap = image.createPixelMapSync(color, opts);
      try {
        let csm = await pixelMap.getColorSpace();
        console.info(tag + ' Succeeded in getting ColorSpace. csm is ' + csm);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to get ColorSpace. error is ` + error + 'error code is ' + error.code);
        expect(Number(error.code) == 62980103).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_Image_Receiver_Off_ImageArrival_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_Image_Receiver_Off_ImageArrival_0900
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_Image_Receiver_Off_ImageArrival_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_Image_Receiver_Off_ImageArrival_0900', Level.LEVEL0 , async (done: Function) => {
      let receiver: image.ImageReceiver = image.createImageReceiver(8192, 8, image.ImageFormat.JPEG, 8);
      let callbackFunc = ()=>{
        console.info('Listening succeeded')
    }
    try {
      receiver.on('imageArrival', callbackFunc)
      receiver.off('imageArrival', callbackFunc)
      done()
    } catch (error) {
      console.info(`Listening error. ${error.code},error is ${error}`);
      expect(false).assertTrue();
      done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_Image_Creator_Off_ImageRelease_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_Image_Creator_Off_ImageRelease_1000
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_Image_Creator_Off_ImageRelease_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_Image_Creator_Off_ImageRelease_1000', Level.LEVEL0 , async (done: Function) => {
      let creator: image.ImageCreator = image.createImageCreator(8192, 8, image.ImageFormat.JPEG, 8);
      let callbackFunc = ()=>{
        console.info('Listen succeeded')
    }
    try {
      creator.on('imageRelease', callbackFunc)
      creator.off('imageRelease', callbackFunc)
      done()
    } catch (error) {
      console.info(`Listen error. ${error.code},error is ${error}`);
      expect(false).assertTrue();
      done()
      }
    })  

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_8800Adapt001
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_8800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_8800Adapt001', Level.LEVEL0, async (done: Function) => {
      const surfaceId = null; 
      const region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let pixelMap: image.PixelMap = await image.createPixelMapFromSurface(surfaceId, region);
        console.info(`Successfully created the image source`); 
        done(); 
      }catch (error) {
        console.error(`failed to pack the image: ${error.code},error is ${error}`);
        expect(Number(error) == 62980178).assertTrue();
        done();}
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000Adapt001
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000Adapt001', Level.LEVEL0, async (done: Function) => {
      const surfaceId = null; 
      try {
        let pixelMap: image.PixelMap = await image.createPixelMapFromSurface(surfaceId);
        console.error("Expected an ereeror but none was thrown");
        done();
      } catch (error) {
        console.error(`Failed to create the image: ${error.code},error is ${error}`);
        expect(Number(error) == 62980178).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800Adapt001
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800Adapt001', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0200"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap = image.createPixelMapSync(color, opts);
      try {
        let csm = await pixelMap.getColorSpace();
        console.info(tag + ' Succeeded in getting ColorSpace. csm is ' + csm);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to get ColorSpace. error is ` + error + 'error code is ' + error.code);
        expect(Number(error.code) == 62980103).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000Adapt002
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0900
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000Adapt002', Level.LEVEL0 , async (done: Function) => {
      let receiver: image.ImageReceiver = image.createImageReceiver(8192, 8, image.ImageFormat.JPEG, 8);
      let callbackFunc = ()=>{
        console.info('Listening succeeded')
    }
    try {
      receiver.on('imageArrival', callbackFunc)
      receiver.off('imageArrival', callbackFunc)
      done()
    } catch (error) {
      console.info(`Listening error. ${error.code},error is ${error}`);
      expect(false).assertTrue();
      done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_1000
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_1000', Level.LEVEL0 , async (done: Function) => {
      let creator: image.ImageCreator = image.createImageCreator(8192, 8, image.ImageFormat.JPEG, 8);
      let callbackFunc = ()=>{
        console.info('Listen succeeded')
    }
    try {
      creator.on('imageRelease', callbackFunc)
      creator.off('imageRelease', callbackFunc)
      done()
    } catch (error) {
      console.info(`Listen error. ${error.code},error is ${error}`);
      expect(false).assertTrue();
      done()
      }
    })  

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5800
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5800", Level.LEVEL0, async (done: Function) => {
      let num =  image.AlphaType.UNPREMUL
      console.info(`AlphaType.UNPREMUL ${num}`)
      expect(num == 3).assertTrue()
      done()
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5900
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5900", Level.LEVEL0, async (done: Function) => {
      console.info(`----------------SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5900--------------`)
      let num =  image.AlphaType.PREMUL
      console.info(`AlphaType.PREMUL ${num}`)
      expect(num == 2).assertTrue()
      done()
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6000
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6000", Level.LEVEL0, async (done: Function) => {
      console.info(`----------------SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6000--------------`)
      let num =  image.AlphaType.UNKNOWN
      console.info(`AlphaType.UNKNOWN ${num}`)
      expect(num == 0).assertTrue()
      done()
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6100", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6100  -------------`)
      let num =  image.ScaleMode.FIT_TARGET_SIZE
      console.info(`ScaleMode.FIT_TARGET_SIZE ${num}`)
      expect(num == 0).assertTrue()
      done()
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6200
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6200", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6200  -------------`)
      let num =  image.ScaleMode.CENTER_CROP
      console.info(`ScaleMode.CENTER_CROP ${num}`)
      expect(num == 1).assertTrue()
      done()
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6300
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6300", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6300  -------------`)
      let num =  image.ComponentType.YUV_Y
      console.info(`ComponentType.YUV_Y ${num}`)
      expect(num == 1).assertTrue()
      done()
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6400
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6400", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6400  -------------`)
      let num =  image.ComponentType.YUV_U
      console.info(`ComponentType.YUV_U ${num}`)
      expect(num == 2).assertTrue()
      done()
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6500
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6500", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6500  -------------`)
      let num =  image.ComponentType.YUV_V
      console.info(`ComponentType.YUV_V ${num}`)
      expect(num == 3).assertTrue()
      done()
    });
  
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6600
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6600", Level.LEVEL0, async (done: Function) => {
      let low_quality = image.ResolutionQuality.LOW
      expect(low_quality).assertEqual(1);
      console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_xxxxx' + ' The quality of the picture is low quality.')
      let medium_quality = image.ResolutionQuality.MEDIUM
      expect(medium_quality).assertEqual(2);
      console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_xxxxx' + ' The quality of the picture is medium quality.')
      let high_quality = image.ResolutionQuality.HIGH
      expect(high_quality).assertEqual(3);
      console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_xxxxx' + ' The quality of the picture is high quality.')
      done()
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6900
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6900", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6900  -------------`)
      try {
        image.createPremultipliedPixelMap(null, null)
        done()
      }catch (error) {
        console.error(`failed to createPremultipliedPixelMap: ${error.code},error is ${error}`);
        expect(Number(error) == 401).assertTrue();
        done();}
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1500
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1500', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1500', 'device is not support hdr');
        done();
      } else {
        await testGetPixelBytesNumber(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1500", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1600
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1600', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1600', 'device is not support hdr');
        done();
      } else {
        await testGetDensity(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1600", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1700
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1700', 'device is not support hdr');
        done();
      } else {
        await testGetDensity(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1700", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1800
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1800', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1800', 'device is not support hdr');
        done();
      } else {
        await testGetDensity(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1800", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1900
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1900', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1900', 'device is not support hdr');
        done();
      } else {
        await opacityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1900', 'promise', "CUVAHdrMulti.jpg");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2000
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2000', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2000', 'device is not support hdr');
        done();
      } else {
        await opacityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2000', 'callback', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2100
     * @tc.desc   1. create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2100', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2100', 'device is not support hdr');
        done();
      } else {
        await opacityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2100', 'sync', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200', 'device is not support hdr');
        done();
      } else {
        await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200', 'promise', "CUVAHdrMulti.jpg");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300', 'device is not support hdr');
        done();
      } else {
        await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300', 'callback', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400', 'device is not support hdr');
        done();
      } else {
        await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400', 'sync', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500', 'device is not support hdr');
        done();
      } else {
        await testSetAndGetColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500",  "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600', 'device is not support hdr');
        done();
      } else {
        await testSetAndGetColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600",  "CUVAHdrMulti.jpg", YCBCR_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700', 'device is not support hdr');
        done();
      } else {
        await testSetAndGetColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700",  "CUVAHdrMulti.jpg", YCRCB_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800', Level.LEVEL1, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800', 'device is not support hdr');
        done();
      } else {
        await applyColorSpaceTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800', 'promise', "CUVAHdrMulti.jpg");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900', Level.LEVEL1, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900', 'device is not support hdr');
        done();
      } else {
        await applyColorSpaceTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900', 'callback', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000
     * @tc.desc   1.create InitializationOptions object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000', 'device is not support hdr');
        done();
      } else {
        await testMarshallingPixelmap(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100', 'device is not support hdr');
        done();
      } else {
        await testMarshallingPixelmap(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200
     * @tc.desc   1.create InitializationOptions object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200', 'device is not support hdr');
        done();
      } else {
        await testMarshallingPixelmap(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width * 2) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300',
          'promise', 'scale', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 2.0, 1.0)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width * 2) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400',
          'callback', 'scale', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 2.0, 1.0)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width * 2) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500',
          'sync', 'scaleSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 2.0, 1.0)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
          if (newInfo.size.width != orgInfo.size.width + 3) {
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600',
          'promise', 'translate', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 3.0, 1.0)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width + 3) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700',
          'callback', 'translate', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 3.0, 1.0)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width + 3) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800',
          'sync', 'translateSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 3.0, 1.0)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.height) {
            logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900',
          'promise', 'rotate', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 90.0)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.height) {
            logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000',
          'callback', 'rotate', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 90.0)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.height) {
            logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100',
          'sync', 'rotateSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 90.0)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200',
          'promise', 'flip', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, false, true)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300',
          'callback', 'flip', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, false, true)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400
     * @tc.desc   1.create pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400',
          'sync', 'flipSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, false, true)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500', 'device is not support hdr');
        done();
      } else {
        let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != region.size.width) {
            logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500',
          'promise', 'crop', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, region)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600', 'device is not support hdr');
        done();
      } else {
        let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != region.size.width) {
            logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600',
          'callback', 'crop', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, region)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700', 'device is not support hdr');
        done();
      } else {
        let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != region.size.width) {
            logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700',
          'sync', 'cropSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, region)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800', 'device is not support hdr');
        done();
      } else {
        await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800", "CUVAHdrMulti.jpg", RGBA_1010102, "promise");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900', 'device is not support hdr');
        done();
      } else {
        await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900", "HDRVividSingleLayer.heic", YCBCR_P010, "callback");
      }

    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000', 'device is not support hdr');
        done();
      } else {
        await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000", "HDRVividSingleLayer.heic", YCRCB_P010, "callback");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let writeFile = getWriteFile("test_pack_to_file_promise.jpg");
        let packOpt: image.PackingOption = { format: "image/jpeg", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToFile(done, logger, writeFile, packOpt, "promise", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200");
      if (!isSupportHdr || !isSupportHEICEncode) {
        if (!isSupportHdr) {
          logger.log("device is not support hdr");
        } else {
          logger.log("device is not support heic encode");
        }
        done();
      } else {
        let writeFile = getWriteFile("test_pack_to_file_callback.heic");
        let packOpt: image.PackingOption = { format: "image/heic", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToFile(done, logger, writeFile, packOpt, "callback", "HDRVividSingleLayer.heic", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let packOpt: image.PackingOption = { format: "image/jpeg", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToData(done, logger, packOpt, "promise", "HDRVividSingleLayer.heic", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400");
      if (!isSupportHdr || !isSupportHEICEncode) {
        if (!isSupportHdr) {
          logger.log("device is not support hdr");
        } else {
          logger.log("device is not support heic encode");
        }
        done();
      } else {
        let packOpt: image.PackingOption = { format: "image/heic", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToData(done, logger, packOpt, "callback", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500', 'device is not support hdr');
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600', 'device is not support hdr');
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700', 'device is not support hdr');
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });
  })
}