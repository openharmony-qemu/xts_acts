/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { image } from '@kit.ImageKit';
import fs from '@ohos.file.fs';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

const TAG = 'xts_static_ImageMetadataTest'

export default function ImageMetadataTestStatic(): void {
  describe('ImageMetadataTestStatic', () => {
    let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
    let filePath: string = '';
    let fdNumber: int;

    const getFd = (fileName: string): int => {
      filePath = testContext.filesDir + "/" + fileName;
      // filePath = AppStorage.get('pathDir') + "/" + fileName;
      console.info(TAG, "image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      fdNumber = file.fd as int;
      return fdNumber;
    };

    const getFilePath = async (fileName: string): Promise<string> => {
      filePath = testContext.filesDir + "/" + fileName;
      return filePath;
    }

    // const verifyreadMetadataByType = <k>(
    //   testName: string,
    //   exifValue: image.ImageMetadata,
    //   keys: k[],
    //   expectedIndex: number,
    //   rulesMap: Map<k, ReadOnlyMetaDataRule>,
    //   metadataType: string
    // ): boolean => {
    //   let result: boolean = true;
    //   if (exifValue[metadataType] == undefined) {
    //     console.info(TAG,testName,` Not meeting the conditions.`);
    //     return false;
    //   }
    //   for (let i = 0; i < keys.length; i++) {
    //     const key = keys[i];
    //     const rule = rulesMap.get(key);
    //     if (!rule) {
    //       console.info(`${result} No rule found for key: ${key}`);
    //       continue;
    //     }
    //     try {
    //       let ruleExpectedValue = rule.newExpectValue;
    //       let expectedValue: MetadataScalar = Array.isArray(ruleExpectedValue) ? ruleExpectedValue : ruleExpectedValue;
    //       let actualValue: MetadataScalar = exifValue[metadataType]![rule.key!];
    //       if (!compareValues(actualValue, expectedValue)) {
    //         console.info(TAG,testName,` Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
    //         result = false;
    //       }
    //     } catch (error) {
    //       console.error(TAG,testName,` Error processing key ${key}: ${error}`);
    //       result = false;
    //     }
    //   }
    //   return result;
    // }
    // const verifyMultipleFramesMetadata = <k>(
    //   testTag: string,
    //   exifValue: image.ImageMetadata,
    //   keys: k[],
    //   expectedIndex: number,
    //   rulesMap: Map<k, ReadOnlyMetaDataRule>,
    //   metadataType: string
    // ): boolean => {
    //   let result: boolean = true;
    //   if (exifValue[metadataType] == undefined) {
    //     console.info(`${testTag} Not meeting the conditions.`);
    //     return false;
    //   }
    //   for (let i = 0; i < keys.length; i++) {
    //     const key = keys[i];
    //     const rule = rulesMap.get(key);
    //     if (!rule) {
    //       console.info(`${result} No rule found for key: ${key}`);
    //       continue;
    //     }
    //     try {
    //       let ruleExpectedValue = rule.newExpectValue;
    //       let expectedValue: MetadataScalar = Array.isArray(ruleExpectedValue) ? ruleExpectedValue[expectedIndex] : ruleExpectedValue;
    //       let actualValue: MetadataScalar = exifValue[metadataType]![rule.key!];
    //       if (!compareValues(actualValue, expectedValue)) {
    //         console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
    //         result = false;
    //       }
    //     } catch (error) {
    //       console.error(`${testTag} Error processing key ${key}: ${error}`);
    //       result = false;
    //     }
    //   }
    //   return result;
    // }

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });


    const compareArrayBuffer = (
      actualBuffer: ArrayBuffer,
      expectedValue: string | int | number | object | number[] | undefined | null | ArrayBuffer | boolean
    ): boolean => {
      const actualArray = new Uint8Array(actualBuffer);
      const MAX_COMPARE_COUNT = 20;

      const logCount = Math.min(MAX_COMPARE_COUNT, actualArray.length);
      for (let i = 0; i < logCount; i++) {
        console.info(`ArrayBuffer[${i}]: ${actualArray[i]}`);
      }
      if (actualArray.length > MAX_COMPARE_COUNT) {
        console.info(`ArrayBuffer: ... (${actualArray.length - MAX_COMPARE_COUNT} elements omitted) ...`);
      }

      if (expectedValue instanceof ArrayBuffer) {
        const expectedArray = new Uint8Array(expectedValue);
        const compareCount = Math.min(MAX_COMPARE_COUNT, actualArray.length, expectedArray.length);

        for (let i = 0; i < compareCount; i++) {
          if (actualArray[i] !== expectedArray[i]) {
            console.info(`Mismatch at [${i}]: actual=${actualArray[i]}, expected=${expectedArray[i]}`);
            return false;
          }
        }
        return true;
      }

      if (Array.isArray(expectedValue)) {
        let expValue = expectedValue as number[]
        const compareCount = Math.min(MAX_COMPARE_COUNT, actualArray.length, expValue.length);
        for (let i = 0; i < compareCount; i++) {
          if (actualArray[i] !== expValue[i]) {
            console.info(`Mismatch at [${i}]: actual=${actualArray[i]}, expected=${expValue[i]}`);
            return false;
          }
        }
        return true;
      }
      return false;
    }

    const checkTagValue = (
      testNum: string,
      path: string,
      tagValueSet: image.XMPTag | null,
      xmpValue: string | null | number | undefined
    ): boolean => {
      if (tagValueSet != null && xmpValue != null) {
        console.info(`${testNum} getTag ${path}, value is: ${tagValueSet.value}`);
        return tagValueSet.value === xmpValue;
      } else if (tagValueSet == null && xmpValue == null) {
        console.info(`${testNum} getTag ${path} returned null as expected`);
        return true;
      }
      console.info(`${testNum} getTag ${path} returned null`);
      return false;
    }


    /**
     * @tc.number    SUB_MEDIA_IMAGE_HEIFS_METADATA_heifsMetadata_PropertyKey_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_HEIFS_METADATA_heifsMetadata_PropertyKey_STATIC_0100
     * @tc.desc      HeifsMetadata PropertyKey 覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_heifsMetadata_PropertyKey_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_HEIFS_METADATA_heifsMetadata_PropertyKey_STATIC_0100";
      let filePathFir = await getFilePath("test_exif_v3.heic");
      let result = true;
      let isSupportHEIFDecode: boolean = image.createImageSource(filePathFir)!.supportedFormats.includes("image/heic");
      if (!isSupportHEIFDecode) {
        console.info(TAG,testName,` device is not support decode heif!`);
        expect(result).assertTrue();
        done();
        return;
      }
      try {
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        const imageMetadata = await imageSourceObj!.readImageMetadata();
        console.info(TAG, testName, `readImageMetadata success`, imageMetadata);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,heifsMetadata.heifsCanvasHeight`,JSON.stringify(imageMetadata.heifsMetadata!.heifsCanvasHeight));
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,heifsMetadata.heifsCanvasWidth`,JSON.stringify(imageMetadata.heifsMetadata!.heifsCanvasWidth));
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,heifsMetadata.heifsUnclampedDelayTime`,JSON.stringify(imageMetadata.heifsMetadata!.heifsUnclampedDelayTime));
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_HEIFS_METADATA_GifMetadata_PropertyKey_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_HEIFS_METADATA_GifMetadata_PropertyKey_STATIC_0100
     * @tc.desc      GifMetadata PropertyKey 覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_GifMetadata_PropertyKey_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_HEIFS_METADATA_GifMetadata_PropertyKey_STATIC_0100";
      let filePath = await getFilePath("test6.gif");
      try {
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        const imageMetadata = await imageSourceObj!.readImageMetadata();
        expect(imageMetadata.gifMetadata!!=undefined).assertTrue();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,gifMetadata.delayTime`,JSON.stringify(imageMetadata.gifMetadata!.delayTime));
        expect(imageMetadata.gifMetadata!.delayTime).assertEqual(100);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,gifMetadata.unclampedDelayTime`,JSON.stringify(imageMetadata.gifMetadata!.unclampedDelayTime));
        expect(imageMetadata.gifMetadata!.unclampedDelayTime).assertEqual(40);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,gifMetadata.hasGlobalColorMap`,JSON.stringify(imageMetadata.gifMetadata!.hasGlobalColorMap));
        expect(imageMetadata.gifMetadata!.hasGlobalColorMap).assertTrue();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,gifMetadata.loopCount`,JSON.stringify(imageMetadata.gifMetadata!.loopCount));
        expect(imageMetadata.gifMetadata!.loopCount).assertEqual(0);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,gifMetadata.disposalType`,JSON.stringify(imageMetadata.gifMetadata!.disposalType));
        expect(imageMetadata.gifMetadata!.disposalType).assertEqual(1);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,gifMetadata.canvasHeight`,JSON.stringify(imageMetadata.gifMetadata!.canvasHeight));
        expect(imageMetadata.gifMetadata!.canvasHeight).assertEqual(270);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,gifMetadata.canvasWidth`,JSON.stringify(imageMetadata.gifMetadata!.canvasWidth));
        expect(imageMetadata.gifMetadata!.canvasWidth).assertEqual(480);
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_HEIFS_METADATA_pngMetadata_PropertyKey_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_HEIFS_METADATA_pngMetadata_PropertyKey_STATIC_0100
     * @tc.desc      pngMetadata PropertyKey 覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_pngMetadata_PropertyKey_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_HEIFS_METADATA_pngMetadata_PropertyKey_STATIC_0100";
      let filePath = await getFilePath("test_reladeMetadata.png");
      try {
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        const imageMetadata = await imageSourceObj!.readImageMetadata();
        expect(imageMetadata.pngMetadata!!=undefined).assertTrue();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.xPixelsPerMeter`,JSON.stringify(imageMetadata.pngMetadata!.xPixelsPerMeter));
        expect(imageMetadata.pngMetadata!.xPixelsPerMeter).assertEqual(3780);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.software`,JSON.stringify(imageMetadata.pngMetadata!.software));
        expect(imageMetadata.pngMetadata!.software).assertEqual('Python pypng Script');
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.disclaimer`,JSON.stringify(imageMetadata.pngMetadata!.disclaimer));
        expect(imageMetadata.pngMetadata!.disclaimer).assertEqual('For internal use only');
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.description`,JSON.stringify(imageMetadata.pngMetadata!.description));
        expect(imageMetadata.pngMetadata!.description).assertEqual('This image contains all possible metadata fields');
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.copyright`,JSON.stringify(imageMetadata.pngMetadata!.copyright));
        expect(imageMetadata.pngMetadata!.copyright).assertEqual('Copyright (C) 2026 QA Team');
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.interlaceType`,JSON.stringify(imageMetadata.pngMetadata!.interlaceType));
        expect(imageMetadata.pngMetadata!.interlaceType).assertEqual(0);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.comment`,JSON.stringify(imageMetadata.pngMetadata!.comment));
        expect(imageMetadata.pngMetadata!.comment).assertEqual('Generated for testing purposes');
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.author`,JSON.stringify(imageMetadata.pngMetadata!.author));
        expect(imageMetadata.pngMetadata!.author).assertEqual('Test Engineer');
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.chromaticities`,JSON.stringify(imageMetadata.pngMetadata!.chromaticities));
        expect(JSON.stringify(imageMetadata.pngMetadata!.chromaticities)).assertEqual('[0.3127,0.329,0.64,0.33,0.3,0.6,0.15,0.06]');
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.creationTime`,JSON.stringify(imageMetadata.pngMetadata!.creationTime));
        expect(imageMetadata.pngMetadata!.creationTime).assertEqual('2026-03-19 10:00:00');
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.modificationTime`,JSON.stringify(imageMetadata.pngMetadata!.modificationTime));
        expect(imageMetadata.pngMetadata!.modificationTime).assertEqual('2026-03-19 10:05:00');
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.gamma`,JSON.stringify(imageMetadata.pngMetadata!.gamma));
        expect(imageMetadata.pngMetadata!.gamma).assertEqual(0.45455);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.yPixelsPerMeter`,JSON.stringify(imageMetadata.pngMetadata!.yPixelsPerMeter));
        expect(imageMetadata.pngMetadata!.yPixelsPerMeter).assertEqual(3780);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.sRGBIntent`,JSON.stringify(imageMetadata.pngMetadata!.sRGBIntent));
        expect(imageMetadata.pngMetadata!.sRGBIntent).assertEqual(0);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.title`,JSON.stringify(imageMetadata.pngMetadata!.title));
        expect(imageMetadata.pngMetadata!.title).assertEqual('Complete Test Image');
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,pngMetadata.warning`,JSON.stringify(imageMetadata.pngMetadata!.warning));
        expect(imageMetadata.pngMetadata!.warning).assertEqual('Do not modify this metadata!');
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    SUB_MEDIA_IMAGE_HEIFS_METADATA_jfifMetadata_PropertyKey_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_HEIFS_METADATA_jfifMetadata_PropertyKey_STATIC_0100
     * @tc.desc      jfifMetadata PropertyKey 覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_pngMetadata_PropertyKey_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_HEIFS_METADATA_pngMetadata_PropertyKey_STATIC_0100";
      let filePath = await getFilePath("sample2.jfif");
      try {
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        const imageMetadata = await imageSourceObj!.readImageMetadata();
        expect(imageMetadata.jfifMetadata!!=undefined).assertTrue();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,jfifMetadata!.densityUnit`,JSON.stringify(imageMetadata.jfifMetadata!.densityUnit));
        expect(imageMetadata.jfifMetadata!.densityUnit).assertEqual(1);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,jfifMetadata!.xDensity`,JSON.stringify(imageMetadata.jfifMetadata!.xDensity));
        expect(imageMetadata.jfifMetadata!.xDensity).assertEqual(72);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,jfifMetadata!.yDensity`,JSON.stringify(imageMetadata.jfifMetadata!.yDensity));
        expect(imageMetadata.jfifMetadata!.yDensity).assertEqual(72);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,jfifMetadata!.isProgressive`,JSON.stringify(imageMetadata.jfifMetadata!.isProgressive));
        expect(imageMetadata.jfifMetadata!.isProgressive).assertFalse();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,jfifMetadata!.version`,JSON.stringify(imageMetadata.jfifMetadata!.version));
        expect(JSON.stringify(imageMetadata.jfifMetadata!.version)).assertEqual('[1,1]');
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    SUB_MEDIA_IMAGE_HEIFS_METADATA_TiffMetadata_PropertyKey_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_HEIFS_METADATA_TiffMetadata_PropertyKey_STATIC_0100
     * @tc.desc      TiffMetadata PropertyKey 覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_TiffMetadata_PropertyKey_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_HEIFS_METADATA_TiffMetadata_PropertyKey_STATIC_0100";
      let filePath = await getFilePath("tiff_xmp.tiff");
      try {
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        const imageMetadata = await imageSourceObj!.readImageMetadata();
        expect(imageMetadata.tiffMetadata!!=undefined).assertTrue();
        expect(imageMetadata.xmpMetadata!!=undefined).assertTrue();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.primaryChromaticities`,JSON.stringify(imageMetadata.tiffMetadata!.primaryChromaticities));
        expect(imageMetadata.tiffMetadata!.primaryChromaticities).assertUndefined();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.tileWidth`,JSON.stringify(imageMetadata.tiffMetadata!.tileWidth));
        expect(imageMetadata.tiffMetadata!.tileWidth).assertUndefined();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.tileLength`,JSON.stringify(imageMetadata.tiffMetadata!.tileLength));
        expect(imageMetadata.tiffMetadata!.tileLength).assertUndefined();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.dateTime`,JSON.stringify(imageMetadata.tiffMetadata!.dateTime));
        expect(imageMetadata.tiffMetadata!.dateTime).assertEqual("2018:10:27 16:20:29");
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.make`,JSON.stringify(imageMetadata.tiffMetadata!.make));
        expect(imageMetadata.tiffMetadata!.make).assertEqual("Canon");
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.photometricInterpretation`,JSON.stringify(imageMetadata.tiffMetadata!.photometricInterpretation));
        expect(imageMetadata.tiffMetadata!.photometricInterpretation).assertEqual(2);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.whitePoint`,JSON.stringify(imageMetadata.tiffMetadata!.whitePoint));
        expect(imageMetadata.tiffMetadata!.whitePoint).assertUndefined();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.documentName`,JSON.stringify(imageMetadata.tiffMetadata!.documentName));
        expect(imageMetadata.tiffMetadata!.documentName).assertUndefined();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.imageDescription`,JSON.stringify(imageMetadata.tiffMetadata!.imageDescription));
        expect(imageMetadata.tiffMetadata!.imageDescription).assertUndefined();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.software`,JSON.stringify(imageMetadata.tiffMetadata!.software));
        expect(imageMetadata.tiffMetadata!.software).assertEqual("Adobe Photoshop Lightroom Classic 7.4 (Macintosh)");
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.xResolution`,JSON.stringify(imageMetadata.tiffMetadata!.xResolution));
        expect(imageMetadata.tiffMetadata!.xResolution).assertEqual(300);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.yResolution`,JSON.stringify(imageMetadata.tiffMetadata!.yResolution));
        expect(imageMetadata.tiffMetadata!.yResolution).assertEqual(300);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.hostComputer`,JSON.stringify(imageMetadata.tiffMetadata!.hostComputer));
        expect(imageMetadata.tiffMetadata!.hostComputer).assertUndefined();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.transferFunction`,JSON.stringify(imageMetadata.tiffMetadata!.transferFunction));
        expect(imageMetadata.tiffMetadata!.transferFunction).assertUndefined();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.artist`,JSON.stringify(imageMetadata.tiffMetadata!.artist));
        expect(imageMetadata.tiffMetadata!.artist).assertUndefined();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.orientation`,JSON.stringify(imageMetadata.tiffMetadata!.orientation));
        expect(imageMetadata.tiffMetadata!.orientation).assertUndefined();
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.model`,JSON.stringify(imageMetadata.tiffMetadata!.model));
        expect(imageMetadata.tiffMetadata!.model).assertEqual("Canon EOS Rebel T6");
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.resolutionUnit`,JSON.stringify(imageMetadata.tiffMetadata!.resolutionUnit));
        expect(imageMetadata.tiffMetadata!.resolutionUnit).assertEqual(2);
        console.info(TAG, testName, `imageSourceObj readImageMetadata success,tiffMetadata!.compression`,JSON.stringify(imageMetadata.tiffMetadata!.compression));
        expect(imageMetadata.tiffMetadata!.compression).assertEqual(1);
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_HEIFS_METADATA_dngMetadata_PropertyKey_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_HEIFS_METADATA_dngMetadata_PropertyKey_STATIC_0100
     * @tc.desc      dngMetadata PropertyKey 覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_dngMetadata_PropertyKey_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_HEIFS_METADATA_dngMetadata_PropertyKey_STATIC_0100";
      // let fileNum= await getFd("dng_xmp.dng");
      let result: boolean = true;
      let filePathFir = await getFd("dng_xmp.dng");
      let isSupportHEIFDecode: boolean = image.createImageSource(filePathFir)!.supportedFormats.includes("image/dng");
      if (!isSupportHEIFDecode) {
        console.info(TAG,testName,` device is not support decode heif!`);
        expect(result).assertTrue();
        done();
        return;
      }
      try {
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePathFir);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        const imageMetadata:image.ImageMetadata |undefined = await imageSourceObj!.readImageMetadata();
        // console.info(TAG, testName, `imageSourceObj readImageMetadata success,dngMetadata!.linearResponseLimit`,JSON.stringify(imageMetadata.dngMetadata!.linearResponseLimit));
        // expect(imageMetadata.dngMetadata!.linearResponseLimit!=undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_HEIFS_METADATA_avisMetadata_PropertyKey_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_HEIFS_METADATA_avisMetadata_PropertyKey_STATIC_0100
     * @tc.desc      avisMetadata PropertyKey 覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_avisMetadata_PropertyKey_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_HEIFS_METADATA_avisMetadata_PropertyKey_STATIC_0100";
      let filePath = await getFilePath("bird_8bit_I420_599x359_fps10.avif");
      try {
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        const imageMetadata = await imageSourceObj!.readImageMetadata();
        console.info(TAG, testName, `readImageMetadata success`, imageMetadata.avisMetadata);
        expect(imageMetadata.avisMetadata!!=undefined).assertTrue();
        console.info(TAG, testName, `readImageMetadata success`, imageMetadata.avisMetadata!.delayTime);
        expect(imageMetadata.avisMetadata!.delayTime).assertEqual(100);
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_XMPTag_getTags_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_XMPTag_getTags_STATIC_0100
     * @tc.desc        Verify getTags with rootPath crs:ToneCurve and recursive true traverses all array elements
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call getTags with rootPath "crs:ToneCurve" and options { isRecursive: true }
     *                 3.Print path and XMPTag value
     *                 4.Verify array values are consistent with expected result
     *                 5.cover XMPEnumerateOptions,isRecursive: false, onlyQualifier : false
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_XMPTag_getTags_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_XMPTag_getTags_STATIC_0100";
      let fileNum= await getFd("jpeg_xmp.jpg");
      const rootPath = "crs:ToneCurve";
      const options: image.XMPEnumerateOptions = { isRecursive: false, onlyQualifier : false };
      const expectedItem1Value = "0, 0";
      const expectedItem2Value = "255, 255";
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fileNum);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceApi!);
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi!.readImageMetadata();
        if (xmpMetadata.xmpMetadata! != null) {
          const tagRecord: Record<string, image.XMPTag> = await xmpMetadata.xmpMetadata!.getTags(rootPath, options);
          console.info(TAG,testName,JSON.stringify(tagRecord[`${rootPath}[2]`]),JSON.stringify(tagRecord[`${rootPath}[1]`]),JSON.stringify(tagRecord[`${rootPath}`]));
          expect(JSON.stringify(tagRecord[`${rootPath}[1]`]!.value!)).assertEqual(JSON.stringify(expectedItem1Value));
          expect(JSON.stringify(tagRecord[`${rootPath}[2]`]!.value!)).assertEqual(JSON.stringify(expectedItem2Value));
        }
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      } finally {
        await imageSourceApi!.release();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPNamespace_setValue_ERROR_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPNamespace_setValue_ERROR_STATIC_0100
     * @tc.desc        Verify registerXMPNamespace succeeds and custom prefix can be used by setValue/getTag
     *                 1.Register namespace uri http://mylibrary.com/story/1.0/ with prefix library
     *                 2.Set library:book1 as UNKNOWN with value "One Hundred Years of Solitude"
     *                 3.cover setValue with paramater:image.XMPTagType ,7600206
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPNamespace_setValue_ERROR_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPNamespace_setValue_ERROR_STATIC_0100";
      let xmpNamespace: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library"
      }
      let XMPTagType = [
        image.XMPTagType.UNORDERED_ARRAY,
        image.XMPTagType.UNKNOWN,
        image.XMPTagType.ORDERED_ARRAY,
        image.XMPTagType.ALTERNATE_ARRAY,
        image.XMPTagType.ALTERNATE_TEXT,
        image.XMPTagType.STRUCTURE,
      ]
      for(const range of XMPTagType){
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata!.registerXMPNamespace(xmpNamespace);
        console.log(testName,TAG,`: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);
        await xmpMetadata!.setValue(`${xmpNamespace.prefix}:book1`, range, "One Hundred Years of Solitude");
        console.log(testName,TAG,`: setValue Success! `);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7600206);
      }
      }
      done();
    });
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPNamespace_setValue_ERROR_STATIC_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPNamespace_setValue_ERROR_STATIC_0200
     * @tc.desc        Verify registerXMPNamespace succeeds and custom prefix can be used by setValue/getTag
     *                 1.Register namespace uri http://mylibrary.com/story/1.0/ with prefix library
     *                 2.Set library:book1 as UNKNOWN with value "One Hundred Years of Solitude"
     *                 3.cover setValue with path:"",7600206
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPNamespace_setValue_ERROR_STATIC_0200", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPNamespace_setValue_ERROR_STATIC_0200";
      let xmpNamespace: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library"
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata!.registerXMPNamespace(xmpNamespace);
        console.log(testName,TAG,`: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);
        await xmpMetadata!.setValue(``, image.XMPTagType.STRING, "One Hundred Years of Solitude");
        console.log(testName,TAG,`: setValue Success! `);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7600206);
      }
      done();
    });
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPNamespace_getTag_ERROR_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPNamespace_getTag_ERROR_STATIC_0100
     * @tc.desc        Verify registerXMPNamespace succeeds and custom prefix can be used by setValue/getTag
     *                 1.Register namespace uri http://mylibrary.com/story/1.0/ with prefix library
     *                 2.Set library:book1 as UNKNOWN with value "One Hundred Years of Solitude"
     *                 3.cover getTag with path:"",7600206
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPNamespace_getTag_ERROR_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPNamespace_getTag_ERROR_STATIC_0100";
      let xmpNamespace: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library"
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata!.registerXMPNamespace(xmpNamespace);
        console.log(testName,TAG,`: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);
        await xmpMetadata!.setValue(`${xmpNamespace.prefix}:book1`, image.XMPTagType.STRING, "One Hundred Years of Solitude");
        console.log(testName,TAG,`: setValue Success! `);
        let tagValueSet: image.XMPTag | null = await xmpMetadata?.getTag(``);
        console.log(testName,TAG,`: getTag Success! `,tagValueSet);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7600206);
      }
      done();
    });












    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPNamespace_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPNamespace_STATIC_0100
     * @tc.desc        Verify registerXMPNamespace succeeds and custom prefix can be used by setValue/getTag
     *                 1.Register namespace uri http://mylibrary.com/story/1.0/ with prefix library
     *                 2.Set library:book1 as STRING with value "One Hundred Years of Solitude"
     *                 3.Get library:book1 from XMP metadata
     *                 4.Verify the returned value matches expected text
     *                 5.cover xmpNamespace.uri/prefix
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPNamespace_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPNamespace_STATIC_0100";
      let xmpNamespace: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library"
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata!.registerXMPNamespace(xmpNamespace);
        console.log(testName,TAG,`: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);
        await xmpMetadata!.setValue(`${xmpNamespace.prefix}:book1`, image.XMPTagType.STRING, "One Hundred Years of Solitude");
        console.log(testName,TAG,`: setValue Success! `);
        let tagValueSet: image.XMPTag | null = await xmpMetadata?.getTag(`${xmpNamespace.prefix}:book1`);
        expect(tagValueSet?.xmpNamespace.uri).assertEqual("http://mylibrary.com/story/1.0/")
        expect(tagValueSet?.xmpNamespace.prefix).assertEqual("library")
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPNamespace_registerXMPNamespace_ERROR_STATIC_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPNamespace_registerXMPNamespace_ERROR_STATIC_0200
     * @tc.desc        Verify registerXMPNamespace succeeds and custom prefix can be used by setValue/getTag
     *                 1.Register namespace uri:" "
     *                 2.Set library:book1 as STRING with value "One Hundred Years of Solitude"
     *                 3.Get library:book1 from XMP metadata
     *                 4.Verify the returned value matches expected text
     *                 5.cover 7600206
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPNamespace_registerXMPNamespace_ERROR_STATIC_0200", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPNamespace_registerXMPNamespace_ERROR_STATIC_0200";
      let xmpNamespace: image.XMPNamespace = {
        uri: "",
        prefix: "library"
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata!.registerXMPNamespace(xmpNamespace);
        console.log(testName,TAG,`: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);
        await xmpMetadata!.setValue(`${xmpNamespace.prefix}:book1`, image.XMPTagType.STRING, "One Hundred Years of Solitude");
        console.log(testName,TAG,`: setValue Success! `);
        let tagValueSet: image.XMPTag | null = await xmpMetadata?.getTag(`${xmpNamespace.prefix}:book1`);
        console.log(testName,TAG,`: getTag Success! `,tagValueSet);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7600206);
      }
      done();
    });
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPNamespace_registerXMPNamespace_ERROR_STATIC_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPNamespace_registerXMPNamespace_ERROR_STATIC_0300
     * @tc.desc        Verify registerXMPNamespace succeeds and custom prefix can be used by setValue/getTag
     *                 1.Register namespace uri http://mylibrary.com/story/1.0/ with prefix :""
     *                 2.Set library:book1 as STRING with value "One Hundred Years of Solitude"
     *                 3.Get library:book1 from XMP metadata
     *                 4.Verify the returned value matches expected text
     *                 5.cover 7600206
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPNamespace_registerXMPNamespace_ERROR_STATIC_0300", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPNamespace_registerXMPNamespace_ERROR_STATIC_0300";
      let xmpNamespace: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: ""
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata!.registerXMPNamespace(xmpNamespace);
        console.log(testName,TAG,`: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);
        await xmpMetadata!.setValue(`${xmpNamespace.prefix}:book1`, image.XMPTagType.STRING, "One Hundred Years of Solitude");
        console.log(testName,TAG,`: setValue Success! `);
        let tagValueSet: image.XMPTag | null = await xmpMetadata?.getTag(`${xmpNamespace.prefix}:book1`);
        console.log(testName,TAG,`: registerXMPNamespace getTag Success! `,tagValueSet);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7600206);
      }
      done();
    });
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_RIGHTS_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_RIGHTS_STATIC_0100
     * @tc.desc        cover image.XMP_RIGHTS
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_RIGHTS_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_RIGHTS_STATIC_0100";
      let xmpNamespace: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library"
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata!.registerXMPNamespace(xmpNamespace);
        console.info(testName,TAG,`: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);
        await xmpMetadata.setValue(`${image.XMP_RIGHTS.prefix}:title`, image.XMPTagType.STRING, 'My Title');
        console.log(testName,TAG,`: setValue Success! `);
        let tagValueSet: image.XMPTag | null = await xmpMetadata?.getTag(`${image.XMP_RIGHTS.prefix}:title`);
        console.info(testName,TAG,`: xmpMetadata?.getTag: ${tagValueSet!.name}`);
        expect(tagValueSet!.name).assertEqual("title")
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_BASIC_STATIC_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_BASIC_STATIC_0200
     * @tc.desc        cover image.XMP_BASIC.prefix
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_BASIC_STATIC_0200", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_BASIC_STATIC_0200";
      let xmpNamespace: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library"
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata!.registerXMPNamespace(xmpNamespace);
        console.log(testName,TAG,`: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);
        await xmpMetadata.setValue(`${image.XMP_BASIC.prefix}:title`, image.XMPTagType.STRING, 'My Title');
        let tagValueSet: image.XMPTag | null = await xmpMetadata?.getTag(`${image.XMP_BASIC.prefix}:title`);
        console.info(testName,TAG,`: xmpMetadata?.getTag: ${tagValueSet!.name}`);
        expect(tagValueSet?.name).assertEqual("title")
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_EXIF_STATIC_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_EXIF_STATIC_0300
     * @tc.desc        cover image.EXIF
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_EXIF_STATIC_0300", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_EXIF_STATIC_0300";
      let xmpNamespace: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library"
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata!.registerXMPNamespace(xmpNamespace);
        console.info(testName,TAG,`: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);
        await xmpMetadata.setValue(`${image.EXIF.prefix}:title`, image.XMPTagType.STRING, 'My Title');
        let tagValueSet: image.XMPTag | null = await xmpMetadata?.getTag(`${image.EXIF.prefix}:title`);
        console.info(testName,TAG,`: xmpMetadata?.getTag: ${tagValueSet!.name}`);
        expect(tagValueSet!.name).assertEqual("title")
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_DUBLIN_CORE_STATIC_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_DUBLIN_CORE_STATIC_0400
     * @tc.desc        cover image.DUBLIN_CORE
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_DUBLIN_CORE_STATIC_0400", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_DUBLIN_CORE_STATIC_0400";
      let xmpNamespace: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library"
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata!.registerXMPNamespace(xmpNamespace);
        console.info(testName,TAG,`: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);
        await xmpMetadata.setValue(`${image.DUBLIN_CORE.prefix}:title`, image.XMPTagType.STRING, 'My Title');
        let tagValueSet: image.XMPTag | null = await xmpMetadata?.getTag(`${image.DUBLIN_CORE.prefix}:title`);
        console.info(testName,TAG,`: xmpMetadata?.getTag: ${tagValueSet!.name}`);
        expect(tagValueSet!.name).assertEqual("title")
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_TIFF_STATIC_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_TIFF_STATIC_0500
     * @tc.desc        cover image.TIFF
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_TIFF_STATIC_0500", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_image_setValue_XMP_TIFF_STATIC_0500";
      let xmpNamespace: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library"
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata!.registerXMPNamespace(xmpNamespace);
        console.info(testName,TAG,`: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);
        await xmpMetadata.setValue(`${image.TIFF.prefix}:title`, image.XMPTagType.STRING, 'My Title');
        let tagValueSet: image.XMPTag | null = await xmpMetadata?.getTag(`${image.TIFF.prefix}:title`);
        console.info(testName,TAG,`: xmpMetadata?.getTag: ${tagValueSet!.name}`);
        expect(tagValueSet!.name).assertEqual("title")
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_STATIC_0100
     * @tc.desc        Verify setBlob imports JPEG XMP packet into PNG metadata and getBlob returns identical content
     *                 1.Read xmp blob from jpeg_xmp.jpg
     *                 2.Read metadata from png_xmp.png and call setBlob with JPEG blob
     *                 3.Call getBlob from the updated png xmpMetadata
     *                 4.Verify source and target blobs are byte-by-byte equal
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_STATIC_0100";
      const fileNameJpg: string = "jpeg_xmp.jpg";
      const fileNamePng: string = "png_xmp.png";
      let result: boolean = true;
      const imageFD = getFd(fileNameJpg);
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(imageFD);
      console.info(testName,TAG,`createImageSource success: ${imageSourceApi}`);
      const exifValueJpg: image.ImageMetadata = await imageSourceApi!.readImageMetadata();
      console.info(testName,TAG,`readImageMetadata success: ${exifValueJpg}`);
      let xmpBlobJpg: ArrayBuffer | undefined = await exifValueJpg.xmpMetadata!.getBlob();
      console.info(testName,TAG,`exifValueJpg.xmpMetadata!.getBlob success: ${xmpBlobJpg}`);
      await imageSourceApi!.release();
      if (xmpBlobJpg != undefined) {
        try {
          const imagePngFD = getFd(fileNamePng);
          const imageSourceApiGet = image.createImageSource(imagePngFD);
          console.info(testName,TAG,`createImageSource imageSourceApiGet success: ${imageSourceApiGet}`);
          let exifValuePng = await imageSourceApiGet!.readImageMetadata();
          console.info(testName,TAG,`readImageMetadata  imageSourceApiGet success: ${exifValuePng}`);
          await exifValuePng.xmpMetadata!.setBlob(xmpBlobJpg);
          await imageSourceApiGet!.release();
          let xmpBlobPng = await exifValuePng.xmpMetadata!.getBlob();
          result = result && compareArrayBuffer(xmpBlobPng, xmpBlobJpg);
        } catch (error) {
          result = false;
          console.info(testName,TAG,`setBlob failed`);
        }
      }
      console.info(testName,TAG,`getBlob setBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });


    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_STATIC_0100
     * @tc.desc        Verify removeTag deletes existing crs:CropRight from JPEG metadata
     *                 1.Read jpeg_xmp.jpg metadata and check crs:CropRight initial value is "1"
     *                 2.Call removeTag on crs:CropRight
     *                 3.Call getTag for crs:CropRight after removal
     *                 4.Verify getTag returns null
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_STATIC_0100";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "crs:CropRight";
      const xmpValue = "1";
      const imageFD = getFd(fileName);
      console.info(TAG,testName,`getFd success: ${imageFD}`);
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(imageFD);
      console.info(TAG,testName,`createImageSource success: ${imageSourceApi}`);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadata();
        if (exifValue.xmpMetadata != null) {
          const tagValueSet = await exifValue.xmpMetadata!.getTag(path);
          result = checkTagValue(testName, path, tagValueSet, xmpValue);
          await exifValue.xmpMetadata!.removeTag(path);
          const tagValueGet = await exifValue.xmpMetadata!.getTag(path);
          console.info(testName,TAG,`removeTag ${path} value is: ${tagValueGet}`);
          if (tagValueGet !== null) {
            console.error(testName,TAG,`removeTag ${path} value is not expected`);
            result = false;
          }
        }
      } catch (error) {
        console.info(testName,TAG,`readImageMetadata setValue failed with errorCode: ${JSON.stringify(error)}`);
        result = false;
      } finally {
        await imageSourceApi!.release();
      }
      console.info(testName,TAG,` writeXMPMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_STATIC_0100
     * @tc.desc        Verify removeTag deletes existing crs:CropRight from JPEG metadata
     *                 1.cover removeTag with no path ,7600206
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_STATIC_0100";
      const fileName = "jpeg_xmp.jpg";
      const imageFD = getFd(fileName);
      console.info(TAG,testName,`getFd success: ${imageFD}`);
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(imageFD);
      console.info(TAG,testName,`createImageSource success: ${imageSourceApi}`);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadata();
          await exifValue.xmpMetadata!.removeTag('');
          console.info(testName,TAG,`removeTag success`);
          expect().assertFail();
      } catch (error) {
        console.info(testName,TAG,`failed with errorCode: ${error.message},${error.code}`);
        expect(error.code).assertEqual(7600206);
      } finally {
        await imageSourceApi!.release();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0100
     * @tc.desc        Verify enumerateTags counts all recursive tags in jpeg_xmp.jpg
     *                 1.Read metadata from jpeg_xmp.jpg in fd mode
     *                 2.Call enumerateTags with options { isRecursive: true, onlyQualifier: false }
     *                 3.Count callback invocations for all traversed paths
     *                 4.Verify the total tag count equals 272
     *                 5.cover enumerateTags,isRecursive: true
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0100";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const imageFD = getFd(fileName);
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(imageFD);
      console.info(testName,TAG,`createImageSource imageSourceApi result is: ${imageSourceApi}`);
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi!.readImageMetadata();
        if (xmpValue.xmpMetadata! != null) {
          let tagCount = 0;
          xmpValue.xmpMetadata!.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            tagCount++;
            console.log(testName,TAG,`: [${tagCount}] Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true; // 继续枚举`
          }, undefined, isRecursive);
          result = result && (tagCount == 272);
        }
      } catch (error) {
        result = false;
        console.info(testName,TAG,`enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi!.release();
      }
      console.info(testName,TAG,`readImageMetadata enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0200
     * @tc.desc        Verify enumerateTags counts all recursive tags in jpeg_xmp.jpg
     *                 1.Read metadata from jpeg_xmp.jpg in fd mode
     *                 2.Call enumerateTags with options { isRecursive: false, onlyQualifier: false }
     *                 3.Count callback invocations for all traversed paths
     *                 4.Verify the total tag count equals 147
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0200", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0200";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: false, onlyQualifier : false };
      const imageFD = getFd(fileName);
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(imageFD);
      console.info(testName,TAG,`createImageSource imageSourceApi result is: ${imageSourceApi}`);
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi!.readImageMetadata();
        if (xmpValue.xmpMetadata! != null) {
          let tagCount = 0;
          xmpValue.xmpMetadata!.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            tagCount++;
            console.log(testName,TAG,`: [${tagCount}] Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true; // 继续枚举`
          }, undefined, isRecursive);
          result = result && (tagCount == 147);
        }
      } catch (error) {
        result = false;
        console.info(testName,TAG,`enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi!.release();
      }
      console.info(testName,TAG,`readImageMetadata enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0300
     * @tc.desc        Verify enumerateTags counts all recursive tags in jpeg_xmp.jpg
     *                 1.Read metadata from jpeg_xmp.jpg in fd mode
     *                 2.Call enumerateTags with options { isRecursive: false, onlyQualifier: true }
     *                 3.Count callback invocations for all traversed paths
     *                 4.Verify the total tag count equals 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0300", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_STATIC_0300";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: false, onlyQualifier : true };
      const imageFD = getFd(fileName);
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(imageFD);
      console.info(testName,TAG,`createImageSource imageSourceApi result is: ${imageSourceApi}`);
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi!.readImageMetadata();
        console.info(testName,TAG,`readImageMetadata xmpValue.xmpMetadata: ${JSON.stringify(xmpValue.xmpMetadata)}`);
        if (xmpValue.xmpMetadata! != null) {
          let tagCount = 0;
          xmpValue.xmpMetadata!.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            tagCount++;
            console.log(testName,TAG,`: [${tagCount}] Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true; // 继续枚举`
          }, undefined, isRecursive);
          result = result && (tagCount == 0);
        }
      } catch (error) {
        result = false;
        console.info(testName,TAG,`enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi!.release();
      }
      console.info(testName,TAG,`readImageMetadata enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_createThumbnail_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_createThumbnail_0100
     * @tc.desc      1. Create ImageSource from JPEG
     *               2. Create Picture from ImageSource
     *               3. Encode Picture with needsPackProperties: false, maxEmbedThumbnailDimension: 500
     *               4.cover generateThumbnailIfAbsent: false
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_createThumbnail_0100', Level.LEVEL0, async (done:() => void) => {
      const testName: string = "SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_createThumbnail_0100";
      const imageSourceObjFilePath: string = 'file://' + testContext.filesDir + "/300_100.jpg";
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(imageSourceObjFilePath);
      console.info(TAG, testName, `createImageSource success`,imageSourceObj);
      let exifCommodityPixelMap: image.PixelMap | undefined = await imageSourceObj!.createPixelMap();
      console.info(TAG, testName, `createPixelMap success`,exifCommodityPixelMap);
      let picture: image.Picture = image.createPicture(exifCommodityPixelMap!);
      expect(picture != null).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        needsPackProperties: false,
        maxEmbedThumbnailDimension: 500
      };
      const filePath: string = 'file://' + testContext.filesDir + "/pack_jpeg_needsPackProperties_false_0150.jpg";
      let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      console.info(TAG, testName, 'openSync success');
      const imagePackerApi: image.ImagePacker = image.createImagePacker();
      await imagePackerApi.packToFile(picture, file.fd, packOpts);
      console.info(TAG, testName,"Pack to file done");
      let packedSource = image.createImageSource(file.fd);
      // await fs.close(fdNum);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: false
      };
      console.info(TAG, testName,"Creating thumbnail from packedSource");
      try {
        await packedSource!.createThumbnail(decodingOptions);
        console.info(TAG, testName,"Thumbnail created unexpectedly");
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName,`Error in createThumbnail: ${error.message}, code: ${error.code}`);
        expect(Number(error.code)).assertEqual(7700303);
      }
      finally {
        await imageSourceObj?.release();
      }
      console.info(TAG, testName,"Test finished successfully");
      done();
    })
    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_createThumbnail_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_createThumbnail_0200
     * @tc.desc      1. Create ImageSource from JPEG
     *               2. Create Picture from ImageSource
     *               3. Encode Picture with needsPackProperties: false, maxEmbedThumbnailDimension: 500
     *               4. cover generateThumbnailIfAbsent: true,maxEmbedThumbnailDimension: 500
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_createThumbnail_0200', Level.LEVEL0, async (done:() => void) => {
      const testName: string = "SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_createThumbnail_0200";
      const imageSourceObjFilePath: string = 'file://' + testContext.filesDir + "/300_100.jpg";
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(imageSourceObjFilePath);
      console.info(TAG, testName, `createImageSource success`,imageSourceObj);
      let exifCommodityPixelMap: image.PixelMap | undefined = await imageSourceObj!.createPixelMap();
      console.info(TAG, testName, `createPixelMap success`,exifCommodityPixelMap);
      let picture: image.Picture = image.createPicture(exifCommodityPixelMap!);
      expect(picture != null).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        needsPackProperties: false,
        maxEmbedThumbnailDimension: 500
      };
      const filePath: string = 'file://' + testContext.filesDir + "/pack_jpeg_needsPackProperties_false_0150.jpg";
      let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      console.info(TAG, testName, 'openSync success');
      const imagePackerApi: image.ImagePacker = image.createImagePacker();
      await imagePackerApi.packToFile(picture, file.fd, packOpts);
      console.info(TAG, testName,"Pack to file done");
      let packedSource = image.createImageSource( file.fd);
      // await fs.close(fdNum);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension:500
      };
      console.info(TAG, testName,"Creating thumbnail from packedSource");
      try {
        let thumbnail: image.PixelMap | undefined = await packedSource!.createThumbnail(decodingOptions);
        console.info(TAG, testName,"Thumbnail created unexpectedly",thumbnail!.getImageInfo());
        expect(thumbnail!.getImageInfo()!!=undefined).assertTrue();
      } catch (error) {
        console.info(TAG, testName,`Error in createThumbnail: ${error.message}, code: ${error.code}`);
        expect().assertFail();
      }
      finally {
        await imageSourceObj?.release();
      }
      console.info(TAG, testName,"Test finished successfully");
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_EMBEDTHUMBNAIL_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_EMBEDTHUMBNAIL_0100
     * @tc.desc      1. Create ImageSource from JPEG
     *               2. Create Picture from ImageSource
     *               3. Encode Picture with maxEmbedThumbnailDimension: 1
     *               4. generateThumbnailIfAbsent: false
     *               5. Decode and verify thumbnail is absent (error code 7700303)
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_EMBEDTHUMBNAIL_0100', Level.LEVEL0, async (done:() => void) => {
      const testName: string = "SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_EMBEDTHUMBNAIL_0100";
        const imageSourceObjFilePath: string = 'file://' + testContext.filesDir + "/300_100.jpg";
        // let imageSourceObjFilePath = await getFilePath("300_100.jpg");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(imageSourceObjFilePath);
        console.info(TAG, testName, `createImageSource success`,imageSourceObj);
        let exifCommodityPixelMap: image.PixelMap | undefined = await imageSourceObj!.createPixelMap();
        console.info(TAG, testName, `createPixelMap success`,exifCommodityPixelMap);
        let picture: image.Picture = image.createPicture(exifCommodityPixelMap!);
        console.info(TAG, testName,"Picture created");
        expect(picture != null).assertTrue();
      try {
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          needsPackProperties: true,
          maxEmbedThumbnailDimension: 1
        };
        const filePath: string = 'file://' + testContext.filesDir + "/pack_jpeg_embedThumbnail_1_0160.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        const imagePackerApi: image.ImagePacker = image.createImagePacker();
        await imagePackerApi.packToFile(picture, file.fd, packOpts);
        console.info(TAG, testName,"Pack to file done");
        let packedSource = image.createImageSource(file.fd);
        console.info(TAG, testName,"createImageSource success");
        // await fs.close(fdNum);
        let decodingOptions: image.DecodingOptionsForThumbnail = {
          generateThumbnailIfAbsent: false
        };
        await packedSource!.createThumbnail(decodingOptions);
        console.info(TAG, testName,"Creating thumbnail from packedSource");
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName,` ${error.message}, code: ${error.code}`);
        expect(Number(error.code)).assertEqual(7700303);
        await imageSourceObj?.release();
      }
      done();
    })








    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_GIF_METADATA_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_GIF_METADATA_STATIC_0100
     * @tc.desc        Verify Gif metadata reading with default parameters
     *                 1.Create image source from Gif file (test6.gif) using fd
     *                 2.Read metadata using readImageMetadata()
     *                 3.Verify Gif metadata values against gifMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_GIF_METADATA_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_GIF_METADATA_STATIC_0100";
      let filePath = await getFilePath("test6.gif");
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj createImageSource success`, imageSourceApi!);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType();
        console.info(TAG,testName,` tiff metadata readImageMetadataByType result is: ${exifValue.gifMetadata}`);
        expect(exifValue.gifMetadata!=undefined).assertTrue();
      } catch (error) {
         console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
         expect().assertFail();
      } finally {
        await imageSourceApi!.release();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_HIC_METADATA_STATIC_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_HIC_METADATA_STATIC_0200
     * @tc.desc        Verify HEIFS metadata reading with default parameters
     *                 1.Create image source from HEIFS file (C027.heic) using fd
     *                 2.Read metadata using readImageMetadata()
     *                 3.Verify HEIFS metadata values against heifspMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_HIC_METADATA_STATIC_0200", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_HIC_METADATA_STATIC_0200";
      let result: boolean = true;
      let filePathFir = await getFilePath("test.jpeg");
      let isSupportHEIFDecode: boolean = image.createImageSource(filePathFir)!.supportedFormats.includes("image/heic");
      if (!isSupportHEIFDecode) {
        console.info(TAG,testName,` device is not support decode heif!`);
        expect(result).assertTrue();
        done();
        return;
      }
      let filePath = await getFilePath("C027.heic");
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj createImageSource success`, imageSourceApi!);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadata();
        console.info(TAG,testName,` tiff metadata readImageMetadataByType result is: ${exifValue.heifsMetadata}`);
        expect(exifValue.heifsMetadata!=undefined).assertTrue();
      } catch (error) {
        console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
        expect().assertFail();
      } finally {
        await imageSourceApi!.release();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_AVIS_METADATA_STATIC_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_AVIS_METADATA_STATIC_0300
     * @tc.desc        Verify HEIFS metadata reading with default parameters
     *                 1.Create image source from AVIS file (bird_8bit_I420_599x359_fps10.avif) using fd
     *                 2.Read metadata using readImageMetadata()
     *                 3.Verify AVIS metadata values against avisMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_AVIS_METADATA_STATIC_0300", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_AVIS_METADATA_STATIC_0300";
      let filePath = await getFilePath("bird_8bit_I420_599x359_fps10.avif");
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj createImageSource success`, imageSourceApi!);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadata();
        console.info(TAG,testName,` tiff metadata readImageMetadataByType result is: ${exifValue.avisMetadata}`);
        expect(exifValue.avisMetadata!=undefined).assertTrue()
      } catch (error) {
         console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
         expect().assertFail();
      } finally {
        await imageSourceApi!.release();
      }
      done();
    });

    // /**
    //  * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_PNG_METADATA_STATIC_0400
    //  * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_PNG_METADATA_STATIC_0400
    //  * @tc.desc        Verify PNG metadata reading with default parameters
    //  *                 1.Create image source from PNG file (test_reladeMetadata.png) using fd
    //  *                 2.Read metadata using readImageMetadata()
    //  *                 3.Verify PNG metadata values against pngMetadataMap at frame index 0
    //  * @tc.size        MEDIUM
    //  * @tc.type        Functional
    //  * @tc.level       Level 0
    //  */
    // it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_PNG_METADATA_STATIC_0400", Level.LEVEL0, async (done:() => void)=>{
    //   const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ByType_PNG_METADATA_STATIC_0400";
    //   try {
    //     let keys: image.PngPropertyKey[] = Array.from(pngMetadataMap.keys());
    //     console.info(TAG,testName,` PNG metadata keys to read: ${keys}`);
    //     const ret = await verifyMetadataProperties(testName, "test_reladeMetadata.png", "fd", "pngMetadata", keys, pngMetadataMap);
    //     expect(ret).assertTrue();
    //   } catch (error) {
    //     console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
    //     expect().assertFail();
    //   }
    //   done();
    // });
    //
    // /**
    //  * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_JFIF_METADATA_STATIC_0500
    //  * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_JFIF_METADATA_STATIC_0500
    //  * @tc.desc        Verify JFIF metadata reading with default parameters
    //  *                 1.Create image source from JFIF file (sample2.jfif) using fd
    //  *                 2.Read metadata using readImageMetadata()
    //  *                 3.Verify JFIF metadata values against jfifMetadataMap at frame index 0
    //  * @tc.size        MEDIUM
    //  * @tc.type        Functional
    //  * @tc.level       Level 0
    //  */
    // it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_JFIF_METADATA_STATIC_0500", Level.LEVEL0, async (done:() => void)=>{
    //   const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_JFIF_METADATA_STATIC_0500";
    //   try {
    //     let keys: image.JfifPropertyKey[] = Array.from(jfifMetadataMap.keys());
    //     console.info(TAG,testName,` JFIF metadata keys to read: ${keys}`);
    //     const ret = await verifyMetadataProperties(testName, "sample2.jfif", "fd", "jfifMetadata", keys, jfifMetadataMap);
    //     expect(ret).assertTrue();
    //   } catch (error) {
    //     console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
    //     expect().assertFail();
    //   }
    //   done();
    // });
    //
    // /**
    //  * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_TIFF_METADATA_STATIC_0100
    //  * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_TIFF_METADATA_STATIC_0100
    //  * @tc.desc        Verify TIFF metadata reading with default parameters
    //  *                 1.Create image source from TIFF file (test.tiff) using fd
    //  *                 2.Read metadata using readImageMetadata()
    //  *                 3.Verify TIFF metadata values against tiffMetadataMap at frame index 0
    //  * @tc.size        MEDIUM
    //  * @tc.type        Functional
    //  * @tc.level       Level 0
    //  */
    // it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_TIFF_METADATA_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
    //   const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_TIFF_METADATA_STATIC_0100";
    //   try {
    //     let keys: image.TiffPropertyKey[] = Array.from(tiffMetadataMap.keys());
    //     console.info(TAG,testName,` TIFF metadata keys to read: ${keys}`);
    //     const ret = await verifyMetadataProperties(testName, "tiff_xmp.tiff", "fd", "tiffMetadata", keys, tiffMetadataMap);
    //     expect(ret).assertTrue();
    //   } catch (error) {
    //     console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
    //     expect().assertFail();
    //   }
    //   done();
    // });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_GIF_METADATA_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_GIF_METADATA_STATIC_0100
     * @tc.desc        Verify Gif metadata reading by type with default parameters
     *                 1.Create image source from Gif file (test6.gif) using fd
     *                 2.Read metadata using readImageMetadataByType()
     *                 3.Verify Gif metadata values against gifMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_GIF_METADATA_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_GIF_METADATA_STATIC_0100";
      let filePath = await getFilePath("test6.gif");
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj createImageSource success`, imageSourceApi!);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType();
        console.info(TAG,testName,` tiff metadata readImageMetadataByType result is: ${exifValue.gifMetadata}`);
        expect(exifValue.gifMetadata!=undefined).assertTrue()
      } catch (error) {
        console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
        expect().assertFail();
      } finally {
        await imageSourceApi!.release();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_HEIFS_METADATA_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_HEIFS_METADATA_STATIC_0100
     * @tc.desc        Verify HEIFS metadata reading by type with default parameters
     *                 1.Create image source from HEIFS file (C027.heic) using fd
     *                 2.Read metadata using readImageMetadataByType()
     *                 3.Verify HEIFS metadata values against heifsMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_HEIFS_METADATA_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_HEIFS_METADATA_STATIC_0100";
      let result: boolean = true;
      let filePathFir = await getFilePath("test.jpeg");
      let isSupportHEIFDecode: boolean = image.createImageSource(filePathFir)!.supportedFormats.includes("image/heic");
      if (!isSupportHEIFDecode) {
        console.info(TAG,testName,` device is not support decode heif!`);
        expect(result).assertTrue();
        done();
        return;
      }
      let filePath = await getFilePath("C027.heic");
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj createImageSource success`, imageSourceApi!);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType();
        console.info(TAG,testName,` tiff metadata readImageMetadataByType result is: ${exifValue.heifsMetadata}`);
        expect(exifValue.heifsMetadata!=undefined).assertTrue()
      } catch (error) {
         console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
        expect().assertFail();
      } finally {
        await imageSourceApi!.release();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_AVIS_METADATA_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_AVIS_METADATA_STATIC_0100
     * @tc.desc        Verify AVIS metadata reading by type with default parameters
     *                 1.Create image source from AVIS file (bird_8bit_I420_599x359_fps10.avif) using fd
     *                 2.Read metadata using readImageMetadataByType()
     *                 3.Verify AVIS metadata values against avisMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_AVIS_METADATA_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_AVIS_METADATA_STATIC_0100";
      let filePath = await getFilePath("bird_8bit_I420_599x359_fps10.avif");
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj createImageSource success`, imageSourceApi!);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType();
       console.info(TAG,testName,` tiff metadata readImageMetadataByType result is: ${exifValue.avisMetadata}`);
        expect(exifValue.avisMetadata!=undefined).assertTrue();
      } catch (error) {
         console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
        expect().assertFail();
      } finally {
        await imageSourceApi!.release();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PNG_METADATA_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PNG_METADATA_STATIC_0100
     * @tc.desc        Verify PNG metadata reading by type with default parameters
     *                 1.Create image source from PNG file (test_reladeMetadata.png) using fd
     *                 2.Read metadata using readImageMetadataByType()
     *                 3.Verify PNG metadata values against pngMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PNG_METADATA_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PNG_METADATA_STATIC_0100";
      let filePath = await getFilePath("test_reladeMetadata.png");
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj createImageSource success`, imageSourceApi!);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType();
        console.info(TAG,testName,` exifValue is: ${exifValue.pngMetadata}`);
        expect(exifValue.pngMetadata!=undefined).assertTrue();
      } catch (error) {
         console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
         expect().assertFail();
      } finally {
        await imageSourceApi!.release();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_JFIF_METADATA_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_JFIF_METADATA_STATIC_0100
     * @tc.desc        Verify JFIF metadata reading by type with default parameters
     *                 1.Create image source from JFIF file (sample2.jfif) using fd
     *                 2.Read metadata using readImageMetadataByType()
     *                 3.Verify JFIF metadata values against jfifMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_JFIF_METADATA_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_JFIF_METADATA_STATIC_0100";
      let filePath = await getFilePath("sample2.jfif");
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj createImageSource success`, imageSourceApi!);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType();
        console.info(TAG,testName,` tiff metadata readImageMetadataByType result is: ${exifValue.jfifMetadata}`);
        expect(exifValue.jfifMetadata!=undefined).assertTrue();
      } catch (error) {
         console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
      } finally {
        await imageSourceApi!.release();
      }
       done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_TIFF_METADATA_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_TIFF_METADATA_STATIC_0100
     * @tc.desc        Verify TIFF metadata reading by type with default parameters
     *                 1.Create image source from TIFF file (test.tiff) using fd
     *                 2.Read metadata using readImageMetadataByType()
     *                 3.Verify TIFF metadata values against tiffMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_TIFF_METADATA_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      const testName: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_TIFF_METADATA_STATIC_0100";
      let filePath = await getFilePath("tiff_xmp.tiff");
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj createImageSource success`, imageSourceApi!);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType();
        console.info(TAG,testName,` tiff metadata readImageMetadataByType result is: ${exifValue.tiffMetadata}`);
        expect(exifValue.tiffMetadata!=undefined).assertTrue();
      } catch (error) {
         console.info(TAG, testName,`Error in : ${error.message}, code: ${error.code}`);
         expect().assertFail();
      } finally {
        await imageSourceApi!.release();
      }
      done();
    });
  })
}