     */
    it('testBigInt64ArrayConstructorThree1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1290
     * @tc.name testBigInt64ArrayConstructorThree1290
     * @tc.desc Verify `new BigInt64Array(buf, 8, 8)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 8);
        expect(arr.length).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1300
     * @tc.name testBigInt64ArrayConstructorThree1300
     * @tc.desc Verify `new BigInt64Array(buf, 8, 8)` produces a result where `arr.byteLength` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 8);
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1310
     * @tc.name testBigInt64ArrayConstructorThree1310
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 8);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1320
     * @tc.name testBigInt64ArrayConstructorThree1320
     * @tc.desc Verify `new BigInt64Array(buf, 8, 10)` produces a result where `arr.length` equals `10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 10);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1330
     * @tc.name testBigInt64ArrayConstructorThree1330
     * @tc.desc Verify `new BigInt64Array(buf, 8, 10)` produces a result where `arr.byteLength` equals `80`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 10);
        expect(arr.byteLength).assertEqual(80);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1340
     * @tc.name testBigInt64ArrayConstructorThree1340
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 10);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });


  });
}
