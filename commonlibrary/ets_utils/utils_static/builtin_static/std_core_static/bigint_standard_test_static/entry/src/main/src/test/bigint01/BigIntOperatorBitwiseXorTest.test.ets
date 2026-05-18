/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorBitwiseXor测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorBitwiseXorTest(): void {
  describe('BigInt.operatorBitwiseXor（导图 operatorBitwiseXor）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0100
     * @tc.name testBigIntOperatorBitwiseXorBasic0100
     * @tc.desc Verify basic bitwise XOR results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(5).operatorBitwiseXor(new BigInt(3)).toString()).assertEqual('6');
        expect(new BigInt(12).operatorBitwiseXor(new BigInt(10)).toString()).assertEqual('6');
        expect(new BigInt(255).operatorBitwiseXor(new BigInt(15)).toString()).assertEqual('240');
        expect(new BigInt(1).operatorBitwiseXor(new BigInt(2)).toString()).assertEqual('3');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0200
     * @tc.name testBigIntOperatorBitwiseXorSpecial0200
     * @tc.desc Verify XOR with zero, self, and minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorSpecial0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(123).operatorBitwiseXor(new BigInt(0)).toString()).assertEqual('123');
        expect(new BigInt(255).operatorBitwiseXor(new BigInt(255)).toString()).assertEqual('0');
        expect(new BigInt(5).operatorBitwiseXor(new BigInt(-1)).toString()).assertEqual('-6');
        expect(new BigInt(0).operatorBitwiseXor(new BigInt(-1)).toString()).assertEqual('-1');
        expect(new BigInt(-100).operatorBitwiseXor(new BigInt(-1)).toString()).assertEqual('99');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0300
     * @tc.name testBigIntOperatorBitwiseXorCommutative0300
     * @tc.desc Verify commutative property of bitwise XOR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorCommutative0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(12);
        const b = new BigInt(10);
        expect(a.operatorBitwiseXor(b).toString()).assertEqual(b.operatorBitwiseXor(a).toString());
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0400
     * @tc.name testBigIntOperatorBitwiseXorReturnType0400
     * @tc.desc Verify operatorBitwiseXor returns BigInt and supports chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorReturnType0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = new BigInt(5).operatorBitwiseXor(new BigInt(3));
        expect(result instanceof BigInt).assertTrue();
        expect(new BigInt(1).operatorBitwiseXor(new BigInt(2)).operatorBitwiseXor(new BigInt(4)).toString())
          .assertEqual('7');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0500
     * @tc.name testBigIntOperatorBitwiseXorInvalidArg0500
     * @tc.desc Verify operatorBitwiseXor rejects invalid operand types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorInvalidArg0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const left = new BigInt(5);
        expect((): void => {
          left.operatorBitwiseXor(null as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          left.operatorBitwiseXor(undefined as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          left.operatorBitwiseXor(5 as object as BigInt);
        }).assertThrowError('TypeError');
      });
  });
}
