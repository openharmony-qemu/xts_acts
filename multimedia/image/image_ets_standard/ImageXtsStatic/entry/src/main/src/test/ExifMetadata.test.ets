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

import image from '@ohos.multimedia.image';
import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";

const TAG = 'ImageExifMetadataStaticTest:'

export default function ImageExifMetadataStaticTest() {
  describe('ImageExifMetadataStaticTest', (): void => {
    beforeAll(() => {
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

    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_002
     * @tc.name       SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_002
     * @tc.desc       Metadata -ExifMetadata -getAllProperties -返回值为undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_002';
      try {
        let testExifMetadata: image.ExifMetadata = image.ExifMetadata.createInstance();
        expect(testExifMetadata != undefined).assertTrue();
        expect(testExifMetadata.newSubfileType != undefined).assertTrue();
        expect(testExifMetadata.subfileType != undefined).assertTrue();
        expect(testExifMetadata.imageWidth != undefined).assertTrue();
        expect(testExifMetadata.imageLength != undefined).assertTrue();
        expect(testExifMetadata.bitsPerSample != undefined).assertTrue();
        expect(testExifMetadata.compression != undefined).assertTrue();
        expect(testExifMetadata.photometricInterpretation != undefined).assertTrue();
        expect(testExifMetadata.imageDescription != undefined).assertTrue();
        expect(testExifMetadata.make != undefined).assertTrue();
        expect(testExifMetadata.model != undefined).assertTrue();
        expect(testExifMetadata.stripOffsets != undefined).assertTrue();
        expect(testExifMetadata.orientation != undefined).assertTrue();
        expect(testExifMetadata.samplesPerPixel != undefined).assertTrue();
        expect(testExifMetadata.rowsPerStrip != undefined).assertTrue();
        expect(testExifMetadata.stripByteCounts != undefined).assertTrue();
        expect(testExifMetadata.xResolution != undefined).assertTrue();
        expect(testExifMetadata.yResolution != undefined).assertTrue();
        expect(testExifMetadata.planarConfiguration != undefined).assertTrue();
        expect(testExifMetadata.resolutionUnit != undefined).assertTrue();
        expect(testExifMetadata.transferFunction != undefined).assertTrue();
        expect(testExifMetadata.software != undefined).assertTrue();
        expect(testExifMetadata.dateTime != undefined).assertTrue();
        expect(testExifMetadata.artist != undefined).assertTrue();
        expect(testExifMetadata.whitePoint != undefined).assertTrue();
        expect(testExifMetadata.primaryChromaticities != undefined).assertTrue();
        expect(testExifMetadata.photoMode != undefined).assertTrue();
        expect(testExifMetadata.jpegInterchangeFormat != undefined).assertTrue();
        expect(testExifMetadata.jpegInterchangeFormatLength != undefined).assertTrue();
        expect(testExifMetadata.yCbCrCoefficients != undefined).assertTrue();
        expect(testExifMetadata.yCbCrSubSampling != undefined).assertTrue();
        expect(testExifMetadata.yCbCrPositioning != undefined).assertTrue();
        expect(testExifMetadata.referenceBlackWhite != undefined).assertTrue();
        expect(testExifMetadata.copyright != undefined).assertTrue();
        expect(testExifMetadata.exposureTime != undefined).assertTrue();
        expect(testExifMetadata.fNumber != undefined).assertTrue();
        expect(testExifMetadata.exposureProgram != undefined).assertTrue();
        expect(testExifMetadata.spectralSensitivity != undefined).assertTrue();
        expect(testExifMetadata.gpsVersionID != undefined).assertTrue();
        expect(testExifMetadata.gpsLatitudeRef != undefined).assertTrue();
        expect(testExifMetadata.gpsLatitude != undefined).assertTrue();
        expect(testExifMetadata.gpsLongitudeRef != undefined).assertTrue();
        expect(testExifMetadata.gpsLongitude != undefined).assertTrue();
        expect(testExifMetadata.gpsAltitudeRef != undefined).assertTrue();
        expect(testExifMetadata.gpsAltitude != undefined).assertTrue();
        expect(testExifMetadata.gpsTimestamp != undefined).assertTrue();
        expect(testExifMetadata.gpsSatellites != undefined).assertTrue();
        expect(testExifMetadata.gpsStatus != undefined).assertTrue();
        expect(testExifMetadata.gpsMeasureMode != undefined).assertTrue();
        expect(testExifMetadata.gpsDop != undefined).assertTrue();
        expect(testExifMetadata.gpsSpeedRef != undefined).assertTrue();
        expect(testExifMetadata.gpsSpeed != undefined).assertTrue();
        expect(testExifMetadata.gpsTrackRef != undefined).assertTrue();
        expect(testExifMetadata.gpsTrack != undefined).assertTrue();
        expect(testExifMetadata.gpsImgDirectionRef != undefined).assertTrue();
        expect(testExifMetadata.gpsImgDirection != undefined).assertTrue();
        expect(testExifMetadata.gpsMapDatum != undefined).assertTrue();
        expect(testExifMetadata.gpsDestLatitudeRef != undefined).assertTrue();
        expect(testExifMetadata.gpsDestLatitude != undefined).assertTrue();
        expect(testExifMetadata.gpsDestLongitudeRef != undefined).assertTrue();
        expect(testExifMetadata.gpsDestLongitude != undefined).assertTrue();
        expect(testExifMetadata.gpsDestBearingRef != undefined).assertTrue();
        expect(testExifMetadata.gpsDestBearing != undefined).assertTrue();
        expect(testExifMetadata.gpsDestDistanceRef != undefined).assertTrue();
        expect(testExifMetadata.gpsDestDistance != undefined).assertTrue();
        expect(testExifMetadata.gpsProcessingMethod != undefined).assertTrue();
        expect(testExifMetadata.gpsAreaInformation != undefined).assertTrue();
        expect(testExifMetadata.gpsDateStamp != undefined).assertTrue();
        expect(testExifMetadata.gpsDifferential != undefined).assertTrue();
        expect(testExifMetadata.gpsHPositioningError != undefined).assertTrue();
        expect(testExifMetadata.isoSpeedRatings != undefined).assertTrue();
        expect(testExifMetadata.photographicSensitivity != undefined).assertTrue();
        expect(testExifMetadata.oecf != undefined).assertTrue();
        expect(testExifMetadata.sensitivityType != undefined).assertTrue();
        expect(testExifMetadata.standardOutputSensitivity != undefined).assertTrue();
        expect(testExifMetadata.recommendedExposureIndex != undefined).assertTrue();
        expect(testExifMetadata.isoSpeedLatitudeyyy != undefined).assertTrue();
        expect(testExifMetadata.isoSpeedLatitudezzz != undefined).assertTrue();
        expect(testExifMetadata.exifVersion != undefined).assertTrue();
        expect(testExifMetadata.dateTimeOriginal != undefined).assertTrue();
        expect(testExifMetadata.dateTimeDigitized != undefined).assertTrue();
        expect(testExifMetadata.offsetTime != undefined).assertTrue();
        expect(testExifMetadata.offsetTimeOriginal != undefined).assertTrue();
        expect(testExifMetadata.offsetTimeDigitized != undefined).assertTrue();
        expect(testExifMetadata.componentsConfiguration != undefined).assertTrue();
        expect(testExifMetadata.compressedBitsPerPixel != undefined).assertTrue();
        expect(testExifMetadata.shutterSpeedValue != undefined).assertTrue();
        expect(testExifMetadata.apertureValue != undefined).assertTrue();
        expect(testExifMetadata.brightnessValue != undefined).assertTrue();
        expect(testExifMetadata.exposureBiasValue != undefined).assertTrue();
        expect(testExifMetadata.maxApertureValue != undefined).assertTrue();
        expect(testExifMetadata.subjectDistance != undefined).assertTrue();
        expect(testExifMetadata.meteringMode != undefined).assertTrue();
        expect(testExifMetadata.lightSource != undefined).assertTrue();
        expect(testExifMetadata.flash != undefined).assertTrue();
        expect(testExifMetadata.focalLength != undefined).assertTrue();
        expect(testExifMetadata.subjectArea != undefined).assertTrue();
        expect(testExifMetadata.makerNote != undefined).assertTrue();
        expect(testExifMetadata.userComment != undefined).assertTrue();
        expect(testExifMetadata.subsecTime != undefined).assertTrue();
        expect(testExifMetadata.subsecTimeOriginal != undefined).assertTrue();
        expect(testExifMetadata.subsecTimeDigitized != undefined).assertTrue();
        expect(testExifMetadata.flashpixVersion != undefined).assertTrue();
        expect(testExifMetadata.colorSpace != undefined).assertTrue();
        expect(testExifMetadata.pixelXDimension != undefined).assertTrue();
        expect(testExifMetadata.pixelYDimension != undefined).assertTrue();
        expect(testExifMetadata.relatedSoundFile != undefined).assertTrue();
        expect(testExifMetadata.flashEnergy != undefined).assertTrue();
        expect(testExifMetadata.spatialFrequencyResponse != undefined).assertTrue();
        expect(testExifMetadata.focalPlaneXResolution != undefined).assertTrue();
        expect(testExifMetadata.focalPlaneYResolution != undefined).assertTrue();
        expect(testExifMetadata.focalPlaneResolutionUnit != undefined).assertTrue();
        expect(testExifMetadata.subjectLocation != undefined).assertTrue();
        expect(testExifMetadata.exposureIndex != undefined).assertTrue();
        expect(testExifMetadata.sensingMethod != undefined).assertTrue();
        expect(testExifMetadata.fileSource != undefined).assertTrue();
        expect(testExifMetadata.sceneType != undefined).assertTrue();
        expect(testExifMetadata.cfaPattern != undefined).assertTrue();
        expect(testExifMetadata.customRendered != undefined).assertTrue();
        expect(testExifMetadata.exposureMode != undefined).assertTrue();
        expect(testExifMetadata.whiteBalance != undefined).assertTrue();
        expect(testExifMetadata.digitalZoomRatio != undefined).assertTrue();
        expect(testExifMetadata.focalLengthIn35mmFilm != undefined).assertTrue();
        expect(testExifMetadata.sceneCaptureType != undefined).assertTrue();
        expect(testExifMetadata.gainControl != undefined).assertTrue();
        expect(testExifMetadata.contrast != undefined).assertTrue();
        expect(testExifMetadata.saturation != undefined).assertTrue();
        expect(testExifMetadata.sharpness != undefined).assertTrue();
        expect(testExifMetadata.deviceSettingDescription != undefined).assertTrue();
        expect(testExifMetadata.subjectDistanceRange != undefined).assertTrue();
        expect(testExifMetadata.imageUniqueId != undefined).assertTrue();
        expect(testExifMetadata.cameraOwnerName != undefined).assertTrue();
        expect(testExifMetadata.bodySerialNumber != undefined).assertTrue();
        expect(testExifMetadata.lensSpecification != undefined).assertTrue();
        expect(testExifMetadata.lensMake != undefined).assertTrue();
        expect(testExifMetadata.lensModel != undefined).assertTrue();
        expect(testExifMetadata.lensSerialNumber != undefined).assertTrue();
        expect(testExifMetadata.compositeImage != undefined).assertTrue();
        expect(testExifMetadata.sourceImageNumberOfCompositeImage != undefined).assertTrue();
        expect(testExifMetadata.sourceExposureTimesOfCompositeImage != undefined).assertTrue();
        expect(testExifMetadata.gamma != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

  });
}