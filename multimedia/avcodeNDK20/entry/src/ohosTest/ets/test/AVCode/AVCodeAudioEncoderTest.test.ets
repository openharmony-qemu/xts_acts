/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libavcode from 'libavcode.so'

const OS_ACCOUNT_ERR_OK = 0;

export default function AVCodeAudioEncoderTest() {
  describe('AVCodeAudioEncoderTest', () => {

    // ========== OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE ==========

    /**
     * @tc.name   testAudioEncoderSetMaxInputBufferSize_Zero
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_MAXINPUTBUFFERSIZE_0100
     * @tc.desc   Verify that setting OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE to 0 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetMaxInputBufferSize_Zero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetMaxInputBufferSize_Zero();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetMaxInputBufferSize_Zero catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderSetMaxInputBufferSize_10M
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_MAXINPUTBUFFERSIZE_0200
     * @tc.desc   Verify that setting OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE to 10*1024*1024 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetMaxInputBufferSize_10M', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetMaxInputBufferSize_10M();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetMaxInputBufferSize_10M catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    // ========== OH_MD_KEY_AUDIO_ENCODER_PTS_MODE ==========

    /**
     * @tc.name   testAudioEncoderSetPTSMode_Default
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_PTSMODE_0100
     * @tc.desc   Verify that setting OH_MD_KEY_AUDIO_ENCODER_PTS_MODE to DEFAULT(0) succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetPTSMode_Default', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetPTSMode_Default();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetPTSMode_Default catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderSetPTSMode_ZeroStart
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_PTSMODE_0200
     * @tc.desc   Verify that setting OH_MD_KEY_AUDIO_ENCODER_PTS_MODE to ZERO_START(1) succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetPTSMode_ZeroStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetPTSMode_ZeroStart();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetPTSMode_ZeroStart catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderSetPTSMode_FirstInputStart
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_PTSMODE_0300
     * @tc.desc   Verify that setting OH_MD_KEY_AUDIO_ENCODER_PTS_MODE to FIRST_INPUT_START(2) succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetPTSMode_FirstInputStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetPTSMode_FirstInputStart();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetPTSMode_FirstInputStart catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderSetPTSMode_InvalidValue3
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_PTSMODE_0400
     * @tc.desc   Verify that setting OH_MD_KEY_AUDIO_ENCODER_PTS_MODE to invalid value 3 returns AV_ERR_INVALID_VAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetPTSMode_InvalidValue3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetPTSMode_InvalidValue3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetPTSMode_InvalidValue3 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderSetPTSMode_Negative
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_PTSMODE_0500
     * @tc.desc   Verify that setting OH_MD_KEY_AUDIO_ENCODER_PTS_MODE to -1 returns AV_ERR_INVALID_VAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetPTSMode_Negative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetPTSMode_Negative();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetPTSMode_Negative catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    // ========== OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT ==========

    /**
     * @tc.name   testAudioEncoderSetSampleConvert_Enable
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_SAMPLECONVERT_0100
     * @tc.desc   Verify that setting OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT to 1 (enable) succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetSampleConvert_Enable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetSampleConvert_Enable();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetSampleConvert_Enable catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderSetSampleConvert_Disable
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_SAMPLECONVERT_0200
     * @tc.desc   Verify that setting OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT to 0 (disable) succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetSampleConvert_Disable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetSampleConvert_Disable();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetSampleConvert_Disable catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderSetSampleConvert_Default
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_SAMPLECONVERT_0300
     * @tc.desc   Verify that Configure without setting ENABLE_SAMPLE_FORMAT_CONVERT succeeds (default disabled)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetSampleConvert_Default', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetSampleConvert_Default();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetSampleConvert_Default catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderSetSampleConvert_Invalid2
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_SAMPLECONVERT_0400
     * @tc.desc   Verify that setting ENABLE_SAMPLE_FORMAT_CONVERT to 2 returns AV_ERR_INVALID_VAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetSampleConvert_Invalid2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetSampleConvert_Invalid2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetSampleConvert_Invalid2 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderSetSampleConvert_Negative
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_SAMPLECONVERT_0500
     * @tc.desc   Verify that setting ENABLE_SAMPLE_FORMAT_CONVERT to -1 returns AV_ERR_INVALID_VAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetSampleConvert_Negative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetSampleConvert_Negative();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetSampleConvert_Negative catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderSetSampleConvert_WithUnsupportedFormat
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_SAMPLECONVERT_0600
     * @tc.desc   Verify that setting ENABLE_SAMPLE_FORMAT_CONVERT to 0 with SAMPLE_S24LE error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetSampleConvert_WithUnsupportedFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetSampleConvert_WithUnsupportedFormat();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetSampleConvert_WithUnsupportedFormat catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderSetSampleConvert_WithSupportedFormat
     * @tc.number SUB_AVCODEC_AUDIO_AAC_ENCODER_CONFIGURE_SAMPLECONVERT_0700
     * @tc.desc   Verify that setting ENABLE_SAMPLE_FORMAT_CONVERT to 1 with SAMPLE_S16LE succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderSetSampleConvert_WithSupportedFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderSetSampleConvert_WithSupportedFormat();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderSetSampleConvert_WithSupportedFormat catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    // ========== FLAC Encoder ==========

    /**
     * @tc.name   testAudioEncoderFLAC_SetMaxInputBufferSize
     * @tc.number SUB_AVCODEC_AUDIO_FLAC_ENCODER_CONFIGURE_MAXINPUTBUFFERSIZE_0100
     * @tc.desc   Verify FLAC encoder with OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderFLAC_SetMaxInputBufferSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderFLAC_SetMaxInputBufferSize();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderFLAC_SetMaxInputBufferSize catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderFLAC_SetPTSMode
     * @tc.number SUB_AVCODEC_AUDIO_FLAC_ENCODER_CONFIGURE_PTSMODE_0100
     * @tc.desc   Verify FLAC encoder with OH_MD_KEY_AUDIO_ENCODER_PTS_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderFLAC_SetPTSMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderFLAC_SetPTSMode();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderFLAC_SetPTSMode catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderFLAC_SetSampleConvert
     * @tc.number SUB_AVCODEC_AUDIO_FLAC_ENCODER_CONFIGURE_SAMPLECONVERT_0100
     * @tc.desc   Verify FLAC encoder with OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderFLAC_SetSampleConvert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderFLAC_SetSampleConvert();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderFLAC_SetSampleConvert catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    // ========== MP3 Encoder ==========

    /**
     * @tc.name   testAudioEncoderMP3_SetMaxInputBufferSize
     * @tc.number SUB_AVCODEC_AUDIO_MP3_ENCODER_CONFIGURE_MAXINPUTBUFFERSIZE_0100
     * @tc.desc   Verify MP3 encoder with OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderMP3_SetMaxInputBufferSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderMP3_SetMaxInputBufferSize();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderMP3_SetMaxInputBufferSize catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderMP3_SetPTSMode
     * @tc.number SUB_AVCODEC_AUDIO_MP3_ENCODER_CONFIGURE_PTSMODE_0100
     * @tc.desc   Verify MP3 encoder with OH_MD_KEY_AUDIO_ENCODER_PTS_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderMP3_SetPTSMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderMP3_SetPTSMode();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderMP3_SetPTSMode catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderMP3_SetSampleConvert
     * @tc.number SUB_AVCODEC_AUDIO_MP3_ENCODER_CONFIGURE_SAMPLECONVERT_0100
     * @tc.desc   Verify MP3 encoder with OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderMP3_SetSampleConvert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderMP3_SetSampleConvert();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderMP3_SetSampleConvert catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    // ========== OPUS Encoder ==========

    /**
     * @tc.name   testAudioEncoderOPUS_SetMaxInputBufferSize
     * @tc.number SUB_AVCODEC_AUDIO_OPUS_ENCODER_CONFIGURE_MAXINPUTBUFFERSIZE_0100
     * @tc.desc   Verify OPUS encoder with OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderOPUS_SetMaxInputBufferSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderOPUS_SetMaxInputBufferSize();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderOPUS_SetMaxInputBufferSize catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderOPUS_SetPTSMode
     * @tc.number SUB_AVCODEC_AUDIO_OPUS_ENCODER_CONFIGURE_PTSMODE_0100
     * @tc.desc   Verify OPUS encoder with OH_MD_KEY_AUDIO_ENCODER_PTS_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderOPUS_SetPTSMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderOPUS_SetPTSMode();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderOPUS_SetPTSMode catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderOPUS_SetSampleConvert
     * @tc.number SUB_AVCODEC_AUDIO_OPUS_ENCODER_CONFIGURE_SAMPLECONVERT_0100
     * @tc.desc   Verify OPUS encoder with OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderOPUS_SetSampleConvert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderOPUS_SetSampleConvert();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderOPUS_SetSampleConvert catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    // ========== AMRNB Encoder ==========

    /**
     * @tc.name   testAudioEncoderAMRNB_SetMaxInputBufferSize
     * @tc.number SUB_AVCODEC_AUDIO_AMRNB_ENCODER_CONFIGURE_MAXINPUTBUFFERSIZE_0100
     * @tc.desc   Verify AMRNB encoder with OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderAMRNB_SetMaxInputBufferSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderAMRNB_SetMaxInputBufferSize();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderAMRNB_SetMaxInputBufferSize catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderAMRNB_SetPTSMode
     * @tc.number SUB_AVCODEC_AUDIO_AMRNB_ENCODER_CONFIGURE_PTSMODE_0100
     * @tc.desc   Verify AMRNB encoder with OH_MD_KEY_AUDIO_ENCODER_PTS_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderAMRNB_SetPTSMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderAMRNB_SetPTSMode();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderAMRNB_SetPTSMode catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderAMRNB_SetSampleConvert
     * @tc.number SUB_AVCODEC_AUDIO_AMRNB_ENCODER_CONFIGURE_SAMPLECONVERT_0100
     * @tc.desc   Verify AMRNB encoder with OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderAMRNB_SetSampleConvert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderAMRNB_SetSampleConvert();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderAMRNB_SetSampleConvert catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    // ========== AMRWB Encoder ==========

    /**
     * @tc.name   testAudioEncoderAMRWB_SetMaxInputBufferSize
     * @tc.number SUB_AVCODEC_AUDIO_AMRWB_ENCODER_CONFIGURE_MAXINPUTBUFFERSIZE_0100
     * @tc.desc   Verify AMR-WB encoder with OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderAMRWB_SetMaxInputBufferSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderAMRWB_SetMaxInputBufferSize();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderAMRWB_SetMaxInputBufferSize catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderAMRWB_SetPTSMode
     * @tc.number SUB_AVCODEC_AUDIO_AMRWB_ENCODER_CONFIGURE_PTSMODE_0100
     * @tc.desc   Verify AMR-WB encoder with OH_MD_KEY_AUDIO_ENCODER_PTS_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderAMRWB_SetPTSMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderAMRWB_SetPTSMode();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderAMRWB_SetPTSMode catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderAMRWB_SetSampleConvert
     * @tc.number SUB_AVCODEC_AUDIO_AMRWB_ENCODER_CONFIGURE_SAMPLECONVERT_0100
     * @tc.desc   Verify AMR-WB encoder with OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderAMRWB_SetSampleConvert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderAMRWB_SetSampleConvert();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderAMRWB_SetSampleConvert catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    // ========== G711mu Encoder ==========

    /**
     * @tc.name   testAudioEncoderG711mu_SetMaxInputBufferSize
     * @tc.number SUB_AVCODEC_AUDIO_G711MU_ENCODER_CONFIGURE_MAXINPUTBUFFERSIZE_0100
     * @tc.desc   Verify G711mu encoder with OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderG711mu_SetMaxInputBufferSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderG711mu_SetMaxInputBufferSize();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderG711mu_SetMaxInputBufferSize catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderG711mu_SetPTSMode
     * @tc.number SUB_AVCODEC_AUDIO_G711MU_ENCODER_CONFIGURE_PTSMODE_0100
     * @tc.desc   Verify G711mu encoder with OH_MD_KEY_AUDIO_ENCODER_PTS_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderG711mu_SetPTSMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderG711mu_SetPTSMode();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderG711mu_SetPTSMode catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioEncoderG711mu_SetSampleConvert
     * @tc.number SUB_AVCODEC_AUDIO_G711MU_ENCODER_CONFIGURE_SAMPLECONVERT_0100
     * @tc.desc   Verify G711mu encoder with OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAudioEncoderG711mu_SetSampleConvert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let result: number = libavcode.AudioEncoderG711mu_SetSampleConvert();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioEncoderG711mu_SetSampleConvert catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

  });
}
