'use static';
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { image } from "@kit.ImageKit";
const TAG = 'XTS.DngPropertyKey'

export default function DngPropertyKeyTest(): void {
  describe('DngPropertyKeyTest', (): void => {
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

    /**
     * @tc.number  SUB_IMAGE_MEDIA_DNG_PROPERTY_KEY_0100
     * @tc.name    SUB_IMAGE_MEDIA_DNG_PROPERTY_KEY_0100
     * @tc.desc    DngPropertyKey 枚举值覆盖
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_MEDIA_DNG_PROPERTY_KEY_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_IMAGE_MEDIA_DNG_PROPERTY_KEY_0100';
      try {
        expect(image.DngPropertyKey.DNG_VERSION).assertEqual('DNGVersion');
        expect(image.DngPropertyKey.DNG_BACKWARD_VERSION).assertEqual('DNGBackwardVersion');
        expect(image.DngPropertyKey.UNIQUE_CAMERA_MODEL).assertEqual('UniqueCameraModel');
        expect(image.DngPropertyKey.LOCALIZED_CAMERA_MODEL).assertEqual('LocalizedCameraModel');
        expect(image.DngPropertyKey.CFA_PLANE_COLOR).assertEqual('CFAPlaneColor');
        expect(image.DngPropertyKey.CFA_LAYOUT).assertEqual('CFALayout');
        expect(image.DngPropertyKey.LINEARIZATION_TABLE).assertEqual('LinearizationTable');
        expect(image.DngPropertyKey.BLACK_LEVEL_REPEAT_DIM).assertEqual('BlackLevelRepeatDim');
        expect(image.DngPropertyKey.BLACK_LEVEL).assertEqual('BlackLevel');
        expect(image.DngPropertyKey.BLACK_LEVEL_DELTA_H).assertEqual('BlackLevelDeltaH');
        expect(image.DngPropertyKey.BLACK_LEVEL_DELTA_V).assertEqual('BlackLevelDeltaV');
        expect(image.DngPropertyKey.WHITE_LEVEL).assertEqual('WhiteLevel');
        expect(image.DngPropertyKey.DEFAULT_SCALE).assertEqual('DefaultScale');
        expect(image.DngPropertyKey.DEFAULT_CROP_ORIGIN).assertEqual('DefaultCropOrigin');
        expect(image.DngPropertyKey.DEFAULT_CROP_SIZE).assertEqual('DefaultCropSize');
        expect(image.DngPropertyKey.COLOR_MATRIX1).assertEqual('ColorMatrix1');
        expect(image.DngPropertyKey.COLOR_MATRIX2).assertEqual('ColorMatrix2');
        expect(image.DngPropertyKey.CAMERA_CALIBRATION1).assertEqual('CameraCalibration1');
        expect(image.DngPropertyKey.CAMERA_CALIBRATION2).assertEqual('CameraCalibration2');
        expect(image.DngPropertyKey.REDUCTION_MATRIX1).assertEqual('ReductionMatrix1');
        expect(image.DngPropertyKey.REDUCTION_MATRIX2).assertEqual('ReductionMatrix2');
        expect(image.DngPropertyKey.ANALOG_BALANCE).assertEqual('AnalogBalance');
        expect(image.DngPropertyKey.AS_SHOT_NEUTRAL).assertEqual('AsShotNeutral');
        expect(image.DngPropertyKey.AS_SHOT_WHITEXY).assertEqual('AsShotWhiteXY');
        expect(image.DngPropertyKey.BASELINE_EXPOSURE).assertEqual('BaselineExposure');
        expect(image.DngPropertyKey.BASELINE_NOISE).assertEqual('BaselineNoise');
        expect(image.DngPropertyKey.BASELINE_SHARPNESS).assertEqual('BaselineSharpness');
        expect(image.DngPropertyKey.BAYER_GREEN_SPLIT).assertEqual('BayerGreenSplit');
        expect(image.DngPropertyKey.LINEAR_RESPONSE_LIMIT).assertEqual('LinearResponseLimit');
        expect(image.DngPropertyKey.CAMERA_SERIAL_NUMBER).assertEqual('CameraSerialNumber');
        expect(image.DngPropertyKey.LENS_INFO).assertEqual('LensInfo');
        expect(image.DngPropertyKey.CHROMA_BLUR_RADIUS).assertEqual('ChromaBlurRadius');
        expect(image.DngPropertyKey.ANTI_ALIAS_STRENGTH).assertEqual('AntiAliasStrength');
        expect(image.DngPropertyKey.SHADOW_SCALE).assertEqual('ShadowScale');
        expect(image.DngPropertyKey.DNG_PRIVATE_DATA).assertEqual('DNGPrivateData');
        expect(image.DngPropertyKey.MAKER_NOTE_SAFETY).assertEqual('MakerNoteSafety');
        expect(image.DngPropertyKey.CALIBRATION_ILLUMINANT1).assertEqual('CalibrationIlluminant1');
        expect(image.DngPropertyKey.CALIBRATION_ILLUMINANT2).assertEqual('CalibrationIlluminant2');
        expect(image.DngPropertyKey.BEST_QUALITY_SCALE).assertEqual('BestQualityScale');
        expect(image.DngPropertyKey.RAW_DATA_UNIQUE_ID).assertEqual('RawDataUniqueID');
        expect(image.DngPropertyKey.ORIGINAL_RAW_FILE_NAME).assertEqual('OriginalRawFileName');
        expect(image.DngPropertyKey.ORIGINAL_RAW_FILE_DATA).assertEqual('OriginalRawFileData');
        expect(image.DngPropertyKey.ACTIVE_AREA).assertEqual('ActiveArea');
        expect(image.DngPropertyKey.MASKED_AREAS).assertEqual('MaskedAreas');
        expect(image.DngPropertyKey.AS_SHOT_ICC_PROFILE).assertEqual('AsShotICCProfile');
        expect(image.DngPropertyKey.AS_SHOT_PRE_PROFILE_MATRIX).assertEqual('AsShotPreProfileMatrix');
        expect(image.DngPropertyKey.CURRENT_ICC_PROFILE).assertEqual('CurrentICCProfile');
        expect(image.DngPropertyKey.CURRENT_PRE_PROFILE_MATRIX).assertEqual('CurrentPreProfileMatrix');
        expect(image.DngPropertyKey.COLORIMETRIC_REFERENCE).assertEqual('ColorimetricReference');
        expect(image.DngPropertyKey.CAMERA_CALIBRATION_SIGNATURE).assertEqual('CameraCalibrationSignature');
        expect(image.DngPropertyKey.PROFILE_CALIBRATION_SIGNATURE).assertEqual('ProfileCalibrationSignature');
        expect(image.DngPropertyKey.EXTRA_CAMERA_PROFILES).assertEqual('ExtraCameraProfiles');
        expect(image.DngPropertyKey.AS_SHOT_PROFILE_NAME).assertEqual('AsShotProfileName');
        expect(image.DngPropertyKey.NOISE_REDUCTION_APPLIED).assertEqual('NoiseReductionApplied');
        expect(image.DngPropertyKey.PROFILE_NAME).assertEqual('ProfileName');
        expect(image.DngPropertyKey.PROFILE_HUE_SAT_MAP_DIMS).assertEqual('ProfileHueSatMapDims');
        expect(image.DngPropertyKey.PROFILE_HUE_SAT_MAP_DATA1).assertEqual('ProfileHueSatMapData1');
        expect(image.DngPropertyKey.PROFILE_HUE_SAT_MAP_DATA2).assertEqual('ProfileHueSatMapData2');
        expect(image.DngPropertyKey.PROFILE_TONE_CURVE).assertEqual('ProfileToneCurve');
        expect(image.DngPropertyKey.PROFILE_EMBED_POLICY).assertEqual('ProfileEmbedPolicy');
        expect(image.DngPropertyKey.PROFILE_COPYRIGHT).assertEqual('ProfileCopyright');
        expect(image.DngPropertyKey.FORWARD_MATRIX1).assertEqual('ForwardMatrix1');
        expect(image.DngPropertyKey.FORWARD_MATRIX2).assertEqual('ForwardMatrix2');
        expect(image.DngPropertyKey.PREVIEW_APPLICATION_NAME).assertEqual('PreviewApplicationName');
        expect(image.DngPropertyKey.PREVIEW_APPLICATION_VERSION).assertEqual('PreviewApplicationVersion');
        expect(image.DngPropertyKey.PREVIEW_SETTINGS_NAME).assertEqual('PreviewSettingsName');
        expect(image.DngPropertyKey.PREVIEW_SETTINGS_DIGEST).assertEqual('PreviewSettingsDigest');
        expect(image.DngPropertyKey.PREVIEW_COLOR_SPACE).assertEqual('PreviewColorSpace');
        expect(image.DngPropertyKey.PREVIEW_DATE_TIME).assertEqual('PreviewDateTime');
        expect(image.DngPropertyKey.RAW_IMAGE_DIGEST).assertEqual('RawImageDigest');
        expect(image.DngPropertyKey.ORIGINAL_RAW_FILE_DIGEST).assertEqual('OriginalRawFileDigest');
        expect(image.DngPropertyKey.SUB_TILE_BLOCK_SIZE).assertEqual('SubTileBlockSize');
        expect(image.DngPropertyKey.ROW_INTERLEAVE_FACTOR).assertEqual('RowInterleaveFactor');
        expect(image.DngPropertyKey.PROFILE_LOOK_TABLE_DIMS).assertEqual('ProfileLookTableDims');
        expect(image.DngPropertyKey.PROFILE_LOOK_TABLE_DATA).assertEqual('ProfileLookTableData');
        expect(image.DngPropertyKey.OPCODE_LIST1).assertEqual('OpcodeList1');
        expect(image.DngPropertyKey.OPCODE_LIST2).assertEqual('OpcodeList2');
        expect(image.DngPropertyKey.OPCODE_LIST3).assertEqual('OpcodeList3');
        expect(image.DngPropertyKey.NOISE_PROFILE).assertEqual('NoiseProfile');
        expect(image.DngPropertyKey.ORIGINAL_DEFAULT_FINAL_SIZE).assertEqual('OriginalDefaultFinalSize');
        expect(image.DngPropertyKey.ORIGINAL_BEST_QUALITY_FINAL_SIZE).assertEqual('OriginalBestQualityFinalSize');
        expect(image.DngPropertyKey.ORIGINAL_DEFAULT_CROP_SIZE).assertEqual('OriginalDefaultCropSize');
        expect(image.DngPropertyKey.PROFILE_HUE_SAT_MAP_ENCODING).assertEqual('ProfileHueSatMapEncoding');
        expect(image.DngPropertyKey.PROFILE_LOOK_TABLE_ENCODING).assertEqual('ProfileLookTableEncoding');
        expect(image.DngPropertyKey.BASELINE_EXPOSURE_OFFSET).assertEqual('BaselineExposureOffset');
        expect(image.DngPropertyKey.DEFAULT_BLACK_RENDER).assertEqual('DefaultBlackRender');
        expect(image.DngPropertyKey.NEW_RAW_IMAGE_DIGEST).assertEqual('NewRawImageDigest');
        expect(image.DngPropertyKey.RAW_TO_PREVIEW_GAIN).assertEqual('RawToPreviewGain');
        expect(image.DngPropertyKey.DEFAULT_USER_CROP).assertEqual('DefaultUserCrop');
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number  SUB_IMAGE_MEDIA_METADATA_TYPE_0100
     * @tc.name    SUB_IMAGE_MEDIA_METADATA_TYPE_0100
     * @tc.desc    MetadataType 枚举值覆盖
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_MEDIA_METADATA_TYPE_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_IMAGE_MEDIA_METADATA_TYPE_0100';
      try {
        expect(image.MetadataType.DNG_METADATA).assertEqual(16);
        expect(image.MetadataType.WEBP_METADATA).assertEqual(17);
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number  SUB_IMAGE_MEDIA_WEB_PROPERTY_KEY_0100
     * @tc.name    SUB_IMAGE_MEDIA_WEB_PROPERTY_KEY_0100
     * @tc.desc    WebPPropertyKey 枚举值覆盖
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_MEDIA_WEB_PROPERTY_KEY_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_IMAGE_MEDIA_WEB_PROPERTY_KEY_0100';
      try {
        expect(image.WebPPropertyKey.CANVAS_WIDTH).assertEqual('WebPCanvasWidth');
        expect(image.WebPPropertyKey.CANVAS_HEIGHT).assertEqual('WebPCanvasHeight');
        expect(image.WebPPropertyKey.DELAY_TIME).assertEqual('WebPDelayTime');
        expect(image.WebPPropertyKey.UNCLAMPED_DELAY_TIME).assertEqual('WebPUnclampedDelayTime');
        expect(image.WebPPropertyKey.LOOP_COUNT).assertEqual('WebPLoopCount');
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}