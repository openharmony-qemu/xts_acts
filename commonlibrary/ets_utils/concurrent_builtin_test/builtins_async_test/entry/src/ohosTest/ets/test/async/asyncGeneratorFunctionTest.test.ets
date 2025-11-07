import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from './utils';
import { AsyncGeneratorFuncTest001 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest002 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest003 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest004 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest005 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest006 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest007 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest008 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest009 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest010 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest011 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest012 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest013 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest014 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest015 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest016 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest017 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest018 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest019 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest020 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest021 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest022 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest023 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest024 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest025 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest026 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest027 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest028 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest029 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest030 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest031 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest032 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest033 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest034 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest035 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest036 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest037 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest038 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest039 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest040 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest041 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest042 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest043 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest044 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest045 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest046 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest047 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest048 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest049 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest050 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest051 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest052 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest053 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest054 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest055 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest056 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest057 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest058 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest059 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest060 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest061 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest062 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest063 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest064 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest065 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest066 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest067 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest068 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest069 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest070 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest071 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest072 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest073 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest074 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest075 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest076 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest077 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest078 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest079 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest080 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest081 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest082 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest083 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest084 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest085 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest086 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest087 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest088 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest089 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest090 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest091 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest092 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest093 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest094 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest095 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest096 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest097 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest098 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest099 } from './AsyncGeneratorFunc';
import { AsyncGeneratorFuncTest100 } from './AsyncGeneratorFunc';

export default function asyncGeneratorFunctionTest() {
  describe('asyncGeneratorFunctionTest', () => {
    afterEach(async () => {
      await sleep(10)
    })
    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_001
     * @tc.name AsyncGeneratorFuncTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest001();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_002
     * @tc.name AsyncGeneratorFuncTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest002();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_003
     * @tc.name AsyncGeneratorFuncTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest003();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_004
     * @tc.name AsyncGeneratorFuncTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest004();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_005
     * @tc.name AsyncGeneratorFuncTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest005();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_006
     * @tc.name AsyncGeneratorFuncTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest006();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_007
     * @tc.name AsyncGeneratorFuncTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest007();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_008
     * @tc.name AsyncGeneratorFuncTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest008();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_009
     * @tc.name AsyncGeneratorFuncTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest009();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_010
     * @tc.name AsyncGeneratorFuncTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest010();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_011
     * @tc.name AsyncGeneratorFuncTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest011();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_012
     * @tc.name AsyncGeneratorFuncTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest012();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_013
     * @tc.name AsyncGeneratorFuncTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest013();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_014
     * @tc.name AsyncGeneratorFuncTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest014();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_015
     * @tc.name AsyncGeneratorFuncTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest015();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_016
     * @tc.name AsyncGeneratorFuncTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest016();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_017
     * @tc.name AsyncGeneratorFuncTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest017();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_018
     * @tc.name AsyncGeneratorFuncTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result:boolean = await AsyncGeneratorFuncTest018();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_019
     * @tc.name AsyncGeneratorFuncTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest019();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_020
     * @tc.name AsyncGeneratorFuncTest020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest020();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_021
     * @tc.name AsyncGeneratorFuncTest021
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest021();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_022
     * @tc.name AsyncGeneratorFuncTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest022();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_023
     * @tc.name AsyncGeneratorFuncTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest023();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_024
     * @tc.name AsyncGeneratorFuncTest024
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest024();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_025
     * @tc.name AsyncGeneratorFuncTest025
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest025();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_026
     * @tc.name AsyncGeneratorFuncTest026
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest026();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_027
     * @tc.name AsyncGeneratorFuncTest027
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest027();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_028
     * @tc.name AsyncGeneratorFuncTest028
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest028();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_029
     * @tc.name AsyncGeneratorFuncTest029
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest029();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_030
     * @tc.name AsyncGeneratorFuncTest030
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest030();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_031
     * @tc.name AsyncGeneratorFuncTest031
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest031();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_032
     * @tc.name AsyncGeneratorFuncTest032
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest032();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_033
     * @tc.name AsyncGeneratorFuncTest033
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest033();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_034
     * @tc.name AsyncGeneratorFuncTest034
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest034();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_035
     * @tc.name AsyncGeneratorFuncTest035
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest035();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_036
     * @tc.name AsyncGeneratorFuncTest036
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest036();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_037
     * @tc.name AsyncGeneratorFuncTest037
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest037();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_038
     * @tc.name AsyncGeneratorFuncTest038
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest038();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_039
     * @tc.name AsyncGeneratorFuncTest039
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest039();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_040
     * @tc.name AsyncGeneratorFuncTest040
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest040();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_041
     * @tc.name AsyncGeneratorFuncTest041
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest041();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_042
     * @tc.name AsyncGeneratorFuncTest042
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest042();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_043
     * @tc.name AsyncGeneratorFuncTest043
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest043();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_044
     * @tc.name AsyncGeneratorFuncTest044
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest044();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_045
     * @tc.name AsyncGeneratorFuncTest045
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest045();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_046
     * @tc.name AsyncGeneratorFuncTest046
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest046();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_047
     * @tc.name AsyncGeneratorFuncTest047
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest047();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_048
     * @tc.name AsyncGeneratorFuncTest048
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest048();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_049
     * @tc.name AsyncGeneratorFuncTest049
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest049();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_050
     * @tc.name AsyncGeneratorFuncTest050
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest050();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_051
     * @tc.name AsyncGeneratorFuncTest051
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest051();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_052
     * @tc.name AsyncGeneratorFuncTest052
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest052();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_053
     * @tc.name AsyncGeneratorFuncTest053
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest053();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_054
     * @tc.name AsyncGeneratorFuncTest054
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest054();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_055
     * @tc.name AsyncGeneratorFuncTest055
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest055();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_056
     * @tc.name AsyncGeneratorFuncTest056
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest056();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_057
     * @tc.name AsyncGeneratorFuncTest057
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest057();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_058
     * @tc.name AsyncGeneratorFuncTest058
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest058();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_059
     * @tc.name AsyncGeneratorFuncTest059
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest059();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_060
     * @tc.name AsyncGeneratorFuncTest060
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest060();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_061
     * @tc.name AsyncGeneratorFuncTest061
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest061();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_062
     * @tc.name AsyncGeneratorFuncTest062
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest062();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_063
     * @tc.name AsyncGeneratorFuncTest063
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest063();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_064
     * @tc.name AsyncGeneratorFuncTest064
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest064();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_065
     * @tc.name AsyncGeneratorFuncTest065
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest065();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_066
     * @tc.name AsyncGeneratorFuncTest066
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest066();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_067
     * @tc.name AsyncGeneratorFuncTest067
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest067();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_068
     * @tc.name AsyncGeneratorFuncTest068
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest068();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_069
     * @tc.name AsyncGeneratorFuncTest069
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest069();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_070
     * @tc.name AsyncGeneratorFuncTest070
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest070();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_071
     * @tc.name AsyncGeneratorFuncTest071
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest071();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_072
     * @tc.name AsyncGeneratorFuncTest072
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest072();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_073
     * @tc.name AsyncGeneratorFuncTest073
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest073();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_074
     * @tc.name AsyncGeneratorFuncTest074
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest074();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_075
     * @tc.name AsyncGeneratorFuncTest075
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest075();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_076
     * @tc.name AsyncGeneratorFuncTest076
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest076();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_077
     * @tc.name AsyncGeneratorFuncTest077
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest077();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_078
     * @tc.name AsyncGeneratorFuncTest078
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest078();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_079
     * @tc.name AsyncGeneratorFuncTest079
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest079();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_080
     * @tc.name AsyncGeneratorFuncTest080
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest080();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_081
     * @tc.name AsyncGeneratorFuncTest081
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest081();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_082
     * @tc.name AsyncGeneratorFuncTest082
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest082();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_083
     * @tc.name AsyncGeneratorFuncTest083
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest083();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_084
     * @tc.name AsyncGeneratorFuncTest084
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest084();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_085
     * @tc.name AsyncGeneratorFuncTest085
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest085();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_086
     * @tc.name AsyncGeneratorFuncTest086
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest086();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_087
     * @tc.name AsyncGeneratorFuncTest087
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest087();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_088
     * @tc.name AsyncGeneratorFuncTest088
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest088();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_089
     * @tc.name AsyncGeneratorFuncTest089
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest089();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_090
     * @tc.name AsyncGeneratorFuncTest090
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest090();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_091
     * @tc.name AsyncGeneratorFuncTest091
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest091();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_092
     * @tc.name AsyncGeneratorFuncTest092
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest092();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_093
     * @tc.name AsyncGeneratorFuncTest093
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest093();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_094
     * @tc.name AsyncGeneratorFuncTest094
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest094();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_095
     * @tc.name AsyncGeneratorFuncTest095
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest095();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_096
     * @tc.name AsyncGeneratorFuncTest096
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest096();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_097
     * @tc.name AsyncGeneratorFuncTest097
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest097();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_098
     * @tc.name AsyncGeneratorFuncTest098
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest098();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_099
     * @tc.name AsyncGeneratorFuncTest099
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest099();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_AsyncGeneratorFunc_TEST_100
     * @tc.name AsyncGeneratorFuncTest100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGeneratorFuncTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await AsyncGeneratorFuncTest100();
      expect(result).assertEqual(true);
    });
  })
}