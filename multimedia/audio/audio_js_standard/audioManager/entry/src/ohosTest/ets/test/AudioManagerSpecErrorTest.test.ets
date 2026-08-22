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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[AudioManagerSpecErrorTest]';

export default function AudioManagerSpecErrorTest() {
  describe('audioManagerSpecErrorTest', () => {
    let audioManager: audio.AudioManager | null = null;

    beforeAll(() => {
      console.info(`${TAG} beforeAll`);
      audioManager = audio.getAudioManager();
    });

    beforeEach(() => {
      console.info(`${TAG} beforeEach`);
    });

    afterEach(() => {
      console.info(`${TAG} afterEach`);
    });

    afterAll(() => {
      console.info(`${TAG} afterAll`);
      audioManager = null;
    });

    /**
     * @tc.name   testCreateAudioLoopbackEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_CREATE_AUDIO_LOOPBACK_ENUM_NULL_0100
     * @tc.desc   Test createAudioLoopback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: mode = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateAudioLoopbackEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audio.createAudioLoopback(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testCreateAudioLoopbackEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testCreateAudioLoopbackEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_CREATE_AUDIO_LOOPBACK_ENUM_UNDEFINED_0200
     * @tc.desc   Test createAudioLoopback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: mode = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateAudioLoopbackEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audio.createAudioLoopback(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testCreateAudioLoopbackEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testSetVolumeCbEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_VOLUME_CB_ENUM_NULL_0100
     * @tc.desc   Test setVolume callback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetVolumeCbEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setVolume(null, 1, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetVolumeCbEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetVolumeCbEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_VOLUME_CB_ENUM_UNDEFINED_0200
     * @tc.desc   Test setVolume callback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetVolumeCbEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setVolume(undefined, 1, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetVolumeCbEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetVolumeCbEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_VOLUME_CB_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test setVolume callback with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetVolumeCbEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setVolume(999 as audio.AudioVolumeType, 1, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetVolumeCbEnumOutOfRange0300 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetVolumeEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_VOLUME_ENUM_NULL_0100
     * @tc.desc   Test setVolume with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetVolumeEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setVolume(null, 1);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetVolumeEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testSetVolumeEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_VOLUME_ENUM_UNDEFINED_0200
     * @tc.desc   Test setVolume with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetVolumeEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setVolume(undefined, 1);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetVolumeEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testSetVolumeEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_VOLUME_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test setVolume with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetVolumeEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setVolume(999 as audio.AudioVolumeType, 1);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetVolumeEnumOutOfRange0300 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testGetVolumeCbEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_VOLUME_CB_ENUM_NULL_0100
     * @tc.desc   Test getVolume callback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetVolumeCbEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getVolume(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetVolumeCbEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetVolumeCbEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_VOLUME_CB_ENUM_UNDEFINED_0200
     * @tc.desc   Test getVolume callback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetVolumeCbEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getVolume(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetVolumeCbEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetVolumeCbEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_VOLUME_CB_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test getVolume callback with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetVolumeCbEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getVolume(999 as audio.AudioVolumeType, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetVolumeCbEnumOutOfRange0300 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetVolumeEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_VOLUME_ENUM_NULL_0100
     * @tc.desc   Test getVolume with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetVolumeEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getVolume(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetVolumeEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testGetVolumeEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_VOLUME_ENUM_UNDEFINED_0200
     * @tc.desc   Test getVolume with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetVolumeEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getVolume(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetVolumeEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testGetVolumeEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_VOLUME_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test getVolume with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetVolumeEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getVolume(999 as audio.AudioVolumeType);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetVolumeEnumOutOfRange0300 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testGetMinVolumeCbEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MIN_VOLUME_CB_ENUM_NULL_0100
     * @tc.desc   Test getMinVolume callback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMinVolumeCbEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getMinVolume(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetMinVolumeCbEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetMinVolumeCbEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MIN_VOLUME_CB_ENUM_UNDEFINED_0200
     * @tc.desc   Test getMinVolume callback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMinVolumeCbEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getMinVolume(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetMinVolumeCbEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetMinVolumeCbEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MIN_VOLUME_CB_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test getMinVolume callback with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMinVolumeCbEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getMinVolume(999 as audio.AudioVolumeType, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetMinVolumeCbEnumOutOfRange0300 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetMinVolumeEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MIN_VOLUME_ENUM_NULL_0100
     * @tc.desc   Test getMinVolume with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMinVolumeEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getMinVolume(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetMinVolumeEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testGetMinVolumeEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MIN_VOLUME_ENUM_UNDEFINED_0200
     * @tc.desc   Test getMinVolume with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMinVolumeEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getMinVolume(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetMinVolumeEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testGetMinVolumeEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MIN_VOLUME_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test getMinVolume with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMinVolumeEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getMinVolume(999 as audio.AudioVolumeType);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetMinVolumeEnumOutOfRange0300 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testGetMaxVolumeCbEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MAX_VOLUME_CB_ENUM_NULL_0100
     * @tc.desc   Test getMaxVolume callback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMaxVolumeCbEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getMaxVolume(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetMaxVolumeCbEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetMaxVolumeCbEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MAX_VOLUME_CB_ENUM_UNDEFINED_0200
     * @tc.desc   Test getMaxVolume callback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMaxVolumeCbEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getMaxVolume(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetMaxVolumeCbEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetMaxVolumeCbEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MAX_VOLUME_CB_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test getMaxVolume callback with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMaxVolumeCbEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getMaxVolume(999 as audio.AudioVolumeType, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetMaxVolumeCbEnumOutOfRange0300 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetMaxVolumeEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MAX_VOLUME_ENUM_NULL_0100
     * @tc.desc   Test getMaxVolume with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMaxVolumeEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getMaxVolume(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetMaxVolumeEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testGetMaxVolumeEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MAX_VOLUME_ENUM_UNDEFINED_0200
     * @tc.desc   Test getMaxVolume with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMaxVolumeEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getMaxVolume(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetMaxVolumeEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testGetMaxVolumeEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_MAX_VOLUME_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test getMaxVolume with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMaxVolumeEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getMaxVolume(999 as audio.AudioVolumeType);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetMaxVolumeEnumOutOfRange0300 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testGetDevicesCbEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_DEVICES_CB_ENUM_NULL_0100
     * @tc.desc   Test getDevices callback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: deviceFlag = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDevicesCbEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getDevices(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetDevicesCbEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetDevicesCbEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_DEVICES_CB_ENUM_UNDEFINED_0200
     * @tc.desc   Test getDevices callback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: deviceFlag = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDevicesCbEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getDevices(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetDevicesCbEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetDevicesCbEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_DEVICES_CB_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test getDevices callback with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: deviceFlag = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDevicesCbEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.getDevices(999 as audio.DeviceFlag, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testGetDevicesCbEnumOutOfRange0300 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testGetDevicesEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_DEVICES_ENUM_NULL_0100
     * @tc.desc   Test getDevices with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: deviceFlag = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDevicesEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getDevices(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetDevicesEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testGetDevicesEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_DEVICES_ENUM_UNDEFINED_0200
     * @tc.desc   Test getDevices with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: deviceFlag = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDevicesEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getDevices(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetDevicesEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testGetDevicesEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_GET_DEVICES_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test getDevices with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: deviceFlag = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDevicesEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.getDevices(999 as audio.DeviceFlag);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetDevicesEnumOutOfRange0300 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testMuteCbEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_MUTE_CB_ENUM_NULL_0100
     * @tc.desc   Test mute callback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteCbEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.mute(null, true, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testMuteCbEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testMuteCbEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_MUTE_CB_ENUM_UNDEFINED_0200
     * @tc.desc   Test mute callback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteCbEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.mute(undefined, true, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testMuteCbEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testMuteCbEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_MUTE_CB_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test mute callback with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteCbEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.mute(999 as audio.AudioVolumeType, true, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testMuteCbEnumOutOfRange0300 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testMuteCbBooleanNull0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_MUTE_CB_BOOLEAN_NULL_0400
     * @tc.desc   Test mute callback with null boolean parameter.
     *             规格检查: 第2个参数缺少null覆盖
     *             测试输入: mute = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteCbBooleanNull0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.mute(audio.AudioVolumeType.MEDIA, null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testMuteCbBooleanNull0400 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testMuteCbBooleanUndefined0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_MUTE_CB_BOOLEAN_UNDEFINED_0500
     * @tc.desc   Test mute callback with undefined boolean parameter.
     *             规格检查: 第2个参数缺少undefined覆盖
     *             测试输入: mute = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteCbBooleanUndefined0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.mute(audio.AudioVolumeType.MEDIA, undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testMuteCbBooleanUndefined0500 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testMuteEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_MUTE_ENUM_NULL_0100
     * @tc.desc   Test mute with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.mute(null, true);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testMuteEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testMuteEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_MUTE_ENUM_UNDEFINED_0200
     * @tc.desc   Test mute with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.mute(undefined, true);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testMuteEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testMuteEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_MUTE_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test mute with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.mute(999 as audio.AudioVolumeType, true);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testMuteEnumOutOfRange0300 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testMuteBooleanNull0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_MUTE_BOOLEAN_NULL_0400
     * @tc.desc   Test mute with null boolean parameter.
     *             规格检查: 第2个参数缺少null覆盖
     *             测试输入: mute = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteBooleanNull0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.mute(audio.AudioVolumeType.MEDIA, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testMuteBooleanNull0400 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testMuteBooleanUndefined0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_MUTE_BOOLEAN_UNDEFINED_0500
     * @tc.desc   Test mute with undefined boolean parameter.
     *             规格检查: 第2个参数缺少undefined覆盖
     *             测试输入: mute = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteBooleanUndefined0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.mute(audio.AudioVolumeType.MEDIA, undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testMuteBooleanUndefined0500 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testIsMuteCbEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_MUTE_CB_ENUM_NULL_0100
     * @tc.desc   Test isMute callback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsMuteCbEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.isMute(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testIsMuteCbEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testIsMuteCbEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_MUTE_CB_ENUM_UNDEFINED_0200
     * @tc.desc   Test isMute callback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsMuteCbEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.isMute(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testIsMuteCbEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testIsMuteCbEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_MUTE_CB_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test isMute callback with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsMuteCbEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.isMute(999 as audio.AudioVolumeType, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testIsMuteCbEnumOutOfRange0300 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testIsMuteEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_MUTE_ENUM_NULL_0100
     * @tc.desc   Test isMute with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsMuteEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.isMute(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsMuteEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testIsMuteEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_MUTE_ENUM_UNDEFINED_0200
     * @tc.desc   Test isMute with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsMuteEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.isMute(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsMuteEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testIsMuteEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_MUTE_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test isMute with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsMuteEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.isMute(999 as audio.AudioVolumeType);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsMuteEnumOutOfRange0300 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testIsActiveCbEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_ACTIVE_CB_ENUM_NULL_0100
     * @tc.desc   Test isActive callback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveCbEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.isActive(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testIsActiveCbEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testIsActiveCbEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_ACTIVE_CB_ENUM_UNDEFINED_0200
     * @tc.desc   Test isActive callback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveCbEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.isActive(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testIsActiveCbEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testIsActiveCbEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_ACTIVE_CB_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test isActive callback with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveCbEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.isActive(999 as audio.AudioVolumeType, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testIsActiveCbEnumOutOfRange0300 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testIsActiveEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_ACTIVE_ENUM_NULL_0100
     * @tc.desc   Test isActive with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: volumeType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.isActive(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsActiveEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testIsActiveEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_ACTIVE_ENUM_UNDEFINED_0200
     * @tc.desc   Test isActive with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: volumeType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.isActive(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsActiveEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testIsActiveEnumVoiceCall0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_ACTIVE_ENUM_VOICE_CALL_0300
     * @tc.desc   Test isActive with VOICE_CALL enum value.
     *             规格检查: 未覆盖枚举:VOICE_CALL
     *             测试输入: volumeType = VOICE_CALL
     *             预期结果: 返回值类型为 boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveEnumVoiceCall0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let result = await audioManager!.isActive(audio.AudioVolumeType.VOICE_CALL);
        expect(typeof result).assertEqual('boolean');
        done();
      } catch (error) {
        console.info(`${TAG} testIsActiveEnumVoiceCall0300: code=${error.code}`);
        done();
      }
    });

    /**
     * @tc.name   testIsActiveEnumAlarm0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_ACTIVE_ENUM_ALARM_0400
     * @tc.desc   Test isActive with ALARM enum value.
     *             规格检查: 未覆盖枚举:ALARM
     *             测试输入: volumeType = ALARM
     *             预期结果: 返回值类型为 boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveEnumAlarm0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let result = await audioManager!.isActive(audio.AudioVolumeType.ALARM);
        expect(typeof result).assertEqual('boolean');
        done();
      } catch (error) {
        console.info(`${TAG} testIsActiveEnumAlarm0400: code=${error.code}`);
        done();
      }
    });

    /**
     * @tc.name   testIsActiveEnumAccessibility0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_ACTIVE_ENUM_ACCESSIBILITY_0500
     * @tc.desc   Test isActive with ACCESSIBILITY enum value.
     *             规格检查: 未覆盖枚举:ACCESSIBILITY
     *             测试输入: volumeType = ACCESSIBILITY
     *             预期结果: 返回值类型为 boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveEnumAccessibility0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let result = await audioManager!.isActive(audio.AudioVolumeType.ACCESSIBILITY);
        expect(typeof result).assertEqual('boolean');
        done();
      } catch (error) {
        console.info(`${TAG} testIsActiveEnumAccessibility0500: code=${error.code}`);
        done();
      }
    });

    /**
     * @tc.name   testIsActiveEnumVoiceAssistant0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_ACTIVE_ENUM_VOICE_ASSISTANT_0600
     * @tc.desc   Test isActive with VOICE_ASSISTANT enum value.
     *             规格检查: 未覆盖枚举:VOICE_ASSISTANT
     *             测试输入: volumeType = VOICE_ASSISTANT
     *             预期结果: 返回值类型为 boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveEnumVoiceAssistant0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let result = await audioManager!.isActive(audio.AudioVolumeType.VOICE_ASSISTANT);
        expect(typeof result).assertEqual('boolean');
        done();
      } catch (error) {
        console.info(`${TAG} testIsActiveEnumVoiceAssistant0600: code=${error.code}`);
        done();
      }
    });

    /**
     * @tc.name   testIsActiveEnumOutOfRange0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_ACTIVE_ENUM_OUT_OF_RANGE_0700
     * @tc.desc   Test isActive with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: volumeType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveEnumOutOfRange0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.isActive(999 as audio.AudioVolumeType);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsActiveEnumOutOfRange0700 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testSetMicrophoneMuteCbBooleanNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_MICROPHONE_MUTE_CB_BOOLEAN_NULL_0100
     * @tc.desc   Test setMicrophoneMute callback with null boolean parameter.
     *             规格检查: 第1个参数缺少null覆盖
     *             测试输入: mute = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMicrophoneMuteCbBooleanNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setMicrophoneMute(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetMicrophoneMuteCbBooleanNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetMicrophoneMuteCbBooleanUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_MICROPHONE_MUTE_CB_BOOLEAN_UNDEFINED_0200
     * @tc.desc   Test setMicrophoneMute callback with undefined boolean parameter.
     *             规格检查: 第1个参数缺少undefined覆盖
     *             测试输入: mute = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMicrophoneMuteCbBooleanUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setMicrophoneMute(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetMicrophoneMuteCbBooleanUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetMicrophoneMuteBooleanNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_MICROPHONE_MUTE_BOOLEAN_NULL_0100
     * @tc.desc   Test setMicrophoneMute with null boolean parameter.
     *             规格检查: 第1个参数缺少null覆盖
     *             测试输入: mute = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMicrophoneMuteBooleanNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setMicrophoneMute(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetMicrophoneMuteBooleanNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testSetMicrophoneMuteBooleanUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_MICROPHONE_MUTE_BOOLEAN_UNDEFINED_0200
     * @tc.desc   Test setMicrophoneMute with undefined boolean parameter.
     *             规格检查: 第1个参数缺少undefined覆盖
     *             测试输入: mute = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMicrophoneMuteBooleanUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setMicrophoneMute(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetMicrophoneMuteBooleanUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testSetRingerModeCbEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_RINGER_MODE_CB_ENUM_NULL_0100
     * @tc.desc   Test setRingerMode callback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: mode = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRingerModeCbEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setRingerMode(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetRingerModeCbEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetRingerModeCbEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_RINGER_MODE_CB_ENUM_UNDEFINED_0200
     * @tc.desc   Test setRingerMode callback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: mode = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRingerModeCbEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setRingerMode(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetRingerModeCbEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetRingerModeCbEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_RINGER_MODE_CB_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test setRingerMode callback with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: mode = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRingerModeCbEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setRingerMode(999 as audio.AudioRingMode, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetRingerModeCbEnumOutOfRange0300 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetRingerModeEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_RINGER_MODE_ENUM_NULL_0100
     * @tc.desc   Test setRingerMode with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: mode = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRingerModeEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setRingerMode(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetRingerModeEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testSetRingerModeEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_RINGER_MODE_ENUM_UNDEFINED_0200
     * @tc.desc   Test setRingerMode with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: mode = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRingerModeEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setRingerMode(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetRingerModeEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testSetRingerModeEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_RINGER_MODE_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test setRingerMode with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: mode = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRingerModeEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setRingerMode(999 as audio.AudioRingMode);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetRingerModeEnumOutOfRange0300 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testSetDeviceActiveCbEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_DEVICE_ACTIVE_CB_ENUM_NULL_0100
     * @tc.desc   Test setDeviceActive callback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: deviceType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDeviceActiveCbEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setDeviceActive(null, true, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetDeviceActiveCbEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetDeviceActiveCbEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_DEVICE_ACTIVE_CB_ENUM_UNDEFINED_0200
     * @tc.desc   Test setDeviceActive callback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: deviceType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDeviceActiveCbEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setDeviceActive(undefined, true, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetDeviceActiveCbEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetDeviceActiveCbEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_DEVICE_ACTIVE_CB_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test setDeviceActive callback with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: deviceType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDeviceActiveCbEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setDeviceActive(999 as audio.ActiveDeviceType, true, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetDeviceActiveCbEnumOutOfRange0300 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetDeviceActiveCbBooleanNull0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_DEVICE_ACTIVE_CB_BOOLEAN_NULL_0400
     * @tc.desc   Test setDeviceActive callback with null boolean parameter.
     *             规格检查: 第2个参数缺少null覆盖
     *             测试输入: active = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDeviceActiveCbBooleanNull0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setDeviceActive(audio.ActiveDeviceType.SPEAKER, null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetDeviceActiveCbBooleanNull0400 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetDeviceActiveCbBooleanUndefined0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_DEVICE_ACTIVE_CB_BOOLEAN_UNDEFINED_0500
     * @tc.desc   Test setDeviceActive callback with undefined boolean parameter.
     *             规格检查: 第2个参数缺少undefined覆盖
     *             测试输入: active = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDeviceActiveCbBooleanUndefined0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.setDeviceActive(audio.ActiveDeviceType.SPEAKER, undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetDeviceActiveCbBooleanUndefined0500 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testSetDeviceActiveEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_DEVICE_ACTIVE_ENUM_NULL_0100
     * @tc.desc   Test setDeviceActive with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: deviceType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDeviceActiveEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setDeviceActive(null, true);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetDeviceActiveEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testSetDeviceActiveEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_DEVICE_ACTIVE_ENUM_UNDEFINED_0200
     * @tc.desc   Test setDeviceActive with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: deviceType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDeviceActiveEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setDeviceActive(undefined, true);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetDeviceActiveEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testSetDeviceActiveEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_DEVICE_ACTIVE_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test setDeviceActive with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: deviceType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDeviceActiveEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setDeviceActive(999 as audio.ActiveDeviceType, true);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetDeviceActiveEnumOutOfRange0300 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testSetDeviceActiveBooleanNull0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_DEVICE_ACTIVE_BOOLEAN_NULL_0400
     * @tc.desc   Test setDeviceActive with null boolean parameter.
     *             规格检查: 第2个参数缺少null覆盖
     *             测试输入: active = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDeviceActiveBooleanNull0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setDeviceActive(audio.ActiveDeviceType.SPEAKER, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetDeviceActiveBooleanNull0400 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testSetDeviceActiveBooleanUndefined0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_SET_DEVICE_ACTIVE_BOOLEAN_UNDEFINED_0500
     * @tc.desc   Test setDeviceActive with undefined boolean parameter.
     *             规格检查: 第2个参数缺少undefined覆盖
     *             测试输入: active = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDeviceActiveBooleanUndefined0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.setDeviceActive(audio.ActiveDeviceType.SPEAKER, undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetDeviceActiveBooleanUndefined0500 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testIsDeviceActiveCbEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_DEVICE_ACTIVE_CB_ENUM_NULL_0100
     * @tc.desc   Test isDeviceActive callback with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: deviceType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDeviceActiveCbEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.isDeviceActive(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testIsDeviceActiveCbEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testIsDeviceActiveCbEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_DEVICE_ACTIVE_CB_ENUM_UNDEFINED_0200
     * @tc.desc   Test isDeviceActive callback with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: deviceType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDeviceActiveCbEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.isDeviceActive(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testIsDeviceActiveCbEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testIsDeviceActiveCbEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_DEVICE_ACTIVE_CB_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test isDeviceActive callback with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: deviceType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDeviceActiveCbEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager!.isDeviceActive(999 as audio.ActiveDeviceType, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testIsDeviceActiveCbEnumOutOfRange0300 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testIsDeviceActiveEnumNull0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_DEVICE_ACTIVE_ENUM_NULL_0100
     * @tc.desc   Test isDeviceActive with null enum parameter.
     *             规格检查: 第1个参数枚举类型缺少null覆盖
     *             测试输入: deviceType = null
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDeviceActiveEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.isDeviceActive(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsDeviceActiveEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testIsDeviceActiveEnumUndefined0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_DEVICE_ACTIVE_ENUM_UNDEFINED_0200
     * @tc.desc   Test isDeviceActive with undefined enum parameter.
     *             规格检查: 第1个参数枚举类型缺少undefined覆盖
     *             测试输入: deviceType = undefined
     *             预期结果: 抛出错误码 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDeviceActiveEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.isDeviceActive(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsDeviceActiveEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testIsDeviceActiveEnumOutOfRange0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_IS_DEVICE_ACTIVE_ENUM_OUT_OF_RANGE_0300
     * @tc.desc   Test isDeviceActive with out-of-range enum value.
     *             规格检查: 未覆盖API定义之外的枚举
     *             测试输入: deviceType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDeviceActiveEnumOutOfRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager!.isDeviceActive(999 as audio.ActiveDeviceType);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsDeviceActiveEnumOutOfRange0300 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testOnInterruptStreamUsageIllegal0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_ILLEGAL_0100
     * @tc.desc   Test on interrupt with illegal streamUsage enum value.
     *             规格检查: 属性streamUsage未覆盖非法枚举值
     *             测试输入: interrupt.streamUsage = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnInterruptStreamUsageIllegal0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let interrupt: audio.AudioInterrupt = {
        streamUsage: 999 as audio.StreamUsage,
        contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
        pauseWhenDucked: false
        };
        audioManager!.on('interrupt', interrupt, () => {});
        audioManager!.off('interrupt', interrupt);
      } catch (error) {
        console.error(`${TAG} testOnInterruptStreamUsageIllegal0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
      }
    });

    /**
     * @tc.name   testOnInterruptContentTypeIllegal0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_ILLEGAL_0200
     * @tc.desc   Test on interrupt with illegal contentType enum value.
     *             规格检查: 属性contentType未覆盖非法枚举值
     *             测试输入: interrupt.contentType = 999
     *             预期结果: 抛出错误码 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnInterruptContentTypeIllegal0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let interrupt: audio.AudioInterrupt = {
        streamUsage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        contentType: 999 as audio.ContentType,
        pauseWhenDucked: false
        };
        audioManager!.on('interrupt', interrupt, () => {});
        audioManager!.off('interrupt', interrupt);
      } catch (error) {
        console.error(`${TAG} testOnInterruptContentTypeIllegal0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
      }
    });

  });
}
