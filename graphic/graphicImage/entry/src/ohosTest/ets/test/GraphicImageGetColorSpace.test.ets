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

import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium-dynamic"
import image from '@ohos.multimedia.image';
import { BusinessError } from '@kit.BasicServicesKit';
import { colorSpaceManager } from '@kit.ArkGraphics2D';

export default function GraphicImageGetColorSpace() {
  describe('GraphicImageGetColorSpace', () => {
    beforeAll(async (done: Function) => {
      console.info("GraphicImageGetColorSpace beforeAll start");
      done();
    });

    /**
     * @tc.name    getColorSpace_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_0100
     * @tc.desc    PixelMap getColorSpace - ADOBE_RGB_1998
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getColorSpace_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_0100 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        console.info('www data getColorSpace_0100 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_0100 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_0100 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        console.info('www data getColorSpace_0100 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_0100 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_0100 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_0200
     * @tc.desc    PixelMap getColorSpace - DCI_P3
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getColorSpace_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_0200 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3);
        console.info('www data getColorSpace_0200 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_0200 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_0200 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.DCI_P3);
        console.info('www data getColorSpace_0200 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_0200 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_0200 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_0300
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_0300
     * @tc.desc    PixelMap getColorSpace - DISPLAY_P3
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getColorSpace_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_0300 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3);
        console.info('www data getColorSpace_0300 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_0300 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_0300 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3);
        console.info('www data getColorSpace_0300 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_0300 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_0300 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_0400
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_0400
     * @tc.desc    PixelMap getColorSpace - SRGB
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getColorSpace_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_0400 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        console.info('www data getColorSpace_0400 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_0400 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_0400 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.SRGB);
        console.info('www data getColorSpace_0400 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_0400 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_0400 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_0500
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_0500
     * @tc.desc    PixelMap getColorSpace - BT709
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getColorSpace_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_0500 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709);
        console.info('www data getColorSpace_0500 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_0500 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_0500 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.BT709);
        console.info('www data getColorSpace_0500 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_0500 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_0500 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_0600
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_0600
     * @tc.desc    PixelMap getColorSpace - BT601_EBU
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getColorSpace_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_0600 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU);
        console.info('www data getColorSpace_0600 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_0600 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_0600 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.BT601_EBU);
        console.info('www data getColorSpace_0600 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_0600 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_0600 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_0700
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_0700
     * @tc.desc    PixelMap getColorSpace - BT601_SMPTE_C
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getColorSpace_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_0700 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C);
        console.info('www data getColorSpace_0700 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_0700 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_0700 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C);
        console.info('www data getColorSpace_0700 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_0700 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_0700 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_0800
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_0800
     * @tc.desc    PixelMap getColorSpace - BT2020_HLG
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getColorSpace_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_0800 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG);
        console.info('www data getColorSpace_0800 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_0800 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_0800 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG);
        console.info('www data getColorSpace_0800 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_0800 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_0800 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_0900
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_0900
     * @tc.desc    PixelMap getColorSpace - BT2020_PQ
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getColorSpace_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_0900 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ);
        console.info('www data getColorSpace_0900 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_0900 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_0900 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ);
        console.info('www data getColorSpace_0900 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_0900 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_0900 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_1000
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_1000
     * @tc.desc    PixelMap getColorSpace - P3_HLG
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getColorSpace_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_1000 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG);
        console.info('www data getColorSpace_1000 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_1000 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_1000 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.P3_HLG);
        console.info('www data getColorSpace_1000 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_1000 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_1000 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_1100
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_1100
     * @tc.desc    PixelMap getColorSpace - P3_PQ
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getColorSpace_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_1100 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ);
        console.info('www data getColorSpace_1100 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_1100 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_1100 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.P3_PQ);
        console.info('www data getColorSpace_1100 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_1100 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_1100 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_1200
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_1200
     * @tc.desc    PixelMap getColorSpace - ADOBE_RGB_1998_LIMIT
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_1200 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT);
        console.info('www data getColorSpace_1200 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_1200 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_1200 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT);
        console.info('www data getColorSpace_1200 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_1200 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_1200 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_1300
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_1300
     * @tc.desc    PixelMap getColorSpace - DISPLAY_P3_LIMIT
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_1300 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT);
        console.info('www data getColorSpace_1300 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_1300 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_1300 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT);
        console.info('www data getColorSpace_1300 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_1300 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_1300 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_1400
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_1400
     * @tc.desc    PixelMap getColorSpace - SRGB_LIMIT
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_1400 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT);
        console.info('www data getColorSpace_1400 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_1400 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_1400 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.SRGB_LIMIT);
        console.info('www data getColorSpace_1400 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_1400 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_1400 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_1500
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_1500
     * @tc.desc    PixelMap getColorSpace - BT709_LIMIT
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_1500 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709_LIMIT);
        console.info('www data getColorSpace_1500 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_1500 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_1500 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.BT709_LIMIT);
        console.info('www data getColorSpace_1500 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_1500 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_1500 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_1600
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_1600
     * @tc.desc    PixelMap getColorSpace - BT601_EBU_LIMIT
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_1600 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT);
        console.info('www data getColorSpace_1600 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_1600 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_1600 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT);
        console.info('www data getColorSpace_1600 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_1600 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_1600 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_1700
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_1700
     * @tc.desc    PixelMap getColorSpace - BT601_SMPTE_C_LIMIT
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_1700 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT);
        console.info('www data getColorSpace_1700 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_1700 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_1700 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT);
        console.info('www data getColorSpace_1700 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_1700 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_1700 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_1800
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_1800
     * @tc.desc    PixelMap getColorSpace - BT2020_HLG_LIMIT
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_1800 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT);
        console.info('www data getColorSpace_1800 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_1800 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_1800 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT);
        console.info('www data getColorSpace_1800 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_1800 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_1800 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_1900
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_1900
     * @tc.desc    PixelMap getColorSpace - BT2020_PQ_LIMIT
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_1900 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT);
        console.info('www data getColorSpace_1900 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_1900 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_1900 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT);
        console.info('www data getColorSpace_1900 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_1900 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_1900 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_2000
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_2000
     * @tc.desc    PixelMap getColorSpace - P3_HLG_LIMIT
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_2000 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT);
        console.info('www data getColorSpace_2000 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_2000 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_2000 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.P3_HLG_LIMIT);
        console.info('www data getColorSpace_2000 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_2000 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_2000 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_2100
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_2100
     * @tc.desc    PixelMap getColorSpace - P3_PQ_LIMIT
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_2100 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT);
        console.info('www data getColorSpace_2100 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_2100 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_2100 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.P3_PQ_LIMIT);
        console.info('www data getColorSpace_2100 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_2100 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_2100 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_2200
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_2200
     * @tc.desc    PixelMap getColorSpace - LINEAR_P3
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_2200 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3);
        console.info('www data getColorSpace_2200 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_2200 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_2200 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.LINEAR_P3);
        console.info('www data getColorSpace_2200 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_2200 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_2200 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_2300
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_2300
     * @tc.desc    PixelMap getColorSpace - LINEAR_SRGB
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_2300 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB);
        console.info('www data getColorSpace_2300 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_2300 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_2300 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.LINEAR_SRGB);
        console.info('www data getColorSpace_2300 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_2300 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_2300 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_2400
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_2400
     * @tc.desc    PixelMap getColorSpace - LINEAR_BT709
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_2400 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT709);
        console.info('www data getColorSpace_2400 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_2400 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_2400 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT709);
        console.info('www data getColorSpace_2400 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_2400 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_2400 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_2500
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_2500
     * @tc.desc    PixelMap getColorSpace - LINEAR_BT2020
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getColorSpace_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_2500 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020);
        console.info('www data getColorSpace_2500 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_2500 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_2500 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT2020);
        console.info('www data getColorSpace_2500 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_2500 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_2500 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_2600
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_2600
     * @tc.desc    PixelMap getColorSpace - H_LOG
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('getColorSpace_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_2600 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.H_LOG);
        console.info('www data getColorSpace_2600 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_2600 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_2600 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.H_LOG);
        console.info('www data getColorSpace_2600 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_2600 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_2600 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_2700
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_2700
     * @tc.desc    PixelMap getColorSpace - DISPLAY_BT2020_SRGB
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('getColorSpace_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_2700 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB);
        console.info('www data getColorSpace_2700 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_2700 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_2700 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB);
        console.info('www data getColorSpace_2700 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_2700 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_2700 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_2800
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_2800
     * @tc.desc    PixelMap getColorSpace - DISPLAY_SRGB
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('getColorSpace_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_2800 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
        console.info('www data getColorSpace_2800 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_2800 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_2800 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
        console.info('www data getColorSpace_2800 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_2800 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_2800 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_2900
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_2900
     * @tc.desc    PixelMap getColorSpace - DISPLAY_P3_SRGB
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('getColorSpace_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_2900 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB);
        console.info('www data getColorSpace_2900 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_2900 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_2900 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB);
        console.info('www data getColorSpace_2900 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_2900 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_2900 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_3000
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_3000
     * @tc.desc    PixelMap getColorSpace - DISPLAY_P3_HLG
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('getColorSpace_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_3000 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG);
        console.info('www data getColorSpace_3000 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_3000 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_3000 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG);
        console.info('www data getColorSpace_3000 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_3000 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_3000 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpace_3100
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_3100
     * @tc.desc    PixelMap getColorSpace - DISPLAY_P3_PQ
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('getColorSpace_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpace_3100 succeeded in createPixelMap ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ);
        console.info('www data getColorSpace_3100 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpace_3100 succeeded in setColorSpace');
        const result = pixelMap.getColorSpace();
        console.info(`www data getColorSpace_3100 Succeeded in getting color space: ${result.getColorSpaceName()}`);
        expect(result.getColorSpaceName()).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ);
        console.info('www data getColorSpace_3100 succeeded in assertEqual');
        await pixelMap.release();
        console.info('www data getColorSpace_3100 succeeded in release');
        done();
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpace_3100 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpaceError_0100
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_3200
     * @tc.desc    PixelMap getColorSpace - no color space set, expect error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('getColorSpaceError_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpaceError_0100 succeeded in createPixelMap');
        try {
          const result = pixelMap.getColorSpace();
          console.info(`www data getColorSpaceError_0100 succeeded in getColorSpace: ${result.getColorSpaceName()}`);
          expect().assertFail();
          await pixelMap.release();
          done();
        } catch (err) {
          const error = err as BusinessError;
          console.info(`www data getColorSpaceError_0100 error: Code: ${error.code}, message: ${error.message}`);
          expect(error.code == 62980103).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpaceError_0100 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    getColorSpaceError_0200
     * @tc.number  SUB_GRAPHIC_PixelMap_getColorSpace_3300
     * @tc.desc    PixelMap getColorSpace - after release, expect error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('getColorSpaceError_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info('www data getColorSpaceError_0200 succeeded in createPixelMap');
        const csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        console.info('www data getColorSpaceError_0200 succeeded in createColorSpace');
        pixelMap.setColorSpace(csm);
        console.info('www data getColorSpaceError_0200 succeeded in setColorSpace');
        await pixelMap.release();
        console.info('www data getColorSpaceError_0200 succeeded in release');
        try {
          const result = pixelMap.getColorSpace();
          console.info(`www data getColorSpaceError_0200 succeeded in getColorSpace: ${result.getColorSpaceName()}`);
          expect().assertFail();
          done();
        } catch (err) {
          const error = err as BusinessError;
          console.info(`www data getColorSpaceError_0200 error: Code: ${error.code}, message: ${error.message}`);
          expect(error.code == 62980115).assertTrue();
          done();
        }
      } catch (e) {
        const err = e as BusinessError;
        console.error(`www data getColorSpaceError_0200 Failed: Code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

  })
}
