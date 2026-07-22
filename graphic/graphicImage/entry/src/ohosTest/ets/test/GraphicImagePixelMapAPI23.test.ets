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

export default function graphicImagePixelMapAPI23() {
  describe('graphicImagePixelMapAPI23', ()=> {
    console.log('describe graphicImagePixelMapAPI23 start!!!')
    beforeAll(async ()=> {
    })

    /**
     * @tc.name   graphicImagePixelMapAPI23_0100
     * @tc.number graphicImagePixelMapAPI23_0100
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      image.createPixelMapFromSurfaceWithTransformation('111111', true)
      .then((pixelMap: image.PixelMap) => {
        console.info('www data graphicImagePixelMapAPI23_0100 PixelMap created successfully.');
        expect().assertFail();
        done();
      }).catch((e: Error) => {
        console.error(`www data graphicImagePixelMapAPI23_0100 Failed to create PixelMap. Code: ${e}`);
        expect(Number(e) == 7600104).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   graphicImagePixelMapAPI23_0200
     * @tc.number graphicImagePixelMapAPI23_0200
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      image.createPixelMapFromSurfaceWithTransformation(null, true)
      .then((pixelMap: image.PixelMap) => {
        console.info('www data graphicImagePixelMapAPI23_0200 PixelMap created successfully.');
        expect().assertFail();
        done();
      }).catch((e: Error) => {
        console.error(`www data graphicImagePixelMapAPI23_0200 Failed to create PixelMap. Code: ${e}`);
        expect(Number(e) == 7600206).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   graphicImagePixelMapAPI23_0300
     * @tc.number graphicImagePixelMapAPI23_0300
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      image.createPixelMapFromSurfaceWithTransformation('', true)
      .then((pixelMap: image.PixelMap) => {
        console.info('www data graphicImagePixelMapAPI23_0300 PixelMap created successfully.');
        expect().assertFail();
        done();
      }).catch((e: Error) => {
        console.error(`www data graphicImagePixelMapAPI23_0300 Failed to create PixelMap. Code: ${e}`);
        expect(Number(e) == 7600206).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   graphicImagePixelMapAPI23_0400
     * @tc.number graphicImagePixelMapAPI23_0400
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformationSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        const pixelMap: image.PixelMap = image.createPixelMapFromSurfaceWithTransformationSync('111111', true);
        console.info('www data graphicImagePixelMapAPI23_0400 PixelMap created successfully.');
        expect().assertFail();
        done();
      } catch (e) {
        const error = e as BusinessError;
        console.error(`www data graphicImagePixelMapAPI23_0400 Failed to create PixelMap. 
        Code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code) == 7600104).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   graphicImagePixelMapAPI23_0500
     * @tc.number graphicImagePixelMapAPI23_0500
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformationSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        const pixelMap: image.PixelMap = image.createPixelMapFromSurfaceWithTransformationSync(null, true);
        console.info('www data graphicImagePixelMapAPI23_0500 PixelMap created successfully.');
        expect().assertFail();
        done();
      } catch (e) {
        const error = e as BusinessError;
        console.error(`www data graphicImagePixelMapAPI23_0500 Failed to create PixelMap. 
        Code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code) == 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   graphicImagePixelMapAPI23_0600
     * @tc.number graphicImagePixelMapAPI23_0600
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformationSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        const pixelMap: image.PixelMap = image.createPixelMapFromSurfaceWithTransformationSync('', true);
        console.info('www data graphicImagePixelMapAPI23_0600 PixelMap created successfully.');
        expect().assertFail();
        done();
      } catch (e) {
        const error = e as BusinessError;
        console.error(`www data graphicImagePixelMapAPI23_0600 Failed to create PixelMap. 
        Code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code) == 7600206).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.name    testCreatePixelMapFromSurfaceSyncNull
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromSurfaceSync_Null
     * @tc.desc    createPixelMapFromSurfaceSync test null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapFromSurfaceSyncNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data testCreatePixelMapFromSurfaceSyncNull';
        try {
          const surfaceId = "testSurfaceSync001";
          const region: image.Region = { x: 0, y: 0, size: { width: 100, height: 100 } };
          const pixelMap = image.createPixelMapFromSurfaceSync(surfaceId, null);
          console.info(`${msgStr} success`, pixelMap);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error code: ${err.code}`);
          expect(err.code == 401).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    testCreatePixelMapFromSurfaceSyncUndefined
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromSurfaceSync_Undefined
     * @tc.desc    createPixelMapFromSurfaceSync test undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapFromSurfaceSyncUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data testCreatePixelMapFromSurfaceSyncUndefined';
        try {
          const surfaceId = "testSurfaceSync001";
          const region: image.Region = { x: 0, y: 0, size: { width: 100, height: 100 } };
          const pixelMap = image.createPixelMapFromSurfaceSync(surfaceId, undefined);
          console.info(`${msgStr} success`, pixelMap);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error code: ${err.code}`);
          expect(err.code == 401).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    testCreatePixelMapFromSurfaceNull
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromSurface_Null
     * @tc.desc    createPixelMapFromSurface test null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapFromSurfaceNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data testCreatePixelMapFromSurfaceNull';
        try {
          const surfaceId = "testSurfaceSync001";
          const region: image.Region = { x: 0, y: 0, size: { width: 100, height: 100 } };
          const pixelMap = await image.createPixelMapFromSurface(surfaceId, null);
          console.info(`${msgStr} success`, pixelMap);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error code: ${err.code}`);
          expect(err.code == 62980105).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    testCreatePixelMapFromSurfaceUndefined
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromSurface_Undefined
     * @tc.desc    createPixelMapFromSurface test undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapFromSurfaceUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data testCreatePixelMapFromSurfaceUndefined';
        try {
          const surfaceId = "testSurfaceSync001";
          const region: image.Region = { x: 0, y: 0, size: { width: 100, height: 100 } };
          const pixelMap = await image.createPixelMapFromSurface(surfaceId, undefined);
          console.info(`${msgStr} success`, pixelMap);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error code: ${err.code}`);
          expect(err.code == 62980105).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    testCreateCroppedAndScaledPixelMapNull
     * @tc.number  SUB_GRAPHIC_Image_createCroppedAndScaledPixelMap_Null
     * @tc.desc    createCroppedAndScaledPixelMap test null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreateCroppedAndScaledPixelMapNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msgStr = 'www data testCreateCroppedAndScaledPixelMapNull';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        try {
          console.info(msgStr + ' pass');
          await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, null);
          console.info(msgStr + ' pass', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
        }catch(err){
          console.info(msgStr + ' error', JSON.stringify(err));
          expect(err.code == '7600201').assertTrue();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    testCreateCroppedAndScaledPixelMapUndefined
     * @tc.number  SUB_GRAPHIC_Image_createCroppedAndScaledPixelMap_undefined
     * @tc.desc    createCroppedAndScaledPixelMap test undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreateCroppedAndScaledPixelMapUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testCreateCroppedAndScaledPixelMapUndefined';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        try {
          console.info(msgStr + ' pass');
          await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, undefined);
          console.info(msgStr + ' pass', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
        }catch(err){
          console.info(msgStr + ' error', JSON.stringify(err));
          expect(err.code == '7600201').assertTrue();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    testCreateCroppedAndScaledPixelMapSyncNull
     * @tc.number  SUB_GRAPHIC_Image_createCroppedAndScaledPixelMapSync_Null
     * @tc.desc    createCroppedAndScaledPixelMapSync test null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreateCroppedAndScaledPixelMapSyncNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testCreateCroppedAndScaledPixelMapSyncNull';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        try {
          console.info(msgStr + ' pass');
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10, null);
          console.info(msgStr + ' pass', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
        }catch(err){
          console.info(msgStr + ' error', JSON.stringify(err));
          expect(err.code == '7600201').assertTrue();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    testCreateCroppedAndScaledPixelMapSyncUndefined
     * @tc.number  SUB_GRAPHIC_Image_createCroppedAndScaledPixelMapSync_undefined
     * @tc.desc    createCroppedAndScaledPixelMapSync test undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreateCroppedAndScaledPixelMapSyncUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testCreateCroppedAndScaledPixelMapSyncUndefined';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        try {
          console.info(msgStr + ' pass');
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10, undefined);
          console.info(msgStr + ' pass', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
        }catch(err){
          console.info(msgStr + ' error', JSON.stringify(err));
          expect(err.code == '7600201').assertTrue();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    testCreatePixelMapUsingAllocatorSyncNull
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocatorSync_Null
     * @tc.desc    createPixelMapUsingAllocatorSync test null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapUsingAllocatorSyncNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testCreatePixelMapUsingAllocatorSyncNull';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, null);
          console.info(msgStr + ' pass', pixelMap.isEditable, pixelMap.isStrideAlignment);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(msgStr + ' error', JSON.stringify(err));
          expect(err.code == 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    testCreatePixelMapUsingAllocatorSyncUndefined
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocatorSync_Undefined
     * @tc.desc    createPixelMapUsingAllocatorSync test undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapUsingAllocatorSyncUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testCreatePixelMapUsingAllocatorSyncUndefined';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, undefined);
          console.info(msgStr + ' pass', pixelMap.isEditable, pixelMap.isStrideAlignment);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(msgStr + ' error', JSON.stringify(err));
          expect(err.code == 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    testCreatePixelMapUsingAllocatorNull
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocator_Null
     * @tc.desc    createPixelMapUsingAllocator test null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapUsingAllocatorNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testCreatePixelMapUsingAllocatorNull';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, null);
          console.info(msgStr + ' pass', pixelMap.isEditable, pixelMap.isStrideAlignment);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(msgStr + ' error', JSON.stringify(err));
          expect(err.code == 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    testCreatePixelMapUsingAllocatorUndefined
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocator_Undefined
     * @tc.desc    createPixelMapUsingAllocator test undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapUsingAllocatorUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testCreatePixelMapUsingAllocatorUndefined';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, undefined);
          console.info(msgStr + ' pass', pixelMap.isEditable, pixelMap.isStrideAlignment);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(msgStr + ' error', JSON.stringify(err));
          expect(err.code == 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    testCreatePixelMapSyncNull
     * @tc.number  SUB_GRAPHIC_Image_CreatePixelMapSync_Null
     * @tc.desc    createPixelMapSync test null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapSyncNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testCreatePixelMapSyncNull';
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            pixelMap!.createScaledPixelMapSync(scaleX, scaleY, null);
            console.info(msgStr + ' pass ', pixelMap.isEditable, pixelMap.isStrideAlignment);
            expect().assertFail();
          } catch (err) {
            console.info(msgStr + ' error ', err.code);
            expect(err.code == 401).assertTrue();
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    testCreatePixelMapSyncUndefined
     * @tc.number  SUB_GRAPHIC_Image_CreatePixelMapSync_Undefined
     * @tc.desc    createPixelMapSync test Undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapSyncUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testCreatePixelMapSyncUndefined';
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            pixelMap!.createScaledPixelMapSync(scaleX, scaleY, undefined);
            console.info(msgStr + ' pass ', pixelMap.isEditable, pixelMap.isStrideAlignment);
            expect().assertFail();
          } catch (err) {
            console.info(msgStr + ' error ', err.code);
            expect(err.code == 401).assertTrue();
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    testCreatePixelMapNull
     * @tc.number  SUB_GRAPHIC_Image_CreatePixelMap_Null
     * @tc.desc    createPixelMap test null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testCreatePixelMapNull';
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            await pixelMap!.createScaledPixelMap(scaleX, scaleY, null);
            console.info(msgStr + ' pass ', pixelMap.isEditable, pixelMap.isStrideAlignment);
            expect().assertFail();
          } catch (err) {
            console.info(msgStr + ' error ', err.code);
            expect(err.code == 401).assertTrue();
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    testCreatePixelMapUndefined
     * @tc.number  SUB_GRAPHIC_Image_CreatePixelMap_Undefined
     * @tc.desc    createPixelMap test Undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testCreatePixelMapUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testCreatePixelMapUndefined';
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            await pixelMap!.createScaledPixelMap(scaleX, scaleY, undefined);
            console.info(msgStr + ' pass ', pixelMap.isEditable, pixelMap.isStrideAlignment);
            expect().assertFail();
          } catch (err) {
            console.info(msgStr + ' error ', err.code);
            expect(err.code == 401).assertTrue();
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   testSetMemoryNameSyncUndefined
     * @tc.number SUB_GRAPHIC_Image_setMemoryNameSync_Undefined
     * @tc.desc   image pixelMap setMemoryNameSync undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSetMemoryNameSyncUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr = 'www data testSetMemoryNameSyncUndefined';
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        pixelMap.setMemoryNameSync(undefined);
        console.info(msgStr + ' Succeeded to setMemoryNameSync');
        expect().assertFail();
        done();
      } catch(error){
        console.error(msgStr + ` Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name    testScaleNull
     * @tc.number  SUB_GRAPHIC_Image_PixelMap_Scale_Null
     * @tc.desc    pixelMap test scale null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testScaleNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testScaleNull';
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            await pixelMap!.scale(scaleX, scaleY, null);
            console.info(msgStr + ' pass ', pixelMap.isEditable, pixelMap.isStrideAlignment);
            expect().assertFail();
          } catch (err) {
            console.info(msgStr + ' error ', err);
            expect(err == 62980115).assertTrue();
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   testScaleUndefined
     * @tc.number SUB_GRAPHIC_Image_PixelMap_Scale_Undefined
     * @tc.desc   pixelMap test scale undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testScaleUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr = 'www data testScaleUndefined';
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        await pixelMap!.scale(scaleX, scaleY, undefined);
        console.info(msgStr + ' Succeeded ');
        expect().assertFail();
        done();
      } catch(error){
        console.error(msgStr + ` Failed to getMetaData. code is ${error}`);
        expect(error == 62980115).assertTrue();
        await pixelMap.release();
        done();
      }
    });

    /**
     * @tc.name    testScaleSyncNull
     * @tc.number  SUB_GRAPHIC_Image_PixelMap_ScaleSync_Null
     * @tc.desc    pixelMap test scaleSync null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testScaleSyncNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testScaleSyncNull';
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            pixelMap!.scaleSync(scaleX, scaleY, null);
            console.info(msgStr + ' pass ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          } catch (err) {
            console.info(msgStr + ' error ', err);
            expect().assertFail();
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   testScaleSyncUndefined
     * @tc.number SUB_GRAPHIC_Image_PixelMap_ScaleSync_Undefined
     * @tc.desc   pixelMap test scaleSync undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testScaleSyncUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr = 'www data testScaleSyncUndefined';
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        pixelMap!.scaleSync(scaleX, scaleY, undefined);
        console.info(msgStr + ' Succeeded ');
        await pixelMap.release();
        done();
      } catch(error){
        console.error(msgStr + ` Failed to getMetaData. code is ${error}`);
        await pixelMap.release();
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testConvertPixelFormatNull
     * @tc.number SUB_GRAPHIC_image_convertPixelFormat_Null_0100
     * @tc.desc   createPixelMap null format Promise success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertPixelFormatNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data testConvertPixelFormatNull ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapSync(buffer, opts);
        try {
          await pixelMap.convertPixelFormat(null);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.error(msgStr + 'failed', error);
          expect(error).assertEqual(62980115);
          done();
        }
      })

    /**
     * @tc.name   testConvertPixelFormatUndefined
     * @tc.number SUB_GRAPHIC_image_convertPixelFormat_Undefined_0100
     * @tc.desc   createPixelMap undefined format Promise success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertPixelFormatUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data testConvertPixelFormatUndefined ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapSync(buffer, opts);
        try {
          await pixelMap.convertPixelFormat(undefined);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.error(msgStr + 'failed', error);
          expect(error).assertEqual(62980115);
          done();
        }
      })

    /**
     * @tc.name   testGetMetadataNull
     * @tc.number SUB_GRAPHIC_image_getMetadata_null_0100
     * @tc.desc   image pixelMap getMetadata null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMetadataNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr = 'www data testGetMetadataNull';
      const opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: { height: 100, width: 100 }
      }
      let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
      if (pixelMap != undefined) {
        console.info(msgStr + ' Succeeded in creating pixelMap object.');
        try {
          let staticMetadata = pixelMap.getMetadata(null);
          console.info(msgStr + ' getMetadata success', staticMetadata);
          expect().assertFail();
        } catch(error) {
          console.info(msgStr + 'pixelMap create failed ' + error.code);
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
     * @tc.name   testGetMetadataUndefined
     * @tc.number SUB_GRAPHIC_image_getMetadata_undefined_0100
     * @tc.desc   image pixelMap getMetadata undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMetadataUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr = 'www data testGetMetadataUndefined';
      const opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: { height: 100, width: 100 }
      }
      let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
      if (pixelMap != undefined) {
        console.info(msgStr + ' Succeeded in creating pixelMap object.');
        try {
          let staticMetadata = pixelMap.getMetadata(undefined);
          console.info(msgStr + ' getMetadata success', staticMetadata);
          expect().assertFail();
        } catch(error) {
          console.info(msgStr + 'pixelMap create failed ' + error.code);
          expect(Number(error.code) == 62980173).assertTrue();
          await pixelMap.release();
          done();
        }
      } else {
        console.info('www data Failed to create pixelMap.');
        done();
      }
    });

  })
}