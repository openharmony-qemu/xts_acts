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
import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';
import rpc from '@ohos.rpc';

const LOG_PREFIX: string = "www data ";

export default function GraphicImageCreatePixelMap05() {
  describe('GraphicImageCreatePixelMap05', ()=> {
    console.log('describe GraphicImageCreatePixelMap05 start!!!')
    beforeAll(async ()=> {
    })

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0100
     * @tc.number  GraphicImageCreatePixelMap05_0100
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0100 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap: image.PixelMap = await image.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0200
     * @tc.number  GraphicImageCreatePixelMap05_0200
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0200 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        image.createPixelMap(color, opts, (error: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
          if(error) {
            console.error(msgStr + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(msgStr + 'Succeeded in creating pixelmap.');
            pixelMap?.release();
            done();
          }
        })
      })

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0300
     * @tc.number  GraphicImageCreatePixelMap05_0300
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it("GraphicImageCreatePixelMap05_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msgStr = 'www data GraphicImageCreatePixelMap05_0300 ';
      try {
        image.createPixelMapUsingAllocatorSync(null, image.AllocatorType.AUTO)
        expect().assertFail();
        done();
      } catch(error){
        console.error(msgStr + `Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0400
     * @tc.number  GraphicImageCreatePixelMap05_0400
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it("GraphicImageCreatePixelMap05_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0400 ';
        try {
          image.createPixelMapUsingAllocatorSync(undefined, image.AllocatorType.AUTO)
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `wFailed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect(Number(error.code) === 7600201).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0500
     * @tc.number  GraphicImageCreatePixelMap05_0500
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0500 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createPremultipliedPixelMap(dstPixelMap, null);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0600
     * @tc.number  GraphicImageCreatePixelMap05_0600
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0600 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createPremultipliedPixelMap(dstPixelMap, undefined);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0700
     * @tc.number  GraphicImageCreatePixelMap05_0700
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0700 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createUnpremultipliedPixelMap(dstPixelMap, null);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0800
     * @tc.number  GraphicImageCreatePixelMap05_0800
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0800 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createUnpremultipliedPixelMap(dstPixelMap, undefined);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0900
     * @tc.number  GraphicImageCreatePixelMap05_0900
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0900 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createUnpremultipliedPixelMap(undefined, dstPixelMap);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_1000
     * @tc.number  GraphicImageCreatePixelMap05_1000
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_1000 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createUnpremultipliedPixelMap(null, dstPixelMap);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_1100
     * @tc.number  GraphicImageCreatePixelMap05_1100
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateSync001: Starting translateSync test.`);
        pixelMap.translateSync(null, 40);
        pixelMap.translateSync(undefined, 40);
        pixelMap.translateSync(30, null);
        pixelMap.translateSync(30, undefined);
        console.info(`${LOG_PREFIX} translateSync001: Succeeded in translating.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} translateSync001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_1200
     * @tc.number  GraphicImageCreatePixelMap05_1200
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
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
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap.setMetadata(null, staticMetadata);
          console.info(`${LOG_PREFIX} GraphicImageCreatePixelMap05_1200: Starting setMetadata test 11.`);
        } catch(err){
          console.info(`${LOG_PREFIX} GraphicImageCreatePixelMap05_1200: Starting setMetadata error 11.`, err);
          expect(err).assertEqual(62980173);
        }
        try {
          await pixelMap.setMetadata(undefined, staticMetadata);
          console.info(`${LOG_PREFIX} translateSync001: Starting translateSync test 22.`);
        } catch(err){
          console.info(`${LOG_PREFIX} GraphicImageCreatePixelMap05_1200: Starting setMetadata error 22.`, err);
          expect(err).assertEqual(62980173);
        }
        try {
          await pixelMap.setMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE, null);
          console.info(`${LOG_PREFIX} translateSync001: Starting translateSync test 33.`);
        } catch(err){
          console.info(`${LOG_PREFIX} GraphicImageCreatePixelMap05_1200: Starting setMetadata error 33.`, err);
          expect(err).assertEqual(62980173);
        }
        try {
          await pixelMap.setMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE, undefined);
          console.info(`${LOG_PREFIX} translateSync001: Starting translateSync test 44.`);
        } catch(err){
          console.info(`${LOG_PREFIX} GraphicImageCreatePixelMap05_1200: Starting setMetadata error 44.`, err);
          expect(err).assertEqual(62980173);
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    GraphicImageCreatePixelMap05_1300
     * @tc.number  GraphicImageCreatePixelMap05_1300
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
          console.info('www data GraphicImageCreatePixelMap05_1300 pass',
            pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertTrue();
        }catch(err){
          console.info('www data GraphicImageCreatePixelMap05_1300 error', JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.NONE);
          console.info('www data GraphicImageCreatePixelMap05_1300 pass',
            pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertTrue();
        }catch(err){
          console.info('www data GraphicImageCreatePixelMap05_1300 error', JSON.stringify(err));
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    GraphicImageCreatePixelMap05_1400
     * @tc.number  GraphicImageCreatePixelMap05_1400
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapSync(color, opts);
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
          console.info('www data GraphicImageCreatePixelMap05_1400 pass',
            pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
        }catch(err){
          console.info('www data GraphicImageCreatePixelMap05_1400 error', JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.NONE);
          console.info('www data GraphicImageCreatePixelMap05_1300 pass',
            pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
        }catch(err){
          console.info('www data GraphicImageCreatePixelMap05_1300 error', JSON.stringify(err));
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    getRectsForRange_InvalidWidthStyle_001
     * @tc.number  SUB_GRAPHIC_Paragraph_getRectsForRange_InvalidWidthStyle_001
     * @tc.desc    Test getRectsForRange with invalid widthStyle (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getRectsForRange_InvalidWidthStyle_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          const range: text.Range = { start: 0, end: 1 };
          let rects = paragraph.getRectsForRange(range, -1, text.RectHeightStyle.TIGHT);
          console.info('www data getRectsForRange_InvalidWidthStyle_001 success ', JSON.stringify(rects));
          expect(rects[0].rect.bottom).assertEqual(23);
          expect(rects[0].direction).assertEqual(text.TextDirection.LTR);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getRectsForRange_InvalidWidthStyle_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    getRectsForRange_InvalidWidthStyle_002
     * @tc.number  SUB_GRAPHIC_Paragraph_getRectsForRange_InvalidWidthStyle_002
     * @tc.desc    Test getRectsForRange with invalid widthStyle (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getRectsForRange_InvalidWidthStyle_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          const range: text.Range = { start: 0, end: 1 };
          let rects = paragraph.getRectsForRange(range, 9999, text.RectHeightStyle.TIGHT);
          console.info('www data getRectsForRange_InvalidWidthStyle_002 success ', JSON.stringify(rects));
          expect(rects[0].rect.bottom).assertEqual(23);
          expect(rects[0].direction).assertEqual(text.TextDirection.LTR);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getRectsForRange_InvalidWidthStyle_002 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    getRectsForRange_InvalidHeightStyle_001
     * @tc.number  SUB_GRAPHIC_Paragraph_getRectsForRange_InvalidHeightStyle_001
     * @tc.desc    Test getRectsForRange with invalid heightStyle (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getRectsForRange_InvalidHeightStyle_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          const range: text.Range = { start: 0, end: 1 };
          let rects = paragraph.getRectsForRange(range, text.RectWidthStyle.TIGHT, -1);
          console.info('www data getRectsForRange_InvalidHeightStyle_001 success ', JSON.stringify(rects));
          expect(rects[0].rect.bottom).assertEqual(23);
          expect(rects[0].direction).assertEqual(text.TextDirection.LTR);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getRectsForRange_InvalidHeightStyle_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    getRectsForRange_InvalidHeightStyle_002
     * @tc.number  SUB_GRAPHIC_Paragraph_getRectsForRange_InvalidHeightStyle_002
     * @tc.desc    Test getRectsForRange with invalid heightStyle (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getRectsForRange_InvalidHeightStyle_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          const range: text.Range = { start: 0, end: 1 };
          let rects = paragraph.getRectsForRange(range, text.RectWidthStyle.TIGHT, 9999);
          console.info('www data getRectsForRange_InvalidHeightStyle_002 success ', JSON.stringify(rects));
          expect(rects[0].rect.bottom).assertEqual(23);
          expect(rects[0].direction).assertEqual(text.TextDirection.LTR);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getRectsForRange_InvalidHeightStyle_002 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    addPlaceholder_InvalidAlign_001
     * @tc.number  SUB_GRAPHIC_ParagraphBuilder_addPlaceholder_InvalidAlign_001
     * @tc.desc    Test addPlaceholder with invalid align (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('addPlaceholder_InvalidAlign_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          paragraphBuilder.addPlaceholder({
            width: 50,
            height: 50,
            align: -1,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 0
          });
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          console.info('www data addPlaceholder_InvalidAlign_001 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data addPlaceholder_InvalidAlign_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    addPlaceholder_InvalidAlign_002
     * @tc.number  SUB_GRAPHIC_ParagraphBuilder_addPlaceholder_InvalidAlign_002
     * @tc.desc    Test addPlaceholder with invalid align (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('addPlaceholder_InvalidAlign_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          paragraphBuilder.addPlaceholder({
            width: 50,
            height: 50,
            align: 9999,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 0
          });
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          console.info('www data addPlaceholder_InvalidAlign_002 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data addPlaceholder_InvalidAlign_002 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    addPlaceholder_InvalidBaseline_001
     * @tc.number  SUB_GRAPHIC_ParagraphBuilder_addPlaceholder_InvalidBaseline_001
     * @tc.desc    Test addPlaceholder with invalid baseline (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('addPlaceholder_InvalidBaseline_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          paragraphBuilder.addPlaceholder({
            width: 50,
            height: 50,
            align: text.PlaceholderAlignment.OFFSET_AT_BASELINE,
            baseline: -1,
            baselineOffset: 0
          });
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          console.info('www data addPlaceholder_InvalidBaseline_001 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data addPlaceholder_InvalidBaseline_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    addPlaceholder_InvalidBaseline_002
     * @tc.number  SUB_GRAPHIC_ParagraphBuilder_addPlaceholder_InvalidBaseline_002
     * @tc.desc    Test addPlaceholder with invalid baseline (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('addPlaceholder_InvalidBaseline_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          paragraphBuilder.addPlaceholder({
            width: 50,
            height: 50,
            align: text.PlaceholderAlignment.OFFSET_AT_BASELINE,
            baseline: 9999,
            baselineOffset: 0
          });
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          console.info('www data addPlaceholder_InvalidBaseline_002 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data addPlaceholder_InvalidBaseline_002 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    blur_InvalidTileMode_001
     * @tc.number  SUB_GRAPHIC_Filter_blur_InvalidTileMode_001
     * @tc.desc    Test blur with invalid tileMode (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('blur_InvalidTileMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
          const filter = effectKit.createEffect(pixelMap);
          filter.blur(1, -1);
          console.info('www data blur_InvalidTileMode_001 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data blur_InvalidTileMode_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    blur_InvalidTileMode_002
     * @tc.number  SUB_GRAPHIC_Filter_blur_InvalidTileMode_002
     * @tc.desc    Test blur with invalid tileMode (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('blur_InvalidTileMode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
          const filter = effectKit.createEffect(pixelMap);
          filter.blur(1, 9999);
          console.info('www data blur_InvalidTileMode_002 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data blur_InvalidTileMode_002 error ' + err.code);
          expect().assertFail();
          done();
        }
      })



    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation_InvalidParam_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromSurfaceWithTransformation_InvalidParam_001
     * @tc.desc    Test createPixelMapFromSurfaceWithTransformation with null transformEnabled
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformation_InvalidParam_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          await image.createPixelMapFromSurfaceWithTransformation("121340", null);
          console.info('www data createPixelMapFromSurfaceWithTransformation_InvalidParam_001 success ');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromSurfaceWithTransformation_InvalidParam_001 error ', err.code);
          expect(err.code == 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation_InvalidParam_002
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromSurfaceWithTransformation_InvalidParam_002
     * @tc.desc    Test createPixelMapFromSurfaceWithTransformation with undefined transformEnabled
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformation_InvalidParam_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          await image.createPixelMapFromSurfaceWithTransformation("0", undefined);
          console.info('www data createPixelMapFromSurfaceWithTransformation_InvalidParam_002 success ');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromSurfaceWithTransformation_InvalidParam_002 error ' + err.code);
          expect(err.code == 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync_InvalidParam_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromSurfaceWithTransformationSync_InvalidParam_001
     * @tc.desc    Test createPixelMapFromSurfaceWithTransformationSync with null transformEnabled
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformationSync_InvalidParam_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          image.createPixelMapFromSurfaceWithTransformationSync("0", null);
          console.info('www data createPixelMapFromSurfaceWithTransformationSync_InvalidParam_001 success ');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromSurfaceWithTransformationSync_InvalidParam_001 error ' + err.code);
          expect(err.code == 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync_InvalidParam_002
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapFromSurfaceWithTransformationSync_InvalidParam_002
     * @tc.desc    Test createPixelMapFromSurfaceWithTransformationSync with undefined transformEnabled
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformationSync_InvalidParam_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          image.createPixelMapFromSurfaceWithTransformationSync("0", undefined);
          console.info('www data createPixelMapFromSurfaceWithTransformationSync_InvalidParam_002 success ');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapFromSurfaceWithTransformationSync_InvalidParam_002 error ' + err.code);
          expect(err.code == 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    flipSync_InvalidParam_001
     * @tc.number  SUB_GRAPHIC_PixelMap_flipSync_InvalidParam_001
     * @tc.desc    Test flipSync with undefined horizontal
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('flipSync_InvalidParam_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
          pixelMap.flipSync(undefined, true);
          console.info('www data flipSync_InvalidParam_001 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data flipSync_InvalidParam_001 error ' + err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    flipSync_InvalidParam_002
     * @tc.number  SUB_GRAPHIC_PixelMap_flipSync_InvalidParam_002
     * @tc.desc    Test flipSync with undefined vertical
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('flipSync_InvalidParam_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
          pixelMap.flipSync(true, undefined);
          console.info('www data flipSync_InvalidParam_002 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data flipSync_InvalidParam_002 error ' + err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    setTransferDetached_InvalidParam_001
     * @tc.number  SUB_GRAPHIC_PixelMap_setTransferDetached_InvalidParam_001
     * @tc.desc    Test setTransferDetached with undefined detached
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('setTransferDetached_InvalidParam_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
          pixelMap.setTransferDetached(undefined);
          console.info('www data setTransferDetached_InvalidParam_001 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setTransferDetached_InvalidParam_001 error ' + err.code);
          expect(err.code == 501).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapCb_InvalidSrcPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapCb_InvalidSrcPixelFormat_001
     * @tc.desc    Test createPixelMap callback with invalid srcPixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapCb_InvalidSrcPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: -1,
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
          console.info('www data createPixelMapCb_InvalidSrcPixelFormat_001 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapCb_InvalidSrcPixelFormat_001 error ' + err);
          expect(err).assertEqual(62980096);
          done();
        }
      })

    /**
     * @tc.name    createPixelMapCb_InvalidAlphaType_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapCb_InvalidAlphaType_001
     * @tc.desc    Test createPixelMap callback with invalid alphaType (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapCb_InvalidAlphaType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: -1,
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
          console.info('www data createPixelMapCb_InvalidAlphaType_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapCb_InvalidAlphaType_001 error ' + err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapCb_InvalidScaleMode_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapCb_InvalidScaleMode_001
     * @tc.desc    Test createPixelMap callback with invalid scaleMode (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapCb_InvalidScaleMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: -1
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
          console.info('www data createPixelMapCb_InvalidScaleMode_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapCb_InvalidScaleMode_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMap_InvalidPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMap_InvalidPixelFormat_001
     * @tc.desc    Test createPixelMap promise with invalid pixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMap_InvalidPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: -1,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMap(colors, options);
          console.info('www data createPixelMap_InvalidPixelFormat_001 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMap_InvalidPixelFormat_001 error ' + err);
          expect(err).assertEqual(62980096);
          done();
        }
      })

    /**
     * @tc.name    createPixelMap_InvalidAlphaType_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMap_InvalidAlphaType_001
     * @tc.desc    Test createPixelMap promise with invalid alphaType (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMap_InvalidAlphaType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: -1,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMap(colors, options);
          console.info('www data createPixelMap_InvalidAlphaType_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMap_InvalidAlphaType_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMap_InvalidScaleMode_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMap_InvalidScaleMode_001
     * @tc.desc    Test createPixelMap promise with invalid scaleMode (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMap_InvalidScaleMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: -1
          };
          await image.createPixelMap(colors, options);
          console.info('www data createPixelMap_InvalidScaleMode_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMap_InvalidScaleMode_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSync_InvalidSrcPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSync_InvalidSrcPixelFormat_001
     * @tc.desc    Test createPixelMapSync with invalid srcPixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync_InvalidSrcPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: -1,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapSync(colors, options);
          console.info('www data createPixelMapSync_InvalidSrcPixelFormat_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapSync_InvalidSrcPixelFormat_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSync_InvalidAlphaType_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSync_InvalidAlphaType_001
     * @tc.desc    Test createPixelMapSync with invalid alphaType (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync_InvalidAlphaType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: -1,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapSync(colors, options);
          console.info('www data createPixelMapSync_InvalidAlphaType_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapSync_InvalidAlphaType_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSync_InvalidScaleMode_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSync_InvalidScaleMode_001
     * @tc.desc    Test createPixelMapSync with invalid scaleMode (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync_InvalidScaleMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: -1
          };
          image.createPixelMapSync(colors, options);
          console.info('www data createPixelMapSync_InvalidScaleMode_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapSync_InvalidScaleMode_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocator_InvalidSrcPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocator_InvalidSrcPixelFormat_001
     * @tc.desc    Test createPixelMapUsingAllocator with invalid srcPixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator_InvalidSrcPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: -1,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapUsingAllocator(colors, options);
          console.info('www data createPixelMapUsingAllocator_InvalidSrcPixelFormat_001 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapUsingAllocator_InvalidSrcPixelFormat_001 error ' + err.code);
          expect(err.code == 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocator_InvalidPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocator_InvalidPixelFormat_001
     * @tc.desc    Test createPixelMapUsingAllocator with invalid pixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator_InvalidPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: -1,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapUsingAllocator(colors, options);
          console.info('www data createPixelMapUsingAllocator_InvalidPixelFormat_001 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapUsingAllocator_InvalidPixelFormat_001 error ' + err.code);
          expect(err.code == 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocator_InvalidAlphaType_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocator_InvalidAlphaType_001
     * @tc.desc    Test createPixelMapUsingAllocator with invalid alphaType (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator_InvalidAlphaType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: -1,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          await image.createPixelMapUsingAllocator(colors, options);
          console.info('www data createPixelMapUsingAllocator_InvalidAlphaType_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapUsingAllocator_InvalidAlphaType_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocator_InvalidScaleMode_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocator_InvalidScaleMode_001
     * @tc.desc    Test createPixelMapUsingAllocator with invalid scaleMode (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator_InvalidScaleMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: -1
          };
          await image.createPixelMapUsingAllocator(colors, options);
          console.info('www data createPixelMapUsingAllocator_InvalidScaleMode_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapUsingAllocator_InvalidScaleMode_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocatorSync_InvalidSrcPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocatorSync_InvalidSrcPixelFormat_001
     * @tc.desc    Test createPixelMapUsingAllocatorSync with invalid srcPixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync_InvalidSrcPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: -1,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapUsingAllocatorSync(colors, options);
          console.info('www data createPixelMapUsingAllocatorSync_InvalidSrcPixelFormat_001 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapUsingAllocatorSync_InvalidSrcPixelFormat_001 error ' + err.code);
          expect(err.code == 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocatorSync_InvalidPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocatorSync_InvalidPixelFormat_001
     * @tc.desc    Test createPixelMapUsingAllocatorSync with invalid pixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync_InvalidPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: -1,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapUsingAllocatorSync(colors, options);
          console.info('www data createPixelMapUsingAllocatorSync_InvalidPixelFormat_001 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapUsingAllocatorSync_InvalidPixelFormat_001 error ' + err.code);
          expect(err.code == 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocatorSync_InvalidAlphaType_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocatorSync_InvalidAlphaType_001
     * @tc.desc    Test createPixelMapUsingAllocatorSync with invalid alphaType (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync_InvalidAlphaType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: -1,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapUsingAllocatorSync(colors, options);
          console.info('www data createPixelMapUsingAllocatorSync_InvalidAlphaType_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapUsingAllocatorSync_InvalidAlphaType_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapUsingAllocatorSync_InvalidScaleMode_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapUsingAllocatorSync_InvalidScaleMode_001
     * @tc.desc    Test createPixelMapUsingAllocatorSync with invalid scaleMode (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync_InvalidScaleMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const colors: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: -1
          };
          image.createPixelMapUsingAllocatorSync(colors, options);
          console.info('www data createPixelMapUsingAllocatorSync_InvalidScaleMode_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapUsingAllocatorSync_InvalidScaleMode_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSyncOpts_InvalidSrcPixelFormat_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSyncOpts_InvalidSrcPixelFormat_001
     * @tc.desc    Test createPixelMapSync(options) with invalid srcPixelFormat (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSyncOpts_InvalidSrcPixelFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: -1,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapSync(options);
          console.info('www data createPixelMapSyncOpts_InvalidSrcPixelFormat_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapSyncOpts_InvalidSrcPixelFormat_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSyncOpts_InvalidAlphaType_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSyncOpts_InvalidAlphaType_001
     * @tc.desc    Test createPixelMapSync(options) with invalid alphaType (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSyncOpts_InvalidAlphaType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: -1,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          };
          image.createPixelMapSync(options);
          console.info('www data createPixelMapSyncOpts_InvalidAlphaType_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapSyncOpts_InvalidAlphaType_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createPixelMapSyncOpts_InvalidScaleMode_001
     * @tc.number  SUB_GRAPHIC_Image_createPixelMapSyncOpts_InvalidScaleMode_001
     * @tc.desc    Test createPixelMapSync(options) with invalid scaleMode (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSyncOpts_InvalidScaleMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const options: image.InitializationOptions = {
            size: { width: 4, height: 4 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            scaleMode: -1
          };
          image.createPixelMapSync(options);
          console.info('www data createPixelMapSyncOpts_InvalidScaleMode_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createPixelMapSyncOpts_InvalidScaleMode_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    scaleSync_InvalidAntiAliasingLevel_001
     * @tc.number  SUB_GRAPHIC_PixelMap_scaleSync_InvalidAntiAliasingLevel_001
     * @tc.desc    Test scaleSync with invalid AntiAliasingLevel (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('scaleSync_InvalidAntiAliasingLevel_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
          pixelMap.scaleSync(2.0, 2.0, -1);
          console.info('www data scaleSync_InvalidAntiAliasingLevel_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data scaleSync_InvalidAntiAliasingLevel_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createScaledPixelMap_InvalidAntiAliasingLevel_001
     * @tc.number  SUB_GRAPHIC_PixelMap_createScaledPixelMap_InvalidAntiAliasingLevel_001
     * @tc.desc    Test createScaledPixelMap with invalid AntiAliasingLevel (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createScaledPixelMap_InvalidAntiAliasingLevel_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
          await pixelMap.createScaledPixelMap(2.0, 2.0, -1);
          console.info('www data createScaledPixelMap_InvalidAntiAliasingLevel_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createScaledPixelMap_InvalidAntiAliasingLevel_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    createScaledPixelMapSync_InvalidAntiAliasingLevel_001
     * @tc.number  SUB_GRAPHIC_PixelMap_createScaledPixelMapSync_InvalidAntiAliasingLevel_001
     * @tc.desc    Test createScaledPixelMapSync with invalid AntiAliasingLevel (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createScaledPixelMapSync_InvalidAntiAliasingLevel_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
          pixelMap.createScaledPixelMapSync(2.0, 2.0, -1);
          console.info('www data createScaledPixelMapSync_InvalidAntiAliasingLevel_001 success');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createScaledPixelMapSync_InvalidAntiAliasingLevel_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    getMetadata_InvalidHdrMetadataKey_001
     * @tc.number  SUB_GRAPHIC_PixelMap_getMetadata_InvalidHdrMetadataKey_001
     * @tc.desc    Test getMetadata with invalid HdrMetadataKey (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getMetadata_InvalidHdrMetadataKey_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
          pixelMap.getMetadata(-1);
          console.info('www data getMetadata_InvalidHdrMetadataKey_001 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getMetadata_InvalidHdrMetadataKey_001 error ' + err.code);
          expect(err.code == 62980173).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    setMetadata_InvalidHdrMetadataKey_001
     * @tc.number  SUB_GRAPHIC_PixelMap_setMetadata_InvalidHdrMetadataKey_001
     * @tc.desc    Test setMetadata with invalid HdrMetadataKey (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('setMetadata_InvalidHdrMetadataKey_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
          await pixelMap.setMetadata(-1, new ArrayBuffer(0));
          console.info('www data setMetadata_InvalidHdrMetadataKey_001 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setMetadata_InvalidHdrMetadataKey_001 error ' + err);
          expect(Number(err) == 62980173).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    createCroppedAndScaledPixelMapSync_InvalidRegion_001
     * @tc.number  SUB_GRAPHIC_PixelMap_createCroppedAndScaledPixelMapSync_InvalidRegion_001
     * @tc.desc    Test createCroppedAndScaledPixelMapSync with invalid region (size.width=-1, size.height=-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createCroppedAndScaledPixelMapSync_InvalidRegion_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
          pixelMap.createCroppedAndScaledPixelMapSync(region, 2.0, 2.0);
          console.info('www data createCroppedAndScaledPixelMapSync_InvalidRegion_001 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createCroppedAndScaledPixelMapSync_InvalidRegion_001 error ' + err.code);
          expect(err.code == 7600204).assertTrue();
          done();
        }
      })

    /**
     * @tc.name    createCroppedAndScaledPixelMap_InvalidRegion_001
     * @tc.number  SUB_GRAPHIC_PixelMap_createCroppedAndScaledPixelMap_InvalidRegion_001
     * @tc.desc    Test createCroppedAndScaledPixelMap with invalid region (size.width=-1, size.height=-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createCroppedAndScaledPixelMap_InvalidRegion_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
          await pixelMap.createCroppedAndScaledPixelMap(region, 2.0, 2.0);
          console.info('www data createCroppedAndScaledPixelMap_InvalidRegion_001 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createCroppedAndScaledPixelMap_InvalidRegion_001 error ' + err.code);
          expect(err.code == 7600204).assertTrue();
          done();
        }
      })
      
  })
}