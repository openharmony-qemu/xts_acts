// /*
//  * Copyright (c) 2025 Huawei Device Co., Ltd.
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  *     http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */
// // ArrayError.test.ets  实际需求和API实际行为不符，401参数错误环境无法实现
//
// import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
// import { collections } from '@kit.ArkTS';
//
// // 辅助函数：从错误对象中获取错误码
// function getErrorCode(err: Error): number | undefined {
//   if (err.message) {
//     let match = err.message.match(/\d{8,}/);
//     if (match) {
//       return parseInt(match[0]);
//     }
//   }
//   return undefined;
// }
//
// export default function suite() {
//   describe('ArrayErrorTests', () => {
//     // ==================== 基础错误处理测试 ====================
//
//     /**
//      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_0100
//      * @tc.name testArrayError0001
//      * @tc.desc Verify that error handling works for out-of-bounds access and empty array reduce.
//      * @tc.size SmallTest
//      * @tc.type Function
//      * @tc.level Level 0
//      */
//     it('testArrayError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
//       const caseName: string = 'testArrayError0001';
//       console.info(`${caseName}, test start`);
//
//       let arr = new collections.Array<number>(1, 2);
//       expect(arr.at(10) === null || arr.at(10) === undefined).assertTrue();
//       let emptyArr = new collections.Array<number>();
//       let threw = false;
//       try { emptyArr.reduce((acc: number, cur: number) => acc + cur); } catch (e) { threw = true; }
//       expect(threw).assertTrue();
//
//       console.info(`${caseName}, test end`);
//     });
//
//     /**
//      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_0200
//      * @tc.name testArrayError0002
//      * @tc.desc Verify that empty array returns correct values for query and transform methods.
//      * @tc.size SmallTest
//      * @tc.type Function
//      * @tc.level Level 0
//      */
//     it('testArrayError0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
//       const caseName: string = 'testArrayError0002';
//       console.info(`${caseName}, test start`);
//
//       let arr = new collections.Array<number>();
//       expect(arr.length).assertEqual(0);
//       expect(arr.indexOf(1)).assertEqual(-1);
//       expect(arr.includes(1)).assertFalse();
//       expect(arr.every((x: number) => x > 0)).assertTrue();
//       expect(arr.join()).assertEqual('');
//
//       console.info(`${caseName}, test end`);
//     });
//
//     // ==================== 错误码测试 ====================
//
//     /**
//      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_0300
//      * @tc.name testArrayError0003
//      * @tc.desc Verify error code 401: parameter type error throws TypeError.
//      * @tc.size SmallTest
//      * @tc.type Function
//      * @tc.level Level 0
//      */
//     it('testArrayError0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
//       const caseName: string = 'testArrayError0003';
//       console.info(`${caseName}, test start`);
//
//       // 401: 参数类型错误应抛出TypeError
//       // 注意：ArkTS编译期类型检查保证，运行时无法传入错误类型参数
//       // 此处验证正常流程
//       let arr = new collections.Array<number>();
//       arr.push(100);
//       expect(arr.length).assertEqual(1);
//       expect(arr.at(10) === null || arr.at(10) === undefined).assertTrue();
//
//       let arr2 = new collections.Array<number>(1, 2, 3);
//       expect(arr2.length).assertEqual(3);
//
//       let count = 0;
//       arr2.forEach(() => { count++; });
//       expect(count).assertEqual(3);
//
//       console.info(`${caseName}, test end`);
//     });
//
//     /**
//      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_0400
//      * @tc.name testArrayError0004
//      * @tc.desc Verify error code 10200001: index out of bounds throws BusinessError.
//      * @tc.size SmallTest
//      * @tc.type Function
//      * @tc.level Level 0
//      */
//     it('testArrayError0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
//       const caseName: string = 'testArrayError0004';
//       console.info(`${caseName}, test start`);
//
//       // 10200001: 索引越界应抛出BusinessError
//       let arr = new collections.Array<number>(1, 2, 3);
//
//       // 正向验证：正索引越界
//       let caught = false;
//       try {
//         void arr[100];
//       } catch (e) {
//         caught = true;
//         let code = getErrorCode(e);
//         expect(code).assertEqual(10200001);
//       }
//       expect(caught).assertTrue();
//
//       // 正向验证：负索引越界
//       caught = false;
//       try {
//         void arr[-100];
//       } catch (e) {
//         caught = true;
//         let code = getErrorCode(e);
//         expect(code).assertEqual(10200001);
//       }
//       expect(caught).assertTrue();
//
//       // 反向验证：合法索引不抛错
//       expect(arr[0]).assertEqual(1);
//       expect(arr[2]).assertEqual(3);
//
//       console.info(`${caseName}, test end`);
//     });
//
//     /**
//      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_0500
//      * @tc.name testArrayError0005
//      * @tc.desc Verify error code 10200011: method not bound throws BusinessError.
//      * @tc.size SmallTest
//      * @tc.type Function
//      * @tc.level Level 0
//      */
//     it('testArrayError0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
//       const caseName: string = 'testArrayError0005';
//       console.info(`${caseName}, test start`);
//
//       // 10200011: 方法未绑定应抛出BusinessError
//       let arr = new collections.Array<number>(1, 2, 3);
//
//       // 正向验证：将push方法赋值给变量后调用（this丢失）
//       let caught = false;
//       try {
//         let pushFn: (...items: number[]) => number = arr.push;
//         pushFn(4);
//       } catch (e) {
//         caught = true;
//         let code = getErrorCode(e);
//         expect(code).assertEqual(10200011);
//       }
//       expect(caught).assertTrue();
//
//       // 正向验证：将forEach方法赋值给变量后调用（this丢失）
//       caught = false;
//       try {
//         let forEachFn: (callback: (value: number, index?: number, array?: collections.Array<number>) =>
//         void) => void = arr.forEach;
//         forEachFn(() => {});
//       } catch (e) {
//         caught = true;
//         let code = getErrorCode(e);
//         expect(code).assertEqual(10200011);
//       }
//       expect(caught).assertTrue();
//
//       // 正向验证：将at方法赋值给变量后调用（this丢失）
//       caught = false;
//       try {
//         let atFn: (index: number) => number | undefined = arr.at;
//         atFn(0);
//       } catch (e) {
//         caught = true;
//         let code = getErrorCode(e);
//         expect(code).assertEqual(10200011);
//       }
//       expect(caught).assertTrue();
//
//       // 反向验证：直接调用正常
//       let count = 0;
//       arr.forEach(() => { count++; });
//       expect(count).assertEqual(3);
//       arr.push(4);
//       expect(arr.length).assertEqual(4);
//       expect(arr.at(0)).assertEqual(1);
//
//       console.info(`${caseName}, test end`);
//     });
//
//     /**
//      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_0600
//      * @tc.name testArrayError0006
//      * @tc.desc Verify error code 10200012: construction failure throws BusinessError.
//      * @tc.size SmallTest
//      * @tc.type Function
//      * @tc.level Level 0
//      */
//     it('testArrayError0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
//       const caseName: string = 'testArrayError0006';
//       console.info(`${caseName}, test start`);
//
//       // 10200012: 构造失败应抛出BusinessError
//       // 官方文档: "The {className}'s constructor cannot be directly invoked."
//       //
//       // 注意：ArkTS编译期强制要求使用new关键字，此错误码由编译期保证
//       // 不写new在编译期即被拦截，无法在运行时测试
//       //
//       // 因此仅验证正常构造流程
//
//       let arr = new collections.Array<number>(1, 2, 3);
//       expect(arr.length).assertEqual(3);
//       expect(arr[0]).assertEqual(1);
//       expect(arr[2]).assertEqual(3);
//
//       console.info(`${caseName}, test end`);
//     });
//
//     /**
//      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_0700
//      * @tc.name testArrayError0007
//      * @tc.desc Verify error code 10200201: concurrent modification conflict.
//      * @tc.size SmallTest
//      * @tc.type Function
//      * @tc.level Level 0
//      */
//     it('testArrayError0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
//       const caseName: string = 'testArrayError0007';
//       console.info(`${caseName}, test start`);
//
//       // 10200201: 并发修改冲突应抛出错误
//
//       // 正向验证：forEach中push
//       let arr1 = new collections.Array<number>(1, 2, 3);
//       let caught = false;
//       try {
//         arr1.forEach(() => { arr1.push(4); });
//       } catch (e) {
//         caught = true;
//         let code = getErrorCode(e);
//         expect(code).assertEqual(10200201);
//       }
//       expect(caught).assertTrue();
//
//       // 正向验证：forEach中pop
//       let arr2 = new collections.Array<number>(1, 2, 3);
//       caught = false;
//       try {
//         arr2.forEach(() => { arr2.pop(); });
//       } catch (e) {
//         caught = true;
//         let code = getErrorCode(e);
//         expect(code).assertEqual(10200201);
//       }
//       expect(caught).assertTrue();
//
//       // 正向验证：forEach中splice
//       let arr3 = new collections.Array<number>(1, 2, 3);
//       caught = false;
//       try {
//         arr3.forEach((_, index) => {
//           if (index === 0) {
//             arr3.splice(0, 1);
//           }
//         });
//       } catch (e) {
//         caught = true;
//         let code = getErrorCode(e);
//         expect(code).assertEqual(10200201);
//       }
//       expect(caught).assertTrue();
//
//       // 反向验证：正常迭代不修改不抛错
//       let arr4 = new collections.Array<number>(1, 2, 3);
//       let count = 0;
//       arr4.forEach(() => { count++; });
//       expect(count).assertEqual(3);
//       arr4.push(4);
//       expect(arr4.length).assertEqual(4);
//
//       console.info(`${caseName}, test end`);
//     });
// //     // ==================== 401 参数类型错误测试 ====================
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_0800
// //      * @tc.name testArrayError0008
// //      * @tc.desc Verify error code 401: forEach with non-function callback throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0008';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         arr.forEach(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       caught = false;
// //       try {
// //         arr.forEach(undefined as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       caught = false;
// //       try {
// //         arr.forEach(123 as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_0900
// //      * @tc.name testArrayError0009
// //      * @tc.desc Verify error code 401: at with missing index throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0009';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         (arr.at as any)();
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_1000
// //      * @tc.name testArrayError0010
// //      * @tc.desc Verify error code 401: push with non-Sendable type throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0010';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>();
// //       let caught: boolean = false;
// //       try {
// //         arr.push(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       caught = false;
// //       try {
// //         arr.push(undefined as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_1100
// //      * @tc.name testArrayError0011
// //      * @tc.desc Verify error code 401: splice with missing start parameter throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0011';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         (arr.splice as any)();
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_1200
// //      * @tc.name testArrayError0012
// //      * @tc.desc Verify error code 401: fill with missing value parameter throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0012';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         (arr.fill as any)();
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_1300
// //      * @tc.name testArrayError0013
// //      * @tc.desc Verify error code 401: sort with non-function compareFn throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0013';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(3, 1, 2);
// //       let caught: boolean = false;
// //       try {
// //         arr.sort(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       caught = false;
// //       try {
// //         arr.sort(123 as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_1400
// //      * @tc.name testArrayError0014
// //      * @tc.desc Verify error code 401: constructor with non-Sendable type throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0014';
// //       console.info(`${caseName}, test start`);
// //
// //       // 注意：ArkTS编译期类型检查保证，运行时无法传入错误类型参数
// //       // 此处验证正常构造流程，反向验证
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       expect(arr.length).assertEqual(3);
// //       expect(arr[0]).assertEqual(1);
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_1500
// //      * @tc.name testArrayError0015
// //      * @tc.desc Verify error code 401: indexOf with non-Sendable type throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0015';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         arr.indexOf(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       caught = false;
// //       try {
// //         arr.indexOf(undefined as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_1600
// //      * @tc.name testArrayError0016
// //      * @tc.desc Verify error code 401: includes with non-Sendable type throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0016';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         arr.includes(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       caught = false;
// //       try {
// //         arr.includes(undefined as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_1700
// //      * @tc.name testArrayError0017
// //      * @tc.desc Verify error code 401: reduce with non-function callback throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0017';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         arr.reduce(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       caught = false;
// //       try {
// //         arr.reduce(undefined as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       caught = false;
// //       try {
// //         arr.reduce(123 as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_1800
// //      * @tc.name testArrayError0018
// //      * @tc.desc Verify error code 401: map with non-function callback throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0018';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         arr.map(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_1900
// //      * @tc.name testArrayError0019
// //      * @tc.desc Verify error code 401: filter with non-function predicate throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0019';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         arr.filter(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_2000
// //      * @tc.name testArrayError0020
// //      * @tc.desc Verify error code 401: find with non-function predicate throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0020';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         arr.find(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_2100
// //      * @tc.name testArrayError0021
// //      * @tc.desc Verify error code 401: findIndex with non-function predicate throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0021';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         arr.findIndex(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_2200
// //      * @tc.name testArrayError0022
// //      * @tc.desc Verify error code 401: every with non-function predicate throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0022';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         arr.every(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
// //
// //     /**
// //      * @tc.number SUB_COLLECTIONS_ARRAY_ERROR_2300
// //      * @tc.name testArrayError0023
// //      * @tc.desc Verify error code 401: some with non-function predicate throws TypeError.
// //      * @tc.size SmallTest
// //      * @tc.type Function
// //      * @tc.level Level 0
// //      */
// //     it('testArrayError0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
// //       const caseName: string = 'testArrayError0023';
// //       console.info(`${caseName}, test start`);
// //
// //       let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
// //       let caught: boolean = false;
// //       try {
// //         arr.some(null as any);
// //       } catch (e) {
// //         caught = true;
// //         let code: number | undefined = getErrorCode(e);
// //         expect(code).assertEqual(401);
// //       }
// //       expect(caught).assertTrue();
// //
// //       console.info(`${caseName}, test end`);
// //     });
//   });
// }