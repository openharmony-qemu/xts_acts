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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libOhAudioRenderOps from 'libohaudiorenderops.so';

export default function OhAudioRenderUnitTest() {
  describe('OhAudioRenderUnitTest', () => {
    beforeAll(() => {
      // Setup before all tests
    })
    beforeEach(() => {
      // Setup before each test
    })
    afterEach(() => {
      // Cleanup after each test
    })
    afterAll(() => {
      // Cleanup after all tests
    })

    // Category 1: Renderer Creation Tests (2 tests)
    it('OH_Audio_Render_Generate_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.RendererCreationTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_Generate_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.RendererCreationTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    // Category 2: Lifecycle Control Tests (13 tests)
    it('OH_Audio_Render_Start_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_Start_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_Pause_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_Pause_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_Stop_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_Stop_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_Flush_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(6);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_Flush_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(7);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_Release_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(8);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetCurrentState_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(9);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetCurrentState_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(10);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetCurrentState_003', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(11);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetCurrentState_004', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(12);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    // Category 3: Parameter Getter Tests (10 tests)
    it('OH_Audio_Render_GetParameter_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_GetParameter_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_GetSamplingRate_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_GetSampleFormat', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_GetEncodingType_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_GetRendererInfo_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetRendererPrivacy_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(6);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetRendererPrivacy_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(7);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetChannelLayout_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(8);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetEffectMode_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(9);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    // Category 4: Volume Control Tests (10 tests)
    it('OH_Audio_Render_GetVolume_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_GetVolume_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_GetVolume_003', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_GetVolume_004', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetVolume_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetVolume_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetVolume_003', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(6);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetVolume_004', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(7);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetVolumeWithRamp_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(8);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetVolumeWithRamp_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(9);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    // Category 5: Mark Position Tests (8 tests)
    it('OH_Audio_Render_SetMarkPosition_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetMarkPosition_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetMarkPosition_003', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetMarkPosition_004', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetMarkPosition_005', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_CancelMark_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_CancelMark_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(6);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_CancelMark_003', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(7);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    // Category 6: Underflow Detection Tests (5 tests)
    it('OH_AudioRenderer_GetUnderflowCount_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.UnderflowDetectionTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetUnderflowCount_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.UnderflowDetectionTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetUnderflowCount_003', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.UnderflowDetectionTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetUnderflowCount_004', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.UnderflowDetectionTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioRenderer_GetUnderflowCount_005', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.UnderflowDetectionTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    // Category 7: Write Data Callback Tests (6 tests)
    it('OH_Audio_Render_WriteDataCallback_001', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_WriteDataCallback_002', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_WriteDataCallback_003', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_WriteDataCallback_004', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_WriteDataCallback_005', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_WriteDataCallback_006', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    // Category 8: Loudness Gain Set Tests (12 tests)
    it('OH_Audio_Render_SetLoudnessGain_006', Level.LEVEL1, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetLoudnessGain_007', Level.LEVEL1, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetLoudnessGain_008', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetLoudnessGain_010', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetLoudnessGain_011', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetLoudnessGain_012', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetLoudnessGain_013', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(6);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetLoudnessGain_014', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(7);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetLoudnessGain_015', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(8);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetLoudnessGain_017', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(9);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetLoudnessGain_018', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(10);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_Audio_Render_SetLoudnessGain_019', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(11);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    // Category 10: Stream Manager Tests (2 tests)
    it('OH_AudioStreamManager_IsAcousticEchoCancelerSupported_001', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.StreamManagerTest(0);
        expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    it('OH_AudioStreamManager_IsAcousticEchoCancelerSupported_002', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.StreamManagerTest(1);
        expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })
  })
}

