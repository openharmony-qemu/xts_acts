import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  PromiseTryTest001,
  PromiseTryTest002,
  PromiseTryTest003,
  PromiseTryTest004,
  PromiseTryTest005,
  PromiseTryTest006,
  PromiseTryTest007,
  PromiseTryTest008,
  PromiseTryTest009,
  PromiseTryTest010,
  PromiseTryTest011,
  PromiseTryTest012,
  PromiseTryTest013,
  PromiseTryTest014,
  PromiseTryTest015,
  PromiseTryTest016,
  PromiseTryTest017,
  PromiseTryTest018,
  PromiseTryTest019,
  PromiseTryTest020,
  PromiseTryTest021,
  PromiseTryTest022,
  PromiseTryTest023,
  PromiseTryTest024,
  PromiseTryTest025,
  PromiseTryTest026,
  PromiseTryTest027,
  PromiseTryTest028,
  PromiseTryTest029,
  PromiseTryTest030,
  PromiseTryTest031,
  PromiseTryTest032,
  PromiseTryTest033,
  PromiseTryTest034,
  PromiseTryTest035,
  PromiseTryTest036,
  PromiseTryTest037,
  PromiseTryTest038,
  PromiseTryTest039,
  PromiseTryTest040,
  PromiseTryTest041,
  PromiseTryTest042,
  PromiseTryTest043,
  PromiseTryTest044,
  PromiseTryTest045,
  PromiseTryTest046,
  PromiseTryTest047,
  PromiseTryTest048,
  PromiseTryTest049,
  PromiseTryTest050,
  PromiseTryTest051,
  PromiseTryTest052,
  PromiseTryTest053,
  PromiseTryTest054,
  PromiseTryTest055,
  PromiseTryTest056,
  PromiseTryTest057,
  PromiseTryTest058,
  PromiseTryTest059,
  PromiseTryTest060,
  PromiseTryTest061,
  PromiseTryTest062,
  PromiseTryTest063,
  PromiseTryTest064,
  PromiseTryTest065,
  PromiseTryTest066,
  PromiseTryTest067,
  PromiseTryTest068,
  PromiseTryTest069,
  PromiseTryTest070,
  PromiseTryTest071,
  PromiseTryTest072,
  PromiseTryTest073,
  PromiseTryTest074,
  PromiseTryTest075,
  PromiseTryTest076,
  PromiseTryTest077,
  PromiseTryTest078,
  PromiseTryTest079,
  PromiseTryTest080,
  PromiseTryTest081,
  PromiseTryTest082,
  PromiseTryTest083,
  PromiseTryTest084,
  PromiseTryTest085,
  PromiseTryTest086,
  PromiseTryTest087,
  PromiseTryTest088,
  PromiseTryTest089,
  PromiseTryTest090,
  PromiseTryTest091,
  PromiseTryTest092,
  PromiseTryTest093,
  PromiseTryTest094,
  PromiseTryTest095,
  PromiseTryTest096,
  PromiseTryTest097,
  PromiseTryTest098,
  PromiseTryTest099,
  PromiseTryTest100
} from './promiseTryJs';
import { sleep } from './utils';

export default function promiseTryTest() {
  describe('promiseTryTest', () => {
    afterEach(async () => {
      await sleep(10)
    })
    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0001
     * @tc.name PromiseTryTest001
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest001();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0002
     * @tc.name PromiseTryTest002
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest002();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0003
     * @tc.name PromiseTryTest003
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest003();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0004
     * @tc.name PromiseTryTest004
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest004();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0005
     * @tc.name PromiseTryTest005
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest005();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0006
     * @tc.name PromiseTryTest006
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest006();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0007
     * @tc.name PromiseTryTest007
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest007();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0008
     * @tc.name PromiseTryTest008
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest008();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0009
     * @tc.name PromiseTryTest009
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest009();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0010
     * @tc.name PromiseTryTest010
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest010();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0011
     * @tc.name PromiseTryTest011
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest011();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0012
     * @tc.name PromiseTryTest012
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest012();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0013
     * @tc.name PromiseTryTest013
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest013();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0014
     * @tc.name PromiseTryTest014
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest014();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0015
     * @tc.name PromiseTryTest015
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest015();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0016
     * @tc.name PromiseTryTest016
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest016();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0017
     * @tc.name PromiseTryTest017
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest017();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0018
     * @tc.name PromiseTryTest018
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest018();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0019
     * @tc.name PromiseTryTest019
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest019();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0020
     * @tc.name PromiseTryTest020
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest020();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0021
     * @tc.name PromiseTryTest021
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest021();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0022
     * @tc.name PromiseTryTest022
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest022();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0023
     * @tc.name PromiseTryTest023
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest023();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0024
     * @tc.name PromiseTryTest024
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest024();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0025
     * @tc.name PromiseTryTest025
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest025();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0026
     * @tc.name PromiseTryTest026
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest026();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0027
     * @tc.name PromiseTryTest027
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest027();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0028
     * @tc.name PromiseTryTest028
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest028();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0029
     * @tc.name PromiseTryTest029
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest029();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0030
     * @tc.name PromiseTryTest030
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest030();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0031
     * @tc.name PromiseTryTest031
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest031();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0032
     * @tc.name PromiseTryTest032
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest032();
      expect(result).assertEqual(true);
    })
    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0033
     * @tc.name PromiseTryTest033
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest033();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0034
     * @tc.name PromiseTryTest034
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest034();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0035
     * @tc.name PromiseTryTest035
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest035();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0036
     * @tc.name PromiseTryTest036
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest036();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0037
     * @tc.name PromiseTryTest037
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest037();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0038
     * @tc.name PromiseTryTest038
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest038();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0039
     * @tc.name PromiseTryTest039
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest039();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0040
     * @tc.name PromiseTryTest040
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest040();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0041
     * @tc.name PromiseTryTest041
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest041();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0042
     * @tc.name PromiseTryTest042
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest042();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0043
     * @tc.name PromiseTryTest043
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest043();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0044
     * @tc.name PromiseTryTest044
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest044();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0045
     * @tc.name PromiseTryTest045
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest045();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0046
     * @tc.name PromiseTryTest046
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest046();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0047
     * @tc.name PromiseTryTest047
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest047();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0048
     * @tc.name PromiseTryTest048
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest048();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0049
     * @tc.name PromiseTryTest049
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest049();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0050
     * @tc.name PromiseTryTest050
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest050();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0051
     * @tc.name PromiseTryTest051
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest051();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0052
     * @tc.name PromiseTryTest052
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest052();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0053
     * @tc.name PromiseTryTest053
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest053();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0054
     * @tc.name PromiseTryTest054
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest054();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0055
     * @tc.name PromiseTryTest055
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest055();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0056
     * @tc.name PromiseTryTest056
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest056();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0057
     * @tc.name PromiseTryTest057
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest057();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0058
     * @tc.name PromiseTryTest058
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest058();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0059
     * @tc.name PromiseTryTest059
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest059();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0060
     * @tc.name PromiseTryTest060
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest060();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0061
     * @tc.name PromiseTryTest061
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest061();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0062
     * @tc.name PromiseTryTest062
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest062();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0063
     * @tc.name PromiseTryTest063
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest063();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0064
     * @tc.name PromiseTryTest064
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest064();
      expect(result).assertEqual(true);
    })
    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0065
     * @tc.name PromiseTryTest065
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest065();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0066
     * @tc.name PromiseTryTest066
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest066();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0067
     * @tc.name PromiseTryTest067
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest067();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0068
     * @tc.name PromiseTryTest068
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest068();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0069
     * @tc.name PromiseTryTest069
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest069();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0070
     * @tc.name PromiseTryTest070
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest070();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0071
     * @tc.name PromiseTryTest071
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest071();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0072
     * @tc.name PromiseTryTest072
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest072();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0073
     * @tc.name PromiseTryTest073
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest073();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0074
     * @tc.name PromiseTryTest074
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest074();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0075
     * @tc.name PromiseTryTest075
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest075();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0076
     * @tc.name PromiseTryTest076
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest076();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0077
     * @tc.name PromiseTryTest077
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest077();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0078
     * @tc.name PromiseTryTest078
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest078();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0079
     * @tc.name PromiseTryTest079
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest079();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0080
     * @tc.name PromiseTryTest080
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest080();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0081
     * @tc.name PromiseTryTest081
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest081();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0082
     * @tc.name PromiseTryTest082
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest082();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0083
     * @tc.name PromiseTryTest083
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest083();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0084
     * @tc.name PromiseTryTest084
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest084();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0085
     * @tc.name PromiseTryTest085
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest085();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0086
     * @tc.name PromiseTryTest086
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest086();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0087
     * @tc.name PromiseTryTest087
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest087();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0088
     * @tc.name PromiseTryTest088
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest088();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0089
     * @tc.name PromiseTryTest089
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest089();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0090
     * @tc.name PromiseTryTest090
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest090();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0091
     * @tc.name PromiseTryTest091
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest091();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0092
     * @tc.name PromiseTryTest092
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest092();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0093
     * @tc.name PromiseTryTest093
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest093();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0094
     * @tc.name PromiseTryTest094
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest094();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0095
     * @tc.name PromiseTryTest095
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest095();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0096
     * @tc.name PromiseTryTest096
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest096();
      expect(result).assertEqual(true);
    })
    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0097
     * @tc.name PromiseTryTest097
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest097();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0098
     * @tc.name PromiseTryTest098
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest098();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0099
     * @tc.name PromiseTryTest099
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest099();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_try_TEST_0100
     * @tc.name PromiseTryTest100
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTryTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseTryTest100();
      expect(result).assertEqual(true);
    });
  })
}