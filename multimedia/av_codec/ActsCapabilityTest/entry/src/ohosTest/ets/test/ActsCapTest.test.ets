import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libentry from "libentry.so"


export default function ActsCapTest() {
  describe('ActsCapTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00100
     * @tc.number SUB_AUDIO_CAPABILITY_TEST_00100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_CAPABILITY_TEST_00100', Level.LEVEL2, async () => {
      const result = await libentry.AudioCapAbility00100Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00200
     * @tc.number SUB_AUDIO_CAPABILITY_TEST_00200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_CAPABILITY_TEST_00200', Level.LEVEL2, async () => {
      const result = await libentry.AudioCapAbility00200Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00300
     * @tc.number SUB_AUDIO_CAPABILITY_TEST_00300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_CAPABILITY_TEST_00300', Level.LEVEL2, async () => {
      const result = await libentry.AudioCapAbility00300Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00400
     * @tc.number SUB_AUDIO_CAPABILITY_TEST_00400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_CAPABILITY_TEST_00400', Level.LEVEL2, async () => {
      const result = await libentry.AudioCapAbility00400Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00500
     * @tc.number SUB_AUDIO_CAPABILITY_TEST_00500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_CAPABILITY_TEST_00500', Level.LEVEL2, async () => {
      const result = await libentry.AudioCapAbility00500Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00600
     * @tc.number SUB_AUDIO_CAPABILITY_TEST_00600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_CAPABILITY_TEST_00600', Level.LEVEL2, async () => {
      const result = await libentry.AudioCapAbility00600Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00700
     * @tc.number SUB_AUDIO_CAPABILITY_TEST_00700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_CAPABILITY_TEST_00700', Level.LEVEL2, async () => {
      const result = await libentry.AudioCapAbility00700Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00800
     * @tc.number SUB_AUDIO_CAPABILITY_TEST_00800
     * @tc.desc   check nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_CAPABILITY_TEST_00800', Level.LEVEL2, async () => {
      const result = await libentry.AudioCapAbility00800Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00100
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_00100', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi00100Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00200
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_00200', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi00200Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00300
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_00300', Level.LEVEL1, async () => {
      const result = await libentry.VideoTemporalEncodeApi00300Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00400
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_00400', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi00400Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00500
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_00500', Level.LEVEL1, async () => {
      const result = await libentry.VideoTemporalEncodeApi00500Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00600
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_00600', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi00600Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00700
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_00700', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi00700Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00800
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_00800', Level.LEVEL1, async () => {
      const result = await libentry.VideoTemporalEncodeApi00800Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00900
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_00900', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi00900Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01000
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_01000', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi01000Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01100
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_01100', Level.LEVEL1, async () => {
      const result = await libentry.VideoTemporalEncodeApi01100Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01200
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_01200', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi01200Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01300
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_01300', Level.LEVEL1, async () => {
      const result = await libentry.VideoTemporalEncodeApi01300Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01400
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_01400', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi01400Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01500
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_01500', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi01500Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01600
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_01600', Level.LEVEL1, async () => {
      const result = await libentry.VideoTemporalEncodeApi01600Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01700
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_01700', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi01700Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01800
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_01800', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi01800Test();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01900
     * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_TEMPORAL_ENCODE_API_01900', Level.LEVEL2, async () => {
      const result = await libentry.VideoTemporalEncodeApi01900Test();
      expect(result).assertEqual(0);
    })
  })
}
