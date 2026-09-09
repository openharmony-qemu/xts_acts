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
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';
import { taskpoolTest } from '../MainAbility/utils/taskpool'
import resourceManager from '@ohos.resourceManager'
import { rpc } from '@kit.IPCKit';
import { colorSpaceManager } from '@kit.ArkGraphics2D'
import sendableImage from '@ohos.multimedia.sendableImage';

class MySequence implements rpc.Parcelable {
  pixel_map: image.PixelMap;
  constructor(conPixelmap: image.PixelMap) {
    this.pixel_map = conPixelmap;
  }
  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence) {
    try {
      let parcel:rpc.MessageSequence = new rpc.MessageSequence();
      this.pixel_map = image.createPixelMapFromParcel(parcel);
      expect().assertFail();
    } catch(e) {
      let error = e as BusinessError;
      console.error(`www data createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
      expect(Number(error.code) == 62980178).assertTrue();
      return false;
    }
    return true;
  }
}

export default function imagePixelMapErrorCodeTest() {
  describe('imagePixelMapErrorCodeTest', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("imagePixelMapTest error code beforeEach start");
      done();
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0100
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      image.createPixelMapFromSurface('11111111', region).then(() => {
        console.info('www data Succeeded in creating pixelmap from SurfaceData');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(`www data Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect(Number(error) == 62980178).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0200
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      image.createPixelMapFromSurface('11111111', null).then(() => {
        console.info('www data Succeeded in creating pixelmap from SurfaceData');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(`www data Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 62980105).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0300
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      image.createPixelMapFromSurface('11111111').then(() => {
        console.info('Succeeded in creating pixelmap from SurfaceData');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(`www data Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect(Number(error) == 62980178).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0400
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.setTransferDetached(null);
        console.info('Succeeded to setTransferDetached');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to setTransferDetached. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501).assertTrue();
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0500
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      console.info('www data is true ' + pixelMap.isStrideAlignment);
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('Succeeded to getMetaData');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501 || Number(error.code) == 62980173).assertTrue();
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0600
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('Succeeded to getMetaData');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501 || Number(error.code) == 62980173).assertTrue();
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0700
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const opts: image.InitializationOptions = { 
        editable: true, pixelFormat: 3, size: { height: 100, width: 100 } 
      }
      let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
      if (pixelMap != undefined) {
        console.info('www data Succeeded in creating pixelMap object.');
        try {
          let staticMetadata = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
          console.info('www data getMetadata 111');
          expect().assertFail();
        } catch(error) {
          console.info('pixelMap create failed' + error);
          expect(Number(error.code) == 62980173).assertTrue();
          await pixelMap.release();
          done();
        }
      } else {
        console.info('www data Failed to create pixelMap.');
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0800
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent('512.jpg');
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      try {
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('Succeeded to getMetaData');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 62980302 || Number(error.code) == 62980173).assertTrue();
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0900
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        pixelMap.setMemoryNameSync(null);
        console.info('www data Succeeded to setMemoryNameSync');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 401).assertTrue();
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1000
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        pixelMap.cloneSync();
        console.info('www data Succeeded to cloneSync');
        await pixelMap.release();
        done();
      } catch(error){
        console.error(`www data Failed to cloneSync. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1100
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.cloneSync();
        console.info('Succeeded to cloneSync');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to cloneSync. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501).assertTrue();
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1200
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        await pixelMap.clone();
        console.info('www data Succeeded to cloneSync');
        await pixelMap.release();
        done();
      } catch(error){
        console.error(`www data Failed to cloneSync. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1300
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = await pixelMap.clone();
        console.info('Succeeded to clone');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to clone. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501).assertTrue();
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1400
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        image.createPixelMapFromSurfaceSync('11111111', region);
        console.info('www data Succeeded in creating createPixelMapFromSurfaceSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`www data Failed to create createPixelMapFromSurfaceSync. code is ${error.code}`);
        expect(Number(error.code) == 62980178).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1500
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        image.createPixelMapFromSurfaceSync('11111111', null);
        console.info('www data Succeeded in creating createPixelMapFromSurfaceSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`www data Failed to create createPixelMapFromSurfaceSync. code is ${error.code}`);
        expect(Number(error.code) == 401).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_1600
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        image.createPixelMapFromSurfaceSync('11111111');
        console.info('www data Succeeded in creating createPixelMapFromSurfaceSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`www data Failed to create createPixelMapFromSurfaceSync. code is ${error.code}`);
        expect(Number(error.code) == 62980178).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_1700
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let img = getContext().resourceManager.getMediaContentSync($r('app.media.app_icon'));
      let imageSource = image.createImageSource(img.buffer.slice(0));
      let decodingOptions: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.AUTO
      };
      let pixelmap = imageSource.createPixelMapSync(decodingOptions);
      if (pixelmap != undefined) {
        console.info('www data Succeeded in creating pixelMap object.');
        pixelmap.toSdr().then(() => {
          let imageInfo = pixelmap.getImageInfoSync();
          console.info("www data after toSdr ,imageInfo isHdr:" + imageInfo.isHdr);
          expect().assertFail();
          done();
        }).catch(async (error: BusinessError) => {
          console.error(`www data Failed to set sdr. code is ${error.code}, message is ${error.message}`);
          expect(Number(error.code) == 62980137).assertTrue();
          await pixelmap.release();
          done();
        });
      } else {
        console.info('Failed to create pixelMap.');
        done();
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_1800
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      taskpoolTest(pixelMap);
      try {
        let imageInfo : image.ImageInfo = pixelMap.getImageInfoSync();
        console.info('Succeeded to imageInfo');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to imageInfo. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501).assertTrue();
        await pixelMap.release();
        done();
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_1900
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      
      const color: ArrayBuffer = new ArrayBuffer(96);
      let bufferArr: Uint8Array = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = 0x80;
      }
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNPREMUL
      }
      let pixelMap: image.PixelMap | undefined = undefined;
      image.createPixelMap(color, opts).then((srcPixelMap: image.PixelMap) => {
        console.error("www data 11111111");
        pixelMap = srcPixelMap;
        try {
          // 序列化。
          let parcelable: MySequence = new MySequence(pixelMap);
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          data.writeParcelable(parcelable);

          // 反序列化 rpc获取到data。
          let ret: MySequence = new MySequence(pixelMap);
          data.readParcelable(ret);
          
          // 获取到pixelmap。
          let unmarshPixelmap = ret.pixel_map;
          done();
        }catch(error){
          expect().assertFail();
          done();
        }
      })
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2000
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let rate: number = 0.5;
      if (pixelMap != undefined) {
        pixelMap.opacity(rate, (err: BusinessError) => {
          if (err) {
            console.error(`www data Failed to set opacity. code is ${err.code}, message is ${err.message}`);
            expect(Number(err) == 62980103).assertTrue();
            pixelMap.release();
            done();
          } else {
            console.info("www data Succeeded in setting opacity.");
            expect().assertFail();
            done();
          }
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2100
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let rate: number = 0.5;
      if (pixelMap != undefined) {
        pixelMap.opacity(rate, (err: BusinessError) => {
          if (err) {
            console.error(`www data Failed to set opacity. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info("www data Succeeded in setting opacity.");
            pixelMap.release();
            done();
          }
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2200
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let rate: number = 0.5;
      if (pixelMap != undefined) {
        pixelMap.opacity(rate).then(async () => {
          console.info('www data Succeeded in setting opacity.');
          await pixelMap.release();
          done();
        }).catch((err: BusinessError) => {
          console.error(`www data Failed to set opacity. code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2300
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      if (pixelMap != undefined) {
        try {
          pixelMap.setColorSpace(csm);
          console.error('www data succeed in setColorSpace.');
          await pixelMap.release();
          done();
        } catch(err){
          console.error(`www data Failed to. code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2400
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        try {
          pixelMap.setColorSpace(null);
          expect().assertFail();
          done();
        } catch(err){
          console.error(`www data Failed to. code is ${err.code}, message is ${err.message}`);
          expect(Number(err.code) == 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2500
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let staticMetadata: image.HdrStaticMetadata = {
        displayPrimariesX: [1.1, 1.1, 1.1],
        displayPrimariesY: [1.2, 1.2, 1.2],
        whitePointX: 1.1,
        whitePointY: 1.2,
        maxLuminance: 2.1,
        minLuminance: 1.0,
        maxContentLightLevel: 2.1,
        maxFrameAverageLightLevel: 2.1,
      };
      taskpoolTest(pixelMap);
      if (pixelMap != undefined) {
        pixelMap.setMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA, staticMetadata).then(() => {
          console.info('Succeeded in setting pixelMap metadata.');
          expect().assertFail();
          done();
        }).catch(async (error: BusinessError) => {
          console.error(`Failed to set the metadata.code ${error.code},message is ${error.message}`);
          expect(Number(error) == 501).assertTrue();
          await pixelMap.release();
          done();
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2600
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      if (pixelMap != undefined) {
        pixelMap.applyColorSpace(targetColorSpace, (error: BusinessError) => {
          if (error) {
            console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
            expect().assertFail();
            done();
          } else {
            console.info('Succeeded in applying color space for pixelmap object.');
            pixelMap.release();
            done();
          }
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2700
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      if (pixelMap != undefined) {
        pixelMap.applyColorSpace(targetColorSpace).then(async () => {
          console.info('Succeeded in applying color space for pixelmap object.');
          await pixelMap.release();
          done();
        }).catch((error: BusinessError) => {
          console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
          expect().assertFail();
          done();
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2800
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        pixelMap.applyColorSpace(null, (error: BusinessError) => {
          if (error) {
            console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
            expect(Number(error) == 62980115).assertTrue();
            pixelMap.release();
            done();
          } else {
            console.info('Succeeded in applying color space for pixelmap object.');
            expect().assertFail();
            done();
          }
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2900
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        pixelMap.applyColorSpace(null).then(() => {
          console.info('Succeeded in applying color space for pixelmap object.');
          expect().assertFail();
          done();
        }).catch(async (error: BusinessError) => {
          console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
          expect(Number(error) == 62980115).assertTrue();
          await pixelMap.release();
          done();
        })
      }
    });

    /**
     * @tc.name    readPixelsToBufferSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_readPixelsToBufferSync_0100
     * @tc.desc    Test readPixelsToBufferSync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('readPixelsToBufferSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data readPixelsToBufferSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        const srcBuffer: ArrayBuffer = new ArrayBuffer(pixelMap.getPixelBytesNumber());
        taskpoolTest(pixelMap);
        try {
          pixelMap.readPixelsToBufferSync(srcBuffer);
          console.info(msgStr + ' readPixelsToBufferSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} readPixelsToBufferSync failed: ${err.code}`);
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} readPixelsToBufferSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    readPixelsSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_readPixelsSync_0100
     * @tc.desc    Test readPixelsSync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('readPixelsSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data readPixelsSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
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
          console.info(msgStr + ' readPixelsSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} readPixelsSync failed: ${err.code}`);
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} readPixelsSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    writePixelsSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_writePixelsSync_0100
     * @tc.desc    Test writePixelsSync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('writePixelsSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data writePixelsSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
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
          pixelMap.writePixelsSync(area);
          console.info(msgStr + ' writePixelsSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} writePixelsSync failed: ${err.code}`);
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} writePixelsSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    writeBufferToPixels_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_writeBufferToPixels_0100
     * @tc.desc    Test writeBufferToPixels throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('writeBufferToPixels_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data writeBufferToPixels_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          const buffer: ArrayBuffer = new ArrayBuffer(96);
          await pixelMap.writeBufferToPixels(buffer);
          console.info(msgStr + ' writeBufferToPixels success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} writeBufferToPixels failed: ${err}`);
          console.error(`${msgStr} writeBufferToPixels failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} writeBufferToPixels_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name    getImageInfoSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_getImageInfoSync_0100
     * @tc.desc    Test getImageInfoSync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getImageInfoSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data getImageInfoSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.getImageInfoSync();
          console.info(msgStr + ' getImageInfoSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} getImageInfoSync failed: ${err}`);
          console.error(`${msgStr} getImageInfoSync failed: ${err.code}`);
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} getImageInfoSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name    opacitySync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_opacitySync_0100
     * @tc.desc    Test opacitySync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('opacitySync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data opacitySync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.opacitySync(1.0);
          console.info(msgStr + ' opacitySync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} opacitySync failed: ${err}`);
          console.error(`${msgStr} opacitySync failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} opacitySync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    createAlphaPixelmapSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_createAlphaPixelmapSync_0100
     * @tc.desc    Test createAlphaPixelmapSync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createAlphaPixelmapSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data createAlphaPixelmapSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.createAlphaPixelmapSync();
          console.info(msgStr + ' createAlphaPixelmapSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} createAlphaPixelmapSync failed: ${err}`);
          console.error(`${msgStr} createAlphaPixelmapSync failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} createAlphaPixelmapSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    scaleSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_scaleSync_0100
     * @tc.desc    Test scaleSync(x, y) throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('scaleSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data scaleSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.scaleSync(1, 2);
          console.info(msgStr + ' scaleSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} scaleSync failed: ${err}`);
          console.error(`${msgStr} scaleSync failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} scaleSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    scale_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_scale_0100
     * @tc.desc    Test scale throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('scale_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data scale_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          await pixelMap.scale(1, 2, 0);
          console.info(msgStr + ' scale success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} scale failed: ${err}`);
          console.error(`${msgStr} scale failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} scale_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    scaleSync_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_scaleSync_0200
     * @tc.desc    Test scaleSync(x, y, level) throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('scaleSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data scaleSync_0200 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.scaleSync(1, 2, 0);
          console.info(msgStr + ' scaleSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} scaleSync failed: ${err}`);
          console.error(`${msgStr} scaleSync failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} scaleSync_0200 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    createScaledPixelMap_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_createScaledPixelMap_0100
     * @tc.desc    Test createScaledPixelMap throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createScaledPixelMap_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data createScaledPixelMap_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          await pixelMap.createScaledPixelMap(1, 2, 0);
          console.info(msgStr + ' createScaledPixelMap success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} createScaledPixelMap failed: ${err}`);
          console.error(`${msgStr} createScaledPixelMap failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} createScaledPixelMap_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    createScaledPixelMapSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_createScaledPixelMapSync_0100
     * @tc.desc    Test createScaledPixelMapSync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createScaledPixelMapSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data createScaledPixelMapSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.createScaledPixelMapSync(1, 2, 0);
          console.info(msgStr + ' createScaledPixelMapSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} createScaledPixelMapSync failed: ${err}`);
          console.error(`${msgStr} createScaledPixelMapSync failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} createScaledPixelMapSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    translateSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_translateSync_0100
     * @tc.desc    Test translateSync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('translateSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data translateSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.translateSync(1, 2);
          console.info(msgStr + ' translateSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} translateSync failed: ${err}`);
          console.error(`${msgStr} translateSync failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} translateSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    rotateSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_rotateSync_0100
     * @tc.desc    Test rotateSync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('rotateSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data rotateSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.rotateSync(50);
          console.info(msgStr + ' rotateSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} rotateSync failed: ${err}`);
          console.error(`${msgStr} rotateSync failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} rotateSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    flipSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_flipSync_0100
     * @tc.desc    Test flipSync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('flipSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data flipSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.flipSync(true, false);
          console.info(msgStr + ' flipSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} flipSync failed: ${err}`);
          console.error(`${msgStr} flipSync failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} flipSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    cropSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_cropSync_0100
     * @tc.desc    Test cropSync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('cropSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data cropSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
          pixelMap.cropSync(region);
          console.info(msgStr + ' cropSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} cropSync failed: ${err}`);
          console.error(`${msgStr} cropSync failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} cropSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    cloneSync_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_cloneSync_0100
     * @tc.desc    Test cloneSync throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('cloneSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data cloneSync_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.cloneSync();
          console.info(msgStr + ' cloneSync success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} cloneSync failed: ${err}`);
          console.error(`${msgStr} cloneSync failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} cloneSync_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    clone_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_clone_0100
     * @tc.desc    Test clone throws error 501 when pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('clone_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const msgStr = 'www data clone_0100 ';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          await pixelMap.clone();
          console.info(msgStr + ' clone success');
          expect().assertFail();
        } catch(err) {
          console.error(`${msgStr} clone failed: ${err}`);
          console.error(`${msgStr} clone failed: ${err.code}`, typeof(err.code));
          expect(Number(err.code)).assertEqual(501);
        }
        done();
      } catch (error) {
        console.error(`${msgStr} clone_0100 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getMetadata_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_getMetadata_0100
     * @tc.desc    Test getMetadata throws error 62980173 for a non-DMA pixelMap
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it("getMetadata_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      console.info('www data is true ' + pixelMap.isStrideAlignment);
      try {
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('Succeeded to getMetaData');
        expect().assertFail();
        done();
      } catch(err){
        console.error(`www data Failed to getMetaData. code is ${err.code}, message is ${err.message}`);
        expect(Number(err.code)).assertEqual(62980173);
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name    getMetadata_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_getMetadata_0200
     * @tc.desc    Test getMetadata throws error 501 when DMA pixelMap is transferred to taskpool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it("getMetadata_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
      };
      console.info('www data Succeeded to getMetaData', 111);
      let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
      taskpoolTest(pixelMap);
      try {
        console.info('www data Succeeded to getMetaData', 222);
        pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('www data Succeeded to getMetaData', 333);
        expect().assertFail();
        done();
      } catch(err){
        console.error(`www data Failed to getMetaData. code is ${err.code}, message is ${err.message}`);
        expect(Number(err.code)).assertEqual(501);
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name    getMetadata_0300
     * @tc.number  SUB_GRAPHIC_PixelMap_getMetadata_0300
     * @tc.desc    Test getMetadata throws error 62980302 for a DMA pixelMap with RGBA_8888 format
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it("getMetadata_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
      };
      console.info('www data Succeeded to getMetaData', 111);
      let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
      try {
        console.info('www data Succeeded to getMetaData', 222);
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('www data Succeeded to getMetaData', 333);
        expect().assertFail();
        done();
      } catch(err){
        console.error(`www data Failed to getMetaData. code is ${err.code}, message is ${err.message}`);
        expect(Number(err.code)).assertEqual(62980302);
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name    getMetadata_0400
     * @tc.number  SUB_GRAPHIC_PixelMap_getMetadata_0400
     * @tc.desc    Test getMetadata throws error 62980302 for a DMA pixelMap with BGRA_8888 format
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it("getMetadata_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
      };
      console.info('www data Succeeded to getMetaData', 111);
      let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
      try {
        console.info('www data Succeeded to getMetaData', 222);
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('www data Succeeded to getMetaData', 333);
        expect().assertFail();
        done();
      } catch(err){
        console.error(`www data Failed to getMetaData. code is ${err.code}, message is ${err.message}`);
        expect(Number(err.code)).assertEqual(62980302);
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name    testConvertToPixelMap_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_testConvertToPixelMap_0100
     * @tc.desc    Test sendableImage.convertToPixelMap throws error 62980104 with null input
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it("testConvertToPixelMap_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        console.info('www data Succeeded to getMetaData', 222);
        let pixelMap = sendableImage.convertToPixelMap(null as ESObject);
        console.info('www data Succeeded to getMetaData', 333);
        expect().assertFail();
        done();
      } catch(err){
        console.error(`www data Failed to getMetaData. code is ${err.code}, message is ${err.message}`);
        console.error(`www data Failed to getMetaData. code is ${err.code}`, typeof(err.code));
        expect(Number(err.code)).assertEqual(62980104);
        done();
      }
    });

    /**
     * @tc.name    testConvertToPixelMap_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_testConvertToPixelMap_0200
     * @tc.desc    Test sendableImage.convertToPixelMap throws error 62980104 with undefined input
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it("testConvertToPixelMap_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        console.info('www data Succeeded to getMetaData', 222);
        let pixelMap = sendableImage.convertToPixelMap(undefined as ESObject);
        console.info('www data Succeeded to getMetaData', 333);
        expect().assertFail();
        done();
      } catch(err){
        console.error(`www data Failed to getMetaData. code is ${err.code}, message is ${err.message}`);
        console.error(`www data Failed to getMetaData. code is ${err.code}`, typeof(err.code));
        expect(Number(err.code)).assertEqual(62980104);
        done();
      }
    });
    
  })
}