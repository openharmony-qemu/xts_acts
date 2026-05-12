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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import image from '@ohos.multimedia.image';

export default function GraphicImagePixelMapAPI2603() {

  describe("graphicImagePixelMapAPI2603", (): void => {

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_0100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0100
     * @tc.desc   createPixelMapFromPixels UNKNOWN format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0100 ';
        console.info(msgStr + 'begin');
        // UNKNOWN defaults to RGBA_8888 usually, 4 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          srcPixelFormat: image.PixelMapFormat.UNKNOWN
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_0200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0200
     * @tc.desc   createPixelMapFromPixels ARGB_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ARGB_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_0300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0300
     * @tc.desc   createPixelMapFromPixels RGB_565 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0300 ';
        console.info(msgStr + 'begin');
        // 2 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGB_565,
          srcPixelFormat: image.PixelMapFormat.RGB_565
        }
        try {
          console.info(msgStr + 'begin 111');
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          console.info(msgStr + 'begin 222');
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          console.info(msgStr + 'begin 333');
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_565);
          console.info(msgStr + 'begin 444');
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_0400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0400
     * @tc.desc   createPixelMapFromPixels RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_0500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0500
     * @tc.desc   createPixelMapFromPixels BGRA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_0600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0600
     * @tc.desc   createPixelMapFromPixels RGB_888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0600 ';
        console.info(msgStr + 'begin');
        // 3 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGB_888,
          srcPixelFormat: image.PixelMapFormat.RGB_888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_0700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0700
     * @tc.desc   createPixelMapFromPixels ALPHA_8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0700 ';
        console.info(msgStr + 'begin');
        // 1 byte per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_8);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_0800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0800
     * @tc.desc   createPixelMapFromPixels RGBA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          srcPixelFormat: image.PixelMapFormat.RGBA_F16
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_F16);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_0900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0900
     * @tc.desc   createPixelMapFromPixels NV21 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0900 ';
        console.info(msgStr + 'begin');
        // 1.5 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.NV21,
          srcPixelFormat: image.PixelMapFormat.NV21
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV21);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_1000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1000
     * @tc.desc   createPixelMapFromPixels NV12 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.NV12,
          srcPixelFormat: image.PixelMapFormat.NV12
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV12);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_1100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1100
     * @tc.desc   createPixelMapFromPixels RGBA_1010102 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_1200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1200
     * @tc.desc   createPixelMapFromPixels YCBCR_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_1300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1300
     * @tc.desc   createPixelMapFromPixels YCRCB_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_1400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1400
     * @tc.desc   createPixelMapFromPixels ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_1500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1500
     * @tc.desc   createPixelMapFromPixels ASTC_4x4 reset to RGBA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_1600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1600
     * @tc.desc   createPixelMapFromPixels alphaType UNKNOWN success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1600 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNKNOWN
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_1700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1700
     * @tc.desc   createPixelMapFromPixels alphaType OPAQUE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.OPAQUE
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_1800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1800
     * @tc.desc   createPixelMapFromPixels alphaType PREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_1900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1900
     * @tc.desc   createPixelMapFromPixels alphaType UNPREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNPREMUL
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_2000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2000
     * @tc.desc   createPixelMapFromPixels scaleMode FIT_TARGET_SIZE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_2100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2100
     * @tc.desc   createPixelMapFromPixels scaleMode CENTER_CROP success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.CENTER_CROP
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_2200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2200
     * @tc.desc   createPixelMapFromPixels editable true success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          editable: true
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(pixelMap.isEditable).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_2300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2300
     * @tc.desc   createPixelMapFromPixels editable false success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          editable: false
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_2400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2400
     * @tc.desc   createPixelMapFromPixels verify isStrideAlignment success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(typeof pixelMap.isStrideAlignment).assertEqual('boolean');
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_2500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2500
     * @tc.desc   createPixelMapFromPixels verify pixelFormat matches opts test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(opts.pixelFormat);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_2600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2600
     * @tc.desc   createPixelMapFromPixels buffer size mismatch error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2600 ';
        console.info(msgStr + 'begin');
        // Wrong size: expecting 96 bytes for RGBA_8888
        let buffer: ArrayBuffer = new ArrayBuffer(50);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_2700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixelsSync_static_2700
     * @tc.desc   createPixelMapFromPixelsSync basic success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_2800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2800
     * @tc.desc   createPixelMapFromPixelsSync UNKNOWN format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0100 ';
        console.info(msgStr + 'begin');
        // UNKNOWN defaults to RGBA_8888 usually, 4 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          srcPixelFormat: image.PixelMapFormat.UNKNOWN,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_2900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2900
     * @tc.desc   createPixelMapFromPixelsSync ARGB_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ARGB_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_3000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3000
     * @tc.desc   createPixelMapFromPixelsSync RGB_565 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3000 ';
        console.info(msgStr + 'begin');
        // 2 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGB_565,
          srcPixelFormat: image.PixelMapFormat.RGB_565,
        }
        try {
          console.info(msgStr + 'begin 111');
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          console.info(msgStr + 'begin 222');
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          console.info(msgStr + 'begin 333');
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_565);
          console.info(msgStr + 'begin 444');
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_3100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3100
     * @tc.desc   createPixelMapFromPixelsSync RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_3200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3200
     * @tc.desc   createPixelMapFromPixels BGRA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_3300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3300
     * @tc.desc   createPixelMapFromPixelsSync RGB_888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3300 ';
        console.info(msgStr + 'begin');
        // 3 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGB_888,
          srcPixelFormat: image.PixelMapFormat.RGB_888,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_3400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3400
     * @tc.desc   createPixelMapFromPixelsSync ALPHA_8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3400 ';
        console.info(msgStr + 'begin');
        // 1 byte per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_8);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_3500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3500
     * @tc.desc   createPixelMapFromPixelsSync RGBA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_F16);
          pixelMap.release();
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_3600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3600
     * @tc.desc   createPixelMapFromPixelsSync NV21 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3600 ';
        console.info(msgStr + 'begin');
        // 1.5 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.NV21,
          srcPixelFormat: image.PixelMapFormat.NV21,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV21);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_3700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3700
     * @tc.desc   createPixelMapFromPixelsSync NV12 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.NV12,
          srcPixelFormat: image.PixelMapFormat.NV12,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV12);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_3800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3800
     * @tc.desc   createPixelMapFromPixelsSync RGBA_1010102 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_3900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3900
     * @tc.desc   createPixelMapFromPixelsSync YCBCR_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_4000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4000
     * @tc.desc   createPixelMapFromPixelsSync YCRCB_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_4100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4100
     * @tc.desc   createPixelMapFromPixelsSync ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
        }
        try {
          let pixelMap =  image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_4200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4200
     * @tc.desc   createPixelMapFromPixelsSync ASTC_4x4 reset to RGBA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_4300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4300
     * @tc.desc   createPixelMapFromPixelsSync alphaType UNKNOWN success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNKNOWN
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_4400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4400
     * @tc.desc   createPixelMapFromPixelsSync alphaType OPAQUE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.OPAQUE
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_4500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4500
     * @tc.desc   createPixelMapFromPixelsSync alphaType PREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_4600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4600
     * @tc.desc   createPixelMapFromPixelsSync alphaType UNPREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4600 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNPREMUL
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_4700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4700
     * @tc.desc   createPixelMapFromPixelsSync scaleMode FIT_TARGET_SIZE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_4800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4800
     * @tc.desc   createPixelMapFromPixelsSync scaleMode CENTER_CROP success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.CENTER_CROP
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_4900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4900
     * @tc.desc   createPixelMapFromPixelsSync editable true success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          editable: true
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(pixelMap.isEditable).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_5000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_5000
     * @tc.desc   createPixelMapFromPixelsSync editable false success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_5000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          editable: false
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

  })
}
