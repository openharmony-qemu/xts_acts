/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import napitest from 'libnapitest.so';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  switch (e.data) {
    case 'getLastError': {
      let getLastErrorValue = napitest.napiSerialize();
      workerPort.postMessage(getLastErrorValue);
      break;
    }
    case 'isError': {
      let isErrorValue = napitest.isError(true);
      workerPort.postMessage(isErrorValue);
      break;
    }
    case 'createError': {
      let createErrorValue = napitest.createError();
      workerPort.postMessage(createErrorValue);
      break;
    }
    case 'createRangeError': {
      let createRangeErrorValue = napitest.createRangeError();
      workerPort.postMessage(createRangeErrorValue);
      break;
    }
    case 'isExceptionPending': {
      let isExceptionPendingValue = napitest.isExceptionPending();
      workerPort.postMessage(isExceptionPendingValue);
      break;
    }
    case 'createReference': {
      let createReferenceValue = napitest.createReference();
      workerPort.postMessage(createReferenceValue);
      break;
    }
    case 'referenceRefAndUnref': {
      let referenceRefAndUnrefValue = napitest.referenceRefAndUnref();
      workerPort.postMessage(referenceRefAndUnrefValue);
      break;
    }
    case 'createArrayAndGetLength': {
      let array = [1, 2];
      let createArrayAndGetLengthValue = napitest.createArrayAndGetLength(array);
      let createArrayAndGetLengthObj = JSON.stringify(createArrayAndGetLengthValue);
      workerPort.postMessage(createArrayAndGetLengthObj);
      break;
    }
    case 'createExternal': {
      let createExternalValue = napitest.createExternal();
      workerPort.postMessage(createExternalValue);
      break;
    }
    case 'createExternalArraybuffer': {
      let createExternalArraybufferValue = napitest.createExternalArraybuffer();
      let createExternalArraybufferRes = createExternalArraybufferValue instanceof ArrayBuffer;
      workerPort.postMessage(createExternalArraybufferRes);
      break;
    }
    case 'createObject': {
      let createObjectValue = napitest.createObject();
      let createObjectRes = createObjectValue instanceof Object;
      workerPort.postMessage(createObjectRes);
      break;
    }
    case 'createSymbol': {
      let symbolValue = napitest.createSymbol('symbol');
      workerPort.postMessage(symbolValue);
      break;
    }
    case 'createTypeArray': {
      let typeArrayValue = napitest.createTypeArray();
      workerPort.postMessage(typeArrayValue instanceof Int32Array);
      break;
    }
    case 'getValueBool': {
      let boolValue = napitest.getValueBool(false);
      workerPort.postMessage(boolValue);
      break;
    }
    case 'createAndGetInt32': {
      let int32Value = napitest.createAndGetInt32(32);
      workerPort.postMessage(int32Value);
      break;
    }
    case 'createAndGetUInt32': {
      let uInt32Value = napitest.createAndGetUInt32(32);
      workerPort.postMessage(uInt32Value);
      break;
    }
    case 'createAndGetInt64': {
      let int64Value = napitest.createAndGetInt64(23);
      workerPort.postMessage(int64Value);
      break;
    }
    case 'createDouble': {
      let doubleValue = napitest.createDouble(24.67);
      workerPort.postMessage(doubleValue);
      break;
    }
    case 'createAndGetStringUtf16': {
      let utf16Value = napitest.createAndGetStringUtf16('he');
      workerPort.postMessage(utf16Value);
      break;
    }
    case 'stringUtf16OfCase': {
      let utf16CaseValue = napitest.stringUtf16OfCase('abc2r42');
      workerPort.postMessage(utf16CaseValue);
      break;
    }
    case 'getValueDouble': {
      let valueDouble = napitest.getValueDouble(24.5);
      workerPort.postMessage(valueDouble);
      break;
    }
    case 'getValueExternal': {
      let externalValue = napitest.getValueExternal();
      workerPort.postMessage(externalValue);
      break;
    }
    case 'getNull': {
      let nullValue = napitest.getNull();
      workerPort.postMessage(nullValue);
      break;
    }
    case 'getUndefined': {
      let undefinedValue = napitest.getUndefined();
      workerPort.postMessage(undefinedValue);
      break;
    }
    case 'coerceToBool': {
      let coerceBoolValue = napitest.coerceToBool(0);
      workerPort.postMessage(coerceBoolValue);
      break;
    }
    case 'coerceToNumber': {
      let coerceNumberValue = napitest.coerceToNumber('12');
      workerPort.postMessage(coerceNumberValue);
      break;
    }
    case 'coerceToObject': {
      let obj = napitest.coerceToObject([2, 3]);
      workerPort.postMessage(JSON.stringify(obj));
      break;
    }
    case 'coerceToString': {
      let value = napitest.coerceToString(123);
      workerPort.postMessage(value);
      break;
    }
    case 'typeOf': {
      let value = napitest.typeOf('test');
      workerPort.postMessage(value);
      break;
    }
    case 'isArray': {
      let value = napitest.isArray();
      workerPort.postMessage(value);
      break;
    }
    case 'strictEquals': {
      let value = napitest.strictEquals();
      workerPort.postMessage(value);
      break;
    }
    case 'getPropertyNames': {
      let value = napitest.getPropertyNames();
      workerPort.postMessage(value);
      break;
    }
    case 'setProperty': {
      let value = napitest.setProperty();
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'getProperty': {
      let value = napitest.getProperty();
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'hasProperty': {
      let value = napitest.hasProperty();
      workerPort.postMessage(value);
      break;
    }
    case 'setAndDeleteProperty': {
      interface Person {
        name: string,
        age: number
      }

      let peop: Person = { name: 'John', age: 30 };
      let value = napitest.setAndDeleteProperty(peop, 'a');
      workerPort.postMessage(value);
      break;
    }
    case 'hasOwnProperty': {
      interface Person {
        name: string,
        age: number
      }

      let peop: Person = {
        name: 'zhangsan',
        age: 18
      };
      let value = napitest.hasOwnProperty(peop, 'name');
      workerPort.postMessage(value);
      break;
    }
    case 'setNamedProperty': {
      let value = napitest.setNamedProperty([1, 2], 'e', false);
      workerPort.postMessage(value);
      break;
    }
    case 'getNamedProperty': {
      interface Person {
        name: string,
        age: number
      }

      let peop: Person = {
        name: 'zhangsan',
        age: 18
      };
      let value = napitest.getNamedProperty(peop, 'name');
      workerPort.postMessage(value);
      break;
    }
    case 'hasNamedProperty': {
      interface Person {
        name: string,
        age: number
      }

      let peop: Person = {
        name: 'zhangsan',
        age: 18
      };
      let value = napitest.hasNamedProperty(peop, 'name');
      workerPort.postMessage(value);
      break;
    }
    case 'setElement': {
      let value = napitest.setElement();
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'getElement': {
      let value = napitest.getElement();
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'hasElement': {
      let value = napitest.hasElement();
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'deleteElement': {
      let value = napitest.deleteElement();
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'defineProperties': {
      let value = napitest.defineProperties();
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'callFunctionNull': {
      let value = napitest.callFunctionNull(null);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateFunctionFuncNull': {
      let value = napitest.napiCreateFunctionFuncNull();
      workerPort.postMessage(value);
      break;
    }
    case 'napiGetCbInfo': {
      let value = napitest.napiGetCbInfo(12.06);
      workerPort.postMessage(value);
      break;
    }
    case 'unwrap': {
      let value = napitest.unwrap();
      workerPort.postMessage(value);
      break;
    }
    case 'removeWrap': {
      let value = napitest.removeWrap();
      workerPort.postMessage(value);
      break;
    }
    case 'getVersion': {
      let value = napitest.getVersion();
      workerPort.postMessage(value);
      break;
    }
    case 'createPromise': {
      let value = napitest.createPromise();
      workerPort.postMessage(value);
      break;
    }
    case 'resolveAndRejectDeferred': {
      let value = napitest.resolveAndRejectDeferred();
      workerPort.postMessage(value);
      break;
    }
    case 'isPromise': {
      let value = napitest.isPromise();
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateThreadsafeFunction': {
      let value = napitest.napiCreateThreadsafeFunction();
      workerPort.postMessage(value);
      break;
    }
    case 'napiDeleteSerializationDataTest': {
      let value = napitest.napiDeleteSerializationData();
      workerPort.postMessage(value);
      break;
    }
    case 'napiCallThreadsafeFunction': {
      let value = napitest.napiCallThreadsafeFunction();
      workerPort.postMessage(value);
      break;
    }
    case 'napiAnotherThreadSafeTest': {
      let value = napitest.ThreadSafeTestNull(() => 666);
      workerPort.postMessage(value);
      break;
    }
    case 'napiRefThreadsafeFunction': {
      let value = napitest.napiRefthreadSafeFunction();
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateDate': {
      let value = napitest.napiCreateDate();
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateBigintInt64': {
      let value = napitest.napiCreateBigintInt64();
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateBigintUint64': {
      let value = napitest.napiCreateBigintUint64();
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateBigintWords': {
      let value = napitest.napiCreateBigintWords();
      workerPort.postMessage(value);
      break;
    }
    case 'GetAllPropertyNamesEnvNull': {
      let value = napitest.GetAllPropertyNamesEnvNull();
      workerPort.postMessage(value);
      break;
    }
    case 'napiSetInstanceData': {
      let value = napitest.napiSetInstanceData();
      workerPort.postMessage(value);
      break;
    }
    case 'getModuleFileName': {
      let value = napitest.getModuleFileName().indexOf('.so');
      workerPort.postMessage(value);
      break;
    }
    case 'createAsyncResource': {
      let value = napitest.createAsyncResource({
        foo: 'bar'
      }, false);
      workerPort.postMessage(value);
      break;
    }
    case 'asyncWorkWithQos': {
      let value = napitest.asyncWorkWithQos(1000, (input) => {
        return input * 2;
      });
      workerPort.postMessage(value);
      break;
    }
    case 'napiRunScriptPathEnvNull': {
      let value = napitest.napiRunScriptPathEnvNull();
      workerPort.postMessage(value);
      break;
    }
    case 'napiLoadModuleTest': {
      let value = napitest.napiLoadModule();
      workerPort.postMessage(value);
      break;
    }
    case 'createObjectWithProperties': {
      let value = napitest.createObjectWithProperties();
      workerPort.postMessage(value);
      break;
    }
    case 'createObjectWithNamedProperties': {
      let value = napitest.createObjectWithNamedProperties();
      workerPort.postMessage(value);
      break;
    }
    case 'coerceToNativeBindingObjectEnvNull': {
      let value = napitest.coerceToNativeBindingObjectEnvNull(null);
      workerPort.postMessage(value);
      break;
    }
    case 'napiSerializeTest': {
      let value = napitest.napiSerialize();
      workerPort.postMessage(value);
      break;
    }
    case 'napiDeSerializeTest': {
      let value = napitest.napiDeSerialize();
      workerPort.postMessage(value);
      break;
    }
    case 'napiIsSendableTest': {
      let value = napitest.NapiIsSendable([1, 2]);
      workerPort.postMessage(value);
      break;
    }
    case 'NapiCreateSendableObject': {
      let value = napitest.NapiCreateSendableObject();
      workerPort.postMessage(napitest.NapiIsSendable(value));
      break;
    }
    case 'NapiCreateSendableArray': {
      let value = napitest.NapiCreateSendableArray();
      let res = value.length == 0;
      workerPort.postMessage(res && napitest.NapiIsSendable(value));
      break;
    }
    case 'NapiCreateSendableArrayWithLength': {
      let value = napitest.NapiCreateSendableArrayWithLength();
      let res = value.length == 1;
      workerPort.postMessage(res && napitest.NapiIsSendable(value));
      break;
    }
    case 'NapiCreateSendableArrayBuffer': {
      let value = napitest.NapiCreateSendableArrayBuffer();
      let res = value.byteLength == 1024;
      workerPort.postMessage(res && napitest.NapiIsSendable(value));
      break;
    }
    case 'NapiCreateSendableTypedArray': {
      let value = napitest.NapiCreateSendableTypedArray();
      let res = value.byteLength == 1024;
      workerPort.postMessage(res && napitest.NapiIsSendable(value));
      break;
    }
    case 'NapiWrapSendable': {
      let value = napitest.NapiCreateSendableObject();
      napitest.NapiWrapSendable(value, 'data');
      let res1 = napitest.NapiUnwrapSendable(value) == 'data';
      let res2 = napitest.NapiRemoveWrapSendable(value) == 'data';
      let res3 = napitest.NapiUnwrapSendable(value) == undefined;
      workerPort.postMessage(res1 && res2 && res3);
      break;
    }
    case 'NapiWrapSendableWithSize': {
      let value = napitest.NapiCreateSendableObject();
      napitest.NapiWrapSendableWithSize(value, 'data');
      let res1 = napitest.NapiUnwrapSendable(value) == 'data';
      let res2 = napitest.NapiRemoveWrapSendable(value) == 'data';
      let res3 = napitest.NapiUnwrapSendable(value) == undefined;
      workerPort.postMessage(res1 && res2 && res3);
      break;
    }
    default:
      break;
  }
};
