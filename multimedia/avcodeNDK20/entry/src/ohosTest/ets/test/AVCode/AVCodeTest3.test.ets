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

export default function AVCodeTest3() {
  describe('AVCodeTest3', () => {
    /**
     * @tc.number SUB_AVCode_OH_AudioEncoderDestroy_001
     * @tc.name testAVCodeOHAudioEncoderDestroy001
     * @tc.desc Verify that AVCodeOHAudioEncoderDestroySuccess function correctly handles successful audio encoder destruction
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderDestroySuccess();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderDestroy001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoderDestroy_002
     * @tc.name testAVCodeOHAudioEncoderDestroy002
     * @tc.desc Verify that AVCodeOHAudioEncoderDestroyInvalidVal function properly handles invalid parameters during encoder destruction
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderDestroy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderDestroyInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderDestroy002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoderConfigure_002
     * @tc.name testAVCodeOHAudioEncoderConfigure002
     * @tc.desc Verify that AVCodeOHAudioEncoderConfigureInvalidVal function validates invalid configuration parameters correctly
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderConfigure002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderConfigureInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderConfigure002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioCodecConfigure_001
     * @tc.name testAVCodeOHAudioEncoderConfigure010
     * @tc.desc Verify that AVCodeOHAudioEncoderConfigureUnsupport function handles unsupported configuration parameters properly
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderConfigure010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderConfigureUnsupport();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderConfigure010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoderPrepare_002
     * @tc.name testAVCodeOHAudioEncoderPrepare002
     * @tc.desc Verify that AVCodeOHAudioEncoderPrepareInvalidVal function validates invalid parameters during encoder preparation
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderPrepare002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderPrepareInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderPrepare002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoderPrepare_010
     * @tc.name testAVCodeOHAudioEncoderPrepare010
     * @tc.desc Verify that AVCodeOHAudioEncoderConfigureUnsupport function handles unsupported configurations during encoder preparation
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderPrepare010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderConfigureUnsupport();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderPrepare010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoderStart_002
     * @tc.name testAVCodeOHAudioEncoderStart002
     * @tc.desc Verify that AVCodeOHAudioEncoderStartInvalidVal function validates invalid parameters during encoder startup
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderStart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderStartInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderStart002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoderStart_009
     * @tc.name testAVCodeOHAudioEncoderStart009
     * @tc.desc Verify that AVCodeOHAudioEncoderStartInvalidState function handles invalid states during encoder startup
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderStart009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderStartInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderStart009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoderStop_002
     * @tc.name testAVCodeOHAudioEncoderStop002
     * @tc.desc Verify that AVCodeOHAudioEncoderStopInvalidState function handles invalid states during encoder stop operation
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderStop002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderStopInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderStop002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoderStop_009
     * @tc.name testAVCodeOHAudioEncoderStop009
     * @tc.desc Verify that AVCodeOHAudioEncoderStopInvalidState function handles error conditions during encoder stop
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderStop009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderStopInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderStop009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoder_Flush_002
     * @tc.name testAVCodeOHAudioEncoderFlush002
     * @tc.desc Verify that AVCodeOHAudioEncoderFlushInvalidVal function validates invalid parameters during encoder flush
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderFlush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderFlushInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderFlush002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoder_Flush_009
     * @tc.name testAVCodeOHAudioEncoderFlush009
     * @tc.desc Verify that AVCodeOHAudioEncoderFlushInvalidState function handles invalid states during encoder flush
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderFlush009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderFlushInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderFlush009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoder_Reset_002
     * @tc.name testAVCodeOHAudioEncoderReset002
     * @tc.desc Verify that AVCodeOHAudioEncoderResetInvalidVal function validates invalid parameters during encoder reset
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderReset002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderResetInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderReset002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoder_SetParameter_002
     * @tc.name testAVCodeOHAudioEncoderSetParameter002
     * @tc.desc Verify that AVCodeOHAudioEncoderSetParameterInvalidVal function validates invalid parameters during encoder parameter setting
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderSetParameter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderSetParameterInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderSetParameter002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoder_PushInputData_002
     * @tc.name testAVCodeOHAudioEncoderPushInputData002
     * @tc.desc Verify that AVCodeOHAudioEncoderPushInputDataInvalidVal function validates invalid input data
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderPushInputData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderPushInputDataInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderPushInputData002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioCodec_SetParameter_001
     * @tc.name testAVCodeOHAudioCodecSetParameter001
     * @tc.desc Verify that AVCodeOHAudioCodecSetParameterInvalidVal function validates invalid codec parameters
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioCodecSetParameter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioCodecSetParameterInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioCodecSetParameter001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioCodec_SetParameter_002
     * @tc.name testAVCodeOHAudioCodecSetParameter002
     * @tc.desc Verify that AVCodeOHAudioCodecSetParameterOperateNotPermit function handles unauthorized parameter changes
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioCodecSetParameter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioCodecSetParameterOperateNotPermit();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioCodecSetParameter002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioCodec_SetParameter_003
     * @tc.name testAVCodeOHAudioCodecSetParameter003
     * @tc.desc Verify that AVCodeOHAudioCodecSetParameterOperateInvalidState function handles parameter changes in invalid states
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioCodecSetParameter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioCodecSetParameterOperateInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioCodecSetParameter003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioCodec_PushInputBuffer_002
     * @tc.name testAVCodeOHAudioCodecPushInputBuffer002
     * @tc.desc Verify that AVCodeOHAudioCodecPushInputBufferInvalidVal function validates invalid input buffers
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioCodecPushInputBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioCodecPushInputBufferInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioCodecPushInputBuffer002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_001
     * @tc.name testAVCodeOHMPEG2Profile001
     * @tc.desc Verify that EnumMPEGProfile1 function correctly enumerates MPEG2 profile 1
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_002
     * @tc.name testAVCodeOHMPEG2Profile002
     * @tc.desc Verify that EnumMPEGProfile2 function correctly enumerates MPEG2 profile 2
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_003
     * @tc.name testAVCodeOHMPEG2Profile003
     * @tc.desc Verify that EnumMPEGProfile3 function correctly enumerates MPEG2 profile 3
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_004
     * @tc.name testAVCodeOHMPEG2Profile004
     * @tc.desc Verify that EnumMPEGProfile4 function correctly enumerates MPEG2 profile 4
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_005
     * @tc.name testAVCodeOHMPEG2Profile005
     * @tc.desc Verify that EnumMPEGProfile5 function correctly enumerates MPEG2 profile 5
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_006
     * @tc.name testAVCodeOHMPEG2Profile006
     * @tc.desc Verify that EnumMPEGProfile6 function correctly enumerates MPEG2 profile 6
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_007
     * @tc.name testAVCodeOHMPEG2Profile007
     * @tc.desc Verify that EnumMPEGProfile7 function correctly enumerates MPEG2 profile 7
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_008
     * @tc.name testAVCodeOHMPEG2Profile008
     * @tc.desc Verify that EnumMPEGProfile8 function correctly enumerates MPEG2 profile 8
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile8();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_009
     * @tc.name testAVCodeOHMPEG2Profile009
     * @tc.desc Verify that EnumMPEGProfile9 function correctly enumerates MPEG2 profile 9
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile9();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_010
     * @tc.name testAVCodeOHMPEG2Profile010
     * @tc.desc Verify that EnumMPEGProfile10 function correctly enumerates MPEG2 profile 10
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile10();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_011
     * @tc.name testAVCodeOHMPEG2Profile011
     * @tc.desc Verify that EnumMPEGProfile11 function correctly enumerates MPEG2 profile 11
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile11();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile011 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_012
     * @tc.name testAVCodeOHMPEG2Profile012
     * @tc.desc Verify that EnumMPEGProfile12 function correctly enumerates MPEG2 profile 12
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile12();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile012 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_013
     * @tc.name testAVCodeOHMPEG2Profile013
     * @tc.desc Verify that EnumMPEGProfile13 function correctly enumerates MPEG2 profile 13
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile13();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile013 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_014
     * @tc.name testAVCodeOHMPEG2Profile014
     * @tc.desc Verify that EnumMPEGProfile14 function correctly enumerates MPEG2 profile 14
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile14();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile014 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_015
     * @tc.name testAVCodeOHMPEG2Profile015
     * @tc.desc Verify that EnumMPEGProfile15 function correctly enumerates MPEG2 profile 15
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile15();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile015 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_016
     * @tc.name testAVCodeOHMPEG2Profile016
     * @tc.desc Verify that EnumMPEGProfile16 function correctly enumerates MPEG2 profile 16
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile16();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile016 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_017
     * @tc.name testAVCodeOHMPEG2Profile017
     * @tc.desc Verify that EnumMPEGProfile17 function correctly enumerates MPEG2 profile 17
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile17();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile017 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_MPEG2Profile_018
     * @tc.name testAVCodeOHMPEG2Profile018
     * @tc.desc Verify that EnumMPEGProfile18 function correctly enumerates MPEG2 profile 18
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile18();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile018 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     @tc.number SUB_AVCode_OH_MPEG2Profile_019
     @tc.name testAVCodeOHMPEG2Profile019
     @tc.desc Verify that EnumMPEGProfile19 function correctly enumerates MPEG2 profile 19
     @tc.level Level1
     @tc.size MediumTest
     @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile19();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile019 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     @tc.number SUB_AVCode_OH_MPEG2Profile_020
     @tc.name testAVCodeOHMPEG2Profile020
     @tc.desc Verify that EnumMPEGProfile20 function correctly enumerates MPEG2 profile 20
     @tc.level Level1
     @tc.size MediumTest
     @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile20();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile020 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     @tc.number SUB_AVCode_OH_MPEG2Profile_021
     @tc.name testAVCodeOHMPEG2Profile021
     @tc.desc Verify that EnumMPEGProfile21 function correctly enumerates MPEG2 profile 21
     @tc.level Level1
     @tc.size MediumTest
     @tc.type Function
     */
    it('testAVCodeOHMPEG2Profile021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile21();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile021 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
  })
}
