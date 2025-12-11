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

import { describe, beforeAll, afterEach, it, expect, TestType, Level, Size } from '@ohos/hypium'
import ndkTest from 'libImageNdk.so'
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';

export default function imageNdkTest() {
  describe('ImageNdkTest', () => {
    let globalpixelmap: image.PixelMap;
    let outBuffer: ArrayBuffer = new ArrayBuffer(1200000)
    let testContext: common.UIAbilityContext;
    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      console.info('afterEach case');
    })

    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
    })

    let filePath: string;
    let fileFd: number;
    let buffer: ArrayBuffer;
    let filesDir: string | undefined

    /**
     * @tc.name   testCreatePixelMapWithStrideAbnormal
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmapWithStride_0100
     * @tc.desc   1.testCreatePixelMapWithStrideAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePixelMapWithStrideAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelMapWithStrideAbnormal()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testInitializationOptionsSetRowStrideNormal
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptionsSetRowStrideNormal_0200
     * @tc.desc   1.testInitializationOptionsSetRowStrideNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInitializationOptionsSetRowStrideNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      // Set a number 16, that is a multiple of 1 byte
      let result: number = ndkTest.testInitializationOptionsSetRowStrideNormal(16)
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeScaleWithAntiAliasingAbNormal
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_Native_ScaleWithAntiAliasing_0400
     * @tc.desc   1.testNativeScaleWithAntiAliasingAbNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeScaleWithAntiAliasingAbNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      // The scaling ratio is 100%
      let result: number = ndkTest.testNativeScaleWithAntiAliasingAbnormal()
      let msg = "testNativeScaleWithAntiAliasingAbNormal result: "
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testScaleWithAntiAliasingAbnormal
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_ScaleWithAntiAliasing_0500
     * @tc.desc   1.testScaleWithAntiAliasingAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScaleWithAntiAliasingAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      // The scaling ratio is 100%
      let result: number = ndkTest.testScaleWithAntiAliasingAbnormal(100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeGetNativeBufferAbnormal
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetNativeBuffer_0600
     * @tc.desc   1.testNativeGetNativeBufferAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeGetNativeBufferAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeGetNativeBufferAbnormal()
      let msg = 'testNativeGetNativeBufferAbnormal result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeSetMetaDataNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMetaData_0700
     * @tc.desc   1.testNativeSetMetaDataNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSetMetaDataNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeSetMetaDataNull()
      let msg = 'testNativeSetMetaDataNull result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeGetMetaDataNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetMetaData_0800
     * @tc.desc   1.testNativeGetMetaDataNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeGetMetaDataNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeGetMetaDataNull()
      let msg = 'testNativeGetMetaDataNull result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeSetMemoryName
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_0900
     * @tc.desc   1.testNativeSetMemoryName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSetMemoryName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeSetMemoryName()
      let msg = 'testNativeSetMemoryName result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeGetArgbPixels
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_1000
     * @tc.desc   1.testNativeGetArgbPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeGetArgbPixels',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeGetArgbPixels()
      let msg = 'testNativeGetArgbPixels result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeGetColorSpaceNative
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_1100
     * @tc.desc   1.testNativeGetColorSpaceNative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeGetColorSpaceNative',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeGetColorSpaceNative()
      let msg = 'testNativeGetColorSpaceNative result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeSetColorSpaceNative
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_1200
     * @tc.desc   1.testNativeSetColorSpaceNative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSetColorSpaceNative',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeSetColorSpaceNative()
      let msg = 'testNativeSetColorSpaceNative result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeSetGetSrcPixelFormat
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetGetSrcPixelFormat_1300
     * @tc.desc   1.testNativeSetGetSrcPixelFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSetGetSrcPixelFormat',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeSetGetSrcPixelFormat()
      let msg = 'testNativeSetGetSrcPixelFormat result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeCreateEmptyPixelmap
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreateEmptyPixelmap_1400
     * @tc.desc   1.testNativeCreateEmptyPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreateEmptyPixelmap',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeCreateEmptyPixelmap()
      let msg = 'testNativeCreateEmptyPixelmap result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeConvertAlphaFormat
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeConvertAlphaFormat_1500
     * @tc.desc   1.testNativeConvertAlphaFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeConvertAlphaFormat',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeConvertAlphaFormat()
      let msg = 'testNativeConvertAlphaFormat result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

  })
}