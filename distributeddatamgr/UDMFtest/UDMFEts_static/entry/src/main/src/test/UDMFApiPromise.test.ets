/**
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import uniformDataStruct from '@ohos.data.uniformDataStruct';

let tag: string = 'testTag';
export default function UDMFApiDescriptorTest() {
	describe("UDMFApiDescriptorTest", (): void => {
		beforeEach(async () => {
			console.log(tag, `beforeEach`);
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			try {
				let data = await unifiedDataChannel.deleteData(options);
				let size = JSON.stringify(data).length;
				console.log(tag, `[beforeEach] success to deleteData data. size = ${size}`);
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code}, message is ${error.message}`)
				expect().assertFail();
			}
		})
		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100
		* @tc.desc   unifiedDataChannel insertData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100 start');
			let Options:unifiedDataChannel.Options = {}
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = 'this is textContent';
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				await unifiedDataChannel.insertData(Options, unifiedData)
				expect().assertFail();
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed to insertData0100 code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
			}
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100 end');
			})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200
		* @tc.desc   unifiedDataChannel insertData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200 start');
			let Options :unifiedDataChannel.Options= {
				intention: undefined
			}
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = 'this is textContent';
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				await unifiedDataChannel.insertData(Options, unifiedData);
				expect().assertFail();
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed to insertData0200 code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
			}
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200 end');
			})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400
		* @tc.desc   unifiedDataChannel insertData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400 start');
			let Options:unifiedDataChannel.Options = {
				intention: undefined,
				key: undefined
			}
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = 'this is textContent';
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				await unifiedDataChannel.insertData(Options, unifiedData);
				expect().assertFail();
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed to insertData0400 code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
			}
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400 end');
		})

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500
     * @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500
     * @tc.desc   unifiedDataChannel insertData promise interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500 start');
      let Options:unifiedDataChannel.Options = {
        key: String (null)
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        await unifiedDataChannel.insertData(Options, unifiedData);
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed to insertData0300 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500 end');
    })
		
		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600
		* @tc.desc   unifiedDataChannel insertData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			}
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = 'this is textContent';
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				let data = unifiedDataChannel.insertData(options, unifiedData);
				console.log(tag, `data = ${data}, options = ${options}`);
				expect(data !== null).assertEqual(true);
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed to insertData0500 code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
			}
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600 end');
			})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000
		* @tc.desc   unifiedDataChannel updateData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			}
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData1000 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.updateData({
					key: data
				}, unifiedData)
				console.log(tag, `updateData1000 success.`)
				console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000 end');
				done();
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100
		* @tc.desc   unifiedDataChannel queryData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
				console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
					console.log(tag, `insertData01100 success; data = ${data}, options = ${options}`);
					unifiedDataChannel.queryData(options).then((data) => {
					console.log(tag, `Succeeded in querying data. size = ${data.length}`);
					expect(data.length - ret!.length).assertEqual(1)
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100 end');
					done();
					}).catch((err: Error) => {
					console.error(tag, `Failed to query data. code is ${err.code}, message is ${err.message}`);
					expect().assertFail();
					done();
					})
				});
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200
		* @tc.desc   unifiedDataChannel queryData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01200 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData({ key: data}).then((data) => {
					console.log(tag, `Succeeded in querying data. size = ${data.length}`);
					expect(data.length).assertEqual(1)
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200 end');
					done();
				}).catch((err: Error) => {
					console.error(tag, `Failed to query data. code is ${err.code}, message is ${err.message}`);
					expect().assertFail();
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300
		* @tc.desc   unifiedDataChannel queryData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01300 success; data = ${data}, options = ${options}`);
				let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: data
				};
				unifiedDataChannel.queryData(options2).then((data) => {
					console.log(tag, `Succeeded in querying data. size = ${data.length}`);
					expect(data.length).assertEqual(1)
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300 end');
					done();
				}).catch((err: Error) => {
					console.error(tag, `Failed to query data. code is ${err.code}, message is ${err.message}`);
					expect().assertFail();
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400
		* @tc.desc   unifiedDataChannel queryData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01400 success; data = ${data}, options = ${options}`);
				let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: 'data'
				};
				unifiedDataChannel.queryData(options2).then((data) => {
					expect().assertFail();
					done();
				}).catch((err: Error) => {
					console.error(tag, `Failed to query data. code is ${err.code}, message is ${err.message}`);
					expect(err.code).assertEqual(401);
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1500
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1500
		* @tc.desc   unifiedDataChannel queryData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
		console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01500 success; data = ${data}, options = ${options}`);
				let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: undefined
				};
				unifiedDataChannel.queryData(options2).then((data) => {
					console.log(tag, `Succeeded in querying data. size = ${data.length}`);
					expect(data.length).assertEqual(1)
					done();
				}).catch((err: Error) => {
					console.error(tag, `Failed to query data. code is ${err.code}, message is ${err.message}`);
					expect().assertFail();
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1500 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_SDK_UnifiedDataPromiseJsAPITest_1600
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1600
		* @tc.desc   unifiedDataChannel deleteData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_SDK_UnifiedDataPromiseJsAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
		console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1600 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01600 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
					console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
					let ret2 = await unifiedDataChannel.deleteData(options);
					if (ret2 !== undefined) {
					let size = ret2.length;
					for (let i = 0; i < size; i++) {
						let records = ret2[i].getRecords();
						let size = records.length;
						for (let j = 0; j < size; j++) {
						if (records[j].getTypes().includes(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT)) {
							let text = records[j].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
							console.log(tag, `${i + 1}.${text.textContent}`);
							expect(text.textContent).assertEqual('hello world!')
						}
						}
					}
					expect(size).assertEqual(1);
					}
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1600 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700
		* @tc.desc   unifiedDataChannel deleteData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
		console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01700 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
					console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
					let ret2 = await unifiedDataChannel.deleteData({ key: data});
					if (ret2 !== undefined) {
					let size = ret2.length;
					for (let i = 0; i < size; i++) {
						let records = ret2[i].getRecords();
						let size = records.length;
						for (let j = 0; j < size; j++) {
						if (records[j].getTypes().includes(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT)) {
							let text = records[j].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
							console.log(tag, `${i + 1}.${text.textContent}`);
							expect(text.textContent).assertEqual('hello world!')
						}
						}
					}
					expect(size).assertEqual(1);
					}
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800
		* @tc.desc   unifiedDataChannel deleteData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
		console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01800 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
					console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
					let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: data
					};
					let ret2 = await unifiedDataChannel.deleteData(options2);
					if (ret2 !== undefined) {
					let size = ret2.length;
					for (let i = 0; i < size; i++) {
						let records = ret2[i].getRecords();
						let size = records.length;
						for (let j = 0; j < size; j++) {
						if (records[j].getTypes().includes(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT)) {
							let text = records[j].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
							console.log(tag, `${i + 1}.${text.textContent}`);
							expect(text.textContent).assertEqual('hello world!')
						}
						}
					}
					expect(size).assertEqual(1);
					}
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900
		* @tc.desc   unifiedDataChannel deleteData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01900 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
					console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
					let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: 'data'
					};
					await unifiedDataChannel.deleteData(options2).then((data) => {
					expect().assertFail();
					done();
					}).catch((err: Error) => {
					console.error(tag, `Failed to delete data. code is ${err.code}, message is ${err.message}`);
					expect(err.code).assertEqual(401);
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900 end');
					done();
					})
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000
		* @tc.desc   unifiedDataChannel deleteData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01100 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
					console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
					let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: undefined
					};
					let ret2 = await unifiedDataChannel.deleteData(options2);
					if (ret2 !== undefined) {
					let size = ret2.length;
					for (let i = 0; i < size; i++) {
						let records = ret2[i].getRecords();
						let size = records.length;
						for (let j = 0; j < size; j++) {
						if (records[j].getTypes().includes(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT)) {
							let text = records[j].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
							console.log(tag, `${i + 1}.${text.textContent}`);
							expect(text.textContent).assertEqual('hello world!')
						}
						}
					}
					expect(size).assertEqual(1);
					}
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		it('SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
			try {
				unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.CROSS_APP);
				console.log(tag, `removeAppShareOptions is succeed`);
				expect().assertFail();
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(201)
			}
		})
	});
}